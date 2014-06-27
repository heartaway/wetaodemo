package com.taobao.jae.test.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: xinyuan.ymm
 * Date: 13-12-2
 * Time: 下午7:57
 */
@Controller
public class AdminController {

    @RequestMapping("/admin")
    public String indexPageNo(ModelMap model) {
        return "admin/index";
    }

    @RequestMapping("/admin/index")
    public String indexPage(ModelMap model) {
        return "admin/index";
    }

    @RequestMapping("/admin/anonymous")
    public String anonymousPage(ModelMap model) {
        return "admin/anonymous";
    }

    @RequestMapping("/admin/sitecustomer")
    public String sitecustomerPage(ModelMap model) {
        return "admin/sitecustomer";
    }

    @RequestMapping("/admin/developer")
    public String developerPage(ModelMap model) {
        return "admin/developer";
    }

}
