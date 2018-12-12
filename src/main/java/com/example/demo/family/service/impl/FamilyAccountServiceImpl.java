package com.example.demo.family.service.impl;

import com.example.demo.base.config.Msg;
import com.example.demo.base.enums.commom.IsDeleteEnum;
import com.example.demo.base.exception.BusFamilyErrorCode;
import com.example.demo.base.exception.BusinessException;
import com.example.demo.base.util.BeanUtil;
import com.example.demo.base.util.IdUtil;
import com.example.demo.family.mapper.FamilyAccountMapper;
import com.example.demo.family.model.FamilyAccount;
import com.example.demo.family.service.FamilyAccountService;
import com.example.demo.vo.family.request.FamilyAccountVO;
import com.example.demo.vo.family.response.ResponseFamilyAccountVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @program: prisondemo
 * @description:
 * @author: jiahao
 * @create: 2018-12-12 14:57
 **/
@Service("familyAccountService")
public class FamilyAccountServiceImpl implements FamilyAccountService {

    @Autowired
    private FamilyAccountMapper familyAccountMapper;
    @Autowired
    private Msg msg;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private ValueOperations valueOperations;

    /**
     * @param familyAccountVO :
     * @description 家属注册
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
    @Override
    public void register(FamilyAccountVO familyAccountVO) {
        String verifyCode = getNotExpiredRedis(familyAccountVO.getPhone());
        if(familyAccountVO.getVerifyCode().equals(verifyCode)){
            addFamilyAccount(familyAccountVO);
        }else{
            throw new BusinessException(BusFamilyErrorCode.VERIFY_CODE_ERROR);
        }
    }

    /**
     * @param phone
     * @description 发送短信验证码(设置有效期5分钟)(家属注册)
     * @author jiahao
     * @Date 2018/12/12 15:07
     */
    @Override
    public String sendSms(String phone) {
        String verifyCode = msg.sendSms(phone);
        valueOperations.set(phone,"verifyCode",60 * 60 * 2, TimeUnit.SECONDS);
        return verifyCode;
    }

    /**
     * @param familyAccountVO :
     * @description 添加家属登录帐号
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
    @Override
    public void addFamilyAccount(FamilyAccountVO familyAccountVO) {
        FamilyAccount build = FamilyAccount.builder()
                .id(IdUtil.generateId())
                .isDel(IsDeleteEnum.NOT_DELETE.getCode())
                .build();
        BeanUtil.copyPropertiesIgnoreNull(familyAccountVO,build);
        familyAccountMapper.insertSelective(build);
    }

    /**
     * @param familyAccountVO :
     * @description 修改家属登录帐号
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
    @Override
    public void modifyFamilyAccount(FamilyAccountVO familyAccountVO) {
        FamilyAccount build = FamilyAccount.builder()
                .updateTime(new Date())
                .build();
        BeanUtil.copyPropertiesIgnoreNull(familyAccountVO,build);
        familyAccountMapper.updateByPrimaryKeySelective(build);
    }

    /**
     * @param id :
     * @description 删除家属登录帐号
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
    @Override
    public void delFamilyAccount(Long id) {
        FamilyAccount build = FamilyAccount.builder()
                .id(id)
                .isDel(IsDeleteEnum.DELETE.getCode())
                .build();
        familyAccountMapper.updateByPrimaryKeySelective(build);
    }

    /**
     * @param familyAccountVO :
     * @description 筛选查询家属帐号列表(分页)
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
    @Override
    public PageInfo<List<ResponseFamilyAccountVO>> findFamilyAccountListPagination(FamilyAccountVO familyAccountVO) {
        PageHelper.startPage(familyAccountVO.getPageNum(),familyAccountVO.getPageSize());
        List<ResponseFamilyAccountVO> responseFamilyAccountVOS = familyAccountMapper.selectFamilyAccountList(familyAccountVO);
        PageInfo pageInfo = new PageInfo(responseFamilyAccountVOS);
        return pageInfo;
    }

    /**
     * @param familyAccountVO :
     * @description 筛选查询家属帐号列表
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
    @Override
    public List<ResponseFamilyAccountVO> findFamilyAccountList(FamilyAccountVO familyAccountVO) {
        List<ResponseFamilyAccountVO> responseFamilyAccountVOS = familyAccountMapper.selectFamilyAccountList(familyAccountVO);
        return responseFamilyAccountVOS;
    }

    /**
     * @param id :
     * @description 通过id查询家属帐号
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
    @Override
    public ResponseFamilyAccountVO findFamilyAccountById(Long id) {
        FamilyAccount build = FamilyAccount.builder()
                .id(id)
                .isDel(IsDeleteEnum.DELETE.getCode())
                .build();
        familyAccountMapper.selectByPrimaryKey(id);
        return null;
    }

    /**
     * @description 获取redis value
     * @author jiahao
     * @Date 2018/11/30 18:31
     */
    private String getNotExpiredRedis(String key) {
        Object value = valueOperations.get(key);
        Long expire = redisTemplate.getExpire(key, TimeUnit.SECONDS);
        System.out.println(key + "过期时间==>" + expire);
        if (expire != -2) {
            return value.toString();
        } else {
            return null;
        }
    }
}
