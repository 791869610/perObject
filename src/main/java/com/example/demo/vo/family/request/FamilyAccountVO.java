package com.example.demo.vo.family.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FamilyAccountVO {
    /**
     * 家属帐号id
     */
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
     * 验证码
     */
    private String verifyCode;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 监区id
     */
    private Long prisonPartitionId;

    /**
     * 被监管人员姓名
     */
    private String prisonerName;

    /**
     * 被监管人员编号
     */
    private String prisonerNumber;

    /**
     * 是否删除,1删除,2未删除
     */
    private Integer isDel;

    /**
     * 创建时间
     */
    private Date createTime = new Date();

    /**
     * 修改时间
     */
    private Date updateTime = new Date();

    /**
     * 预留字段
     */
    private String reserved;

    /**
     * 分页，每页展示条数
     */
    private Integer pageSize = 10;
    /**
     * 分页，页码
     */
    private Integer pageNum = 1;
}