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
@Table(name = "bus_family_account")
public class FamilyAccount {
    /**
     * 家属帐号id
     */
    @Id
    private Long id;

    /**
     * 注册手机号
     */
    private String phone;

    /**
     * 密码
     */
    private String password;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 监区id
     */
    @Column(name = "prison_partition_id")
    private Long prisonPartitionId;

    /**
     * 被监管人员姓名
     */
    @Column(name = "prisoner_name")
    private String prisonerName;

    /**
     * 被监管人员编号
     */
    @Column(name = "prisoner_number")
    private String prisonerNumber;

    /**
     * 是否删除,1删除,2未删除
     */
    @Column(name = "is_del")
    private Integer isDel;

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