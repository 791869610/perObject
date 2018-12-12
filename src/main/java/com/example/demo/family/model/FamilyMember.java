package com.example.demo.family.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "bus_family_member")
public class FamilyMember {
    /**
     * id
     */
    @Id
    private Long id;

    /**
     * 家属帐号id
     */
    @Column(name = "family_account_id")
    private Long familyAccountId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 身份证
     */
    @Column(name = "id_card")
    private String idCard;

    /**
     * 民族
     */
    private String nationality;

    /**
     * 性别(1男,2女)
     */
    private Integer gender;

    /**
     * 关系(所在字典表type_value)
     */
    @Column(name = "relationship_dic_type_value")
    private Integer relationshipDicTypeValue;

    /**
     * 关系(所在字典表type_value)
     */
    @Column(name = "relationship_dic_item_value")
    private Integer relationshipDicItemValue;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 家庭住址
     */
    @Column(name = "home_address")
    private String homeAddress;

    /**
     * 家属本人照片
     */
    private String photo;

    /**
     * 是否删除,1删除,2未删除
     */
    @Column(name = "is_del")
    private Integer isDel;

    /**
     * 审核状态(1待审核,2审核通过,3不通过,4删除)
     */
    @Column(name = "review_state")
    private Integer reviewState;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 修改时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 预留字段
     */
    private String reserved;
}