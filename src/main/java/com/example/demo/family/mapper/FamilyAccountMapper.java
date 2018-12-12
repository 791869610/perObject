package com.example.demo.family.mapper;

import com.example.demo.base.config.MyBaseMapper;
import com.example.demo.family.model.FamilyAccount;
import com.example.demo.vo.family.request.FamilyAccountVO;
import com.example.demo.vo.family.response.ResponseFamilyAccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface FamilyAccountMapper extends MyBaseMapper<FamilyAccount> {

    /**
     * @param familyAccountVO :
     * @description 筛选查询家属帐号列表
     * @author jiahao
     * @Date 2018/12/12 14:59
     */
//    List<ResponseFamilyAccountVO> selectFamilyAccountList(FamilyAccountVO familyAccountVO);
}