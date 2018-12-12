package com.example.demo.family.service;

import com.example.demo.vo.family.request.FamilyAccountVO;
import com.example.demo.vo.family.response.ResponseFamilyAccountVO;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
  * @Description: 家属登录帐号接口
  * @author: jiahao
  * @Date: 2018/12/12 14:56
  */
public interface FamilyAccountService {
    
    /**
     * @param familyAccountVO :  
     * @description 家属注册
     * @author  jiahao 
     * @Date  2018/12/12 14:59
     */ 
    void register(FamilyAccountVO familyAccountVO);

    /**
     * @description 发送短信验证码(设置有效期5分钟)(家属注册)
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    String sendSms(String phone);

    /**
     * @param familyAccountVO :
     * @description 添加家属登录帐号
     * @author  jiahao
     * @Date  2018/12/12 14:59
     */
    void addFamilyAccount(FamilyAccountVO familyAccountVO);

    /**
     * @param familyAccountVO :
     * @description 修改家属登录帐号
     * @author  jiahao
     * @Date  2018/12/12 14:59
     */
    void modifyFamilyAccount(FamilyAccountVO familyAccountVO);

    /**
     * @param id :
     * @description 删除家属登录帐号
     * @author  jiahao
     * @Date  2018/12/12 14:59
     */
    void delFamilyAccount(Long id);

    /**
     * @param familyAccountVO :
     * @description 筛选查询家属帐号列表(分页)
     * @author  jiahao
     * @Date  2018/12/12 14:59
     */
    PageInfo<List<ResponseFamilyAccountVO>> findFamilyAccountListPagination(FamilyAccountVO familyAccountVO);

    /**
     * @param familyAccountVO :
     * @description 筛选查询家属帐号列表
     * @author  jiahao
     * @Date  2018/12/12 14:59
     */
    List<ResponseFamilyAccountVO> findFamilyAccountList(FamilyAccountVO familyAccountVO);

    /**
     * @param id :
     * @description 通过id查询家属帐号
     * @author  jiahao
     * @Date  2018/12/12 14:59
     */
    ResponseFamilyAccountVO findFamilyAccountById(Long id);

    void test();

}
