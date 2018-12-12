package com.example.demo.family.controller;

import com.example.demo.base.json.JsonData;
import com.example.demo.family.service.FamilyAccountService;
import com.example.demo.vo.family.request.FamilyAccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @program: prisondemo
 * @description: 家属登录帐号控制层
 * @author: jiahao
 * @create: 2018-12-12 15:04
 **/
@RestController
@RequestMapping("app/family")
public class FamilyAccountController {

    @Autowired
    FamilyAccountService familyAccountService;

    /**
     * @param familyAccountVO :
     * @description 家属注册
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @PostMapping("register")
    public JsonData register(HttpServletRequest request,FamilyAccountVO familyAccountVO) {
//        familyAccountService.register(familyAccountVO);
        System.out.println("request"+request);
        System.out.println("session"+request.getSession());
        System.out.println("verifyCode"+request.getSession().getAttribute("verifyCode"));
        return JsonData.ok();
    }

    /**
     * @description 发送短信验证码(设置有效期2分钟)(家属注册)
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @PostMapping("sendSms")
    public JsonData sendSms(HttpServletRequest request, String phone) {
//        String verifyCode = familyAccountService.sendSms(phone);
        String verifyCode = phone;
        HttpSession session = request.getSession();
        session.setAttribute("verifyCode",verifyCode);
        session.setMaxInactiveInterval(120);
        return JsonData.ok(verifyCode);
    }

    /**
     * @param familyAccountVO :
     * @description 修改注册信息
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @PutMapping
    public JsonData modifyFamilyAccount(FamilyAccountVO familyAccountVO) {
        familyAccountService.modifyFamilyAccount(familyAccountVO);
        return JsonData.ok();
    }

    /**
     * @param id :
     * @description 删除用户注册信息
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @DeleteMapping("{id}")
    public JsonData delFamilyAccount(@PathVariable("id") Long id) {
        familyAccountService.delFamilyAccount(id);
        return JsonData.ok();
    }

    /**
     * @param id :
     * @description 通过id查询家属帐号
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @GetMapping("{id}")
    public JsonData findFamilyAccountById(@PathVariable("id") Long id) {
        familyAccountService.findFamilyAccountById(id);
        return JsonData.ok();
    }

    /**
     * @param familyAccountVO :
     * @description 筛选查询家属帐号列表
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @GetMapping("findFamilyAccountList")
    public JsonData findFamilyAccountList(FamilyAccountVO familyAccountVO) {
        familyAccountService.findFamilyAccountList(familyAccountVO);
        return JsonData.ok();
    }

    /**
     * @param familyAccountVO :
     * @description 筛选查询家属帐号列表(分页)
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @GetMapping("findFamilyAccountListPagination")
    public JsonData findFamilyAccountListPagination(FamilyAccountVO familyAccountVO) {
        familyAccountService.findFamilyAccountListPagination(familyAccountVO);
        return JsonData.ok();
    }

    @PostMapping("test")
    public JsonData test() {
        familyAccountService.test();
        return JsonData.ok();
    }
}
