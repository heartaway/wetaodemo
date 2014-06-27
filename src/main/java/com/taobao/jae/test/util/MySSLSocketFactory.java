package com.taobao.jae.test.util;

import org.apache.http.conn.ssl.SSLSocketFactory;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.*;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * Created with IntelliJ IDEA.
 * User: dinghui.dh
 * Date: 14-1-16
 * Time: 上午10:04
 * To change this template use File | Settings | File Templates.
 */
public class MySSLSocketFactory extends SSLSocketFactory {
	SSLContext sslContext = SSLContext.getInstance("TLS");

	public MySSLSocketFactory(KeyStore trustStore) throws NoSuchAlgorithmException, KeyManagementException,
			KeyStoreException, UnrecoverableKeyException{
		super(trustStore);
		TrustManager tm = new X509TrustManager() {
			@Override
			public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
				//To change body of implemented methods use File | Settings | File Templates.
			}

			@Override
			public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
				//To change body of implemented methods use File | Settings | File Templates.
			}

			@Override
			public X509Certificate[] getAcceptedIssuers() {
				return new X509Certificate[0];  //To change body of implemented methods use File | Settings | File Templates.
			}
		};
		sslContext.init(null, new TrustManager[]{tm}, null	);
	}

	@Override
	public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException, UnknownHostException{
		return sslContext.getSocketFactory().createSocket(socket, host, port, autoClose);
	}

	@Override
	public Socket createSocket() throws IOException{
		return sslContext.getSocketFactory().createSocket();
	}
}
