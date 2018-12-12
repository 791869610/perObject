package com.example.demo.family.mapper;

import com.example.demo.base.config.MyBaseMapper;
import com.example.demo.family.model.FamilyMember;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface FamilyMemberMapper extends MyBaseMapper<FamilyMember> {
}