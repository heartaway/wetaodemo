package com.taobao.jae.test.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.io.*;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

public class HttpConnection {
	private static Log log = LogFactory.getLog(HttpConnection.class);
	private final static String defaultEncoding = "UTF-8";
	private final static String gzip = "gzip";
	private final static int defaultConnectionTime = 60 * 1000;
	private final static int defaultTimeOut = 30 * 1000;
	private int connectionTime = -1;
	private int timeout = -1;

	private int port = -1;

	public static HttpConnection getInstance(int connectionTime, int timeout) {
		HttpConnection httpConnection = new HttpConnection();
		httpConnection.setTimeout(timeout);
		httpConnection.setConnectionTime(connectionTime);
		return httpConnection;
	}

	private HttpConnection() {

	}

	/**
	 * @return
	 */
	private HttpClient getHttpClient() {
		DefaultHttpClient httpClient = new DefaultHttpClient();
		HttpParams params = httpClient.getParams();
		HttpConnectionParams.setConnectionTimeout(params, connectionTime > 0 ? connectionTime : defaultConnectionTime);
		HttpConnectionParams.setSoTimeout(params, timeout > 0 ? timeout : defaultTimeOut);

		return httpClient;
	}

	private HttpClient getNewHttpClient(){
		try{
			KeyStore trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
			trustStore.load(null, null);
			SSLSocketFactory sf = new MySSLSocketFactory(trustStore);
			sf.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
			HttpParams params = new BasicHttpParams();
			HttpProtocolParams.setVersion(params, HttpVersion.HTTP_1_1);
			HttpProtocolParams.setContentCharset(params, HTTP.UTF_8);
			SchemeRegistry registry = new SchemeRegistry();
			registry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
			registry.register(new Scheme("https", sf, 443));
			ClientConnectionManager ccm = new ThreadSafeClientConnManager(params, registry);
			return new DefaultHttpClient(ccm, params);
		}catch (Exception e){
			return new DefaultHttpClient();
		}
	}

	public String fetchByPost(String url, Map<String, String> parms) {
		return fetchByPost(url, parms, defaultEncoding);
	}

	public String fetchByPost(String url, Map<String, String> parms, String encoding) {
		List<NameValuePair> list = new ArrayList<NameValuePair>();
		if (parms != null) {
			for (Map.Entry<String, String> e : parms.entrySet()) {
				list.add(new BasicNameValuePair(e.getKey(), e.getValue()));
			}
		}

		try {
			HttpEntity requestHttpEntity = new UrlEncodedFormEntity(list);
			encoding = StringUtils.isBlank(encoding) ? defaultEncoding : encoding;
			return fetchByPost(url, requestHttpEntity, encoding);
		} catch (UnsupportedEncodingException e) {
			log.error("", e);
			return null;
		}
	}

	public String fetchByPost(String url, List<NameValuePair> parms, String encoding) {

		try {
			HttpEntity requestHttpEntity = new UrlEncodedFormEntity(parms, encoding);
			encoding = StringUtils.isBlank(encoding) ? defaultEncoding : encoding;

			return fetchByPost(url, requestHttpEntity, encoding);
		} catch (UnsupportedEncodingException e) {
			log.error("", e);
			return null;
		}
	}

	public String fetchByGet(String url, List<NameValuePair> params, String encoding) {
		String Result = null;
		String param = URLEncodedUtils.format(params, encoding);
		log.info("Http Get Parmas:" + param);
		HttpGet httpRequest = new HttpGet(url + "?" + param);
		log.info("Start to execute http get request \"" + url + "?" + param + "\"");
		HttpResponse httpResponse;
		try {
			httpResponse = new DefaultHttpClient().execute(httpRequest);

			if (httpResponse.getStatusLine().getStatusCode() == 200) {
				Result = EntityUtils.toString(httpResponse.getEntity(), encoding);

			}
		} catch (ClientProtocolException e) {

			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return Result;
	}

	public String fetchByPost(String url, HttpEntity requestHttpEntity, String encoding) {
		HttpPost post = null;
		InputStream in = null;
		try {
			DefaultHttpClient httpClient = (DefaultHttpClient) getNewHttpClient();
			httpClient.getParams().setParameter("http.socket.timeout", new Integer(30000));

			post = new HttpPost(url);

			post.setEntity(requestHttpEntity);
			HttpResponse res = httpClient.execute(post);
			if (res.getEntity() == null) {
				log.info("没有获取返回信息 ->" + url);
				return null;
			}
			in = this.getInput(res);
			return getStringContentFromInputStream(in, encoding);
		} catch (Exception e) {
			log.error("", e);
		} finally {
			if (post != null)
				post.abort();
		}
		return null;
	}

	private String getStringContentFromInputStream(InputStream in, String encoding) {
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(in, encoding));
			String tmp = null;
			int lineNum = 0;
			StringBuffer sb = new StringBuffer("");
			while ((tmp = br.readLine()) != null) {
				if (lineNum == 0) {
					tmp = "\n" + tmp;
					lineNum++;
				}
				sb.append(tmp);
			}

			return sb.toString();
		} catch (Exception e) {
			log.error("", e);
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					log.error("", e);
				}
			}
		}

		return null;
	}

	/**
	 * 如果是gzip格式的返回，对inputstream做个包装
	 *
	 * @param response
	 * @return
	 */
	private InputStream getInput(HttpResponse response) throws IOException {
		InputStream in = response.getEntity().getContent();
		Header[] headers = response.getHeaders("content-encoding");
		for (Header header : headers) {
			if (header.getValue().equalsIgnoreCase(gzip)) {
				in = new GZIPInputStream(in);
				break;
			}
		}
		return in;
	}

	public void setConnectionTime(int connectionTime) {
		this.connectionTime = connectionTime;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public int getConnectionTime() {
		return connectionTime;
	}

	public int getTimeout() {
		return timeout;
	}

	public int getPort() {
		return port;
	}
}
