-- prison_visit 监狱探视
-- create database prison_visit_quartz default character set utf8mb4 collate utf8mb4_general_ci;

DROP TABLE IF EXISTS `bus_prison`;
CREATE TABLE `bus_prison` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '所在省id',
  `city_id` int(11) DEFAULT NULL DEFAULT '0' COMMENT '所在市id',
  `name` varchar(50) DEFAULT NULL DEFAULT '' COMMENT '监狱名',
  `type_dic_type_value` int(4) NOT NULL DEFAULT '0' COMMENT '监狱类型(所在字典表type_value)',
  `type_dic_item_value` int(4) NOT NULL DEFAULT '0' COMMENT '监狱类型(所在字典表item_value)',
  `contact` varchar(50) NOT NULL DEFAULT '' COMMENT '监狱联系人',
  `contact_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '监狱联系人电话',
  `video_quality_dic_type_value` int(4) NOT NULL DEFAULT '0' COMMENT '视频质量(所在字典表type_value)',
  `video_quality_dic_item_value` int(4) NOT NULL DEFAULT '0' COMMENT '视频质量(所在字典表item_value)',
  `call_price` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '通话价格(元/次)',
  `is_permit_remit_money` int(4) NOT NULL DEFAULT '1' COMMENT '是否允许汇款(1允许,2不允许)',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监狱表';


DROP TABLE IF EXISTS `bus_prison_fund_account`;
CREATE TABLE `bus_prison_fund_account` (
  `prison_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `bank_card_number` varchar(20) NOT NULL DEFAULT '' COMMENT '监狱账户银行卡号',
  `remit_money_handling_fee` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '汇款手续费(元)',
  `remit_money_handling_fee_rate` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '汇款手续费(%)',
  `permit_remit_money_times` int(4) NOT NULL DEFAULT '0' COMMENT '默认每月可汇款次数(0为不限)',
  `permit_remit_money_Interval` int(4) NOT NULL DEFAULT '0' COMMENT '默认每月汇款间隔时长(0为不限)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监狱资金账户表';


DROP TABLE IF EXISTS `bus_detention_state`;
CREATE TABLE `bus_detention_state` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '状态名称',
  `weight` int(4) DEFAULT NULL DEFAULT '0' COMMENT '排序',
  `prison` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属监狱id(系统配置为0)',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在押状态配置';


DROP TABLE IF EXISTS `bus_sentence_level`;
CREATE TABLE `bus_sentence_level` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '级别名称',
  `weight` int(4) DEFAULT NULL DEFAULT '0' COMMENT '排序',
  `prison` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属监狱id(系统配置为0)',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服刑级别配置';


DROP TABLE IF EXISTS `bus_visit_duration`;
CREATE TABLE `bus_visit_duration` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `visit_duration` int(11) NOT NULL DEFAULT '0' COMMENT '通话时长(分钟)',
  `weight` int(4) DEFAULT NULL DEFAULT '0' COMMENT '排序',
  `prison` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属监狱id(系统配置为0)',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会见时长配置';


DROP TABLE IF EXISTS `bus_face_recognition`;
CREATE TABLE `bus_face_recognition` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '人脸识别频率(次/分钟)',
  `prison` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属监狱id(系统配置为0)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人脸识别配置';


DROP TABLE IF EXISTS `bus_question`;
CREATE TABLE `bus_question` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `content` text COMMENT '问题/答案详情',
  `prison` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属监狱id(系统配置为0)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='常见问题配置';


DROP TABLE IF EXISTS `bus_client_remit_money`;
CREATE TABLE `bus_client_remit_money` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `content` text COMMENT '汇款详情',
  `prison` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属监狱id(系统配置为0)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端汇款配置';


DROP TABLE IF EXISTS `bus_equipment`;
CREATE TABLE `bus_equipment` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '设备类型',
  `identification_code` varchar(50) NOT NULL DEFAULT '' COMMENT '唯一标识码',
  `extranet_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '外网ip',
  `intranet_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '内网ip',
  `state` int(4) DEFAULT 2 COMMENT '在线状态(1在线,2离线)',
  `remark` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `prison` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属监狱id',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `off_line_time` datetime DEFAULT NULL COMMENT '离线时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备配置';

--  ------------
--  业务
--  ------------
DROP TABLE IF EXISTS `bus_prisoner`;
CREATE TABLE `bus_prisoner` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被监管人员id',
  `number` varchar(50) NOT NULL DEFAULT '' COMMENT '被监管人员编号',
  `name` varchar(50) DEFAULT NULL DEFAULT '' COMMENT '被监管人员姓名',
  `photo` varchar(255) DEFAULT NULL DEFAULT '' COMMENT '被监管人员照片',
  `id_card` varchar(50) DEFAULT NULL DEFAULT '' COMMENT '被监管人员身份证',
  `gender` int(4) DEFAULT NULL DEFAULT '1' COMMENT '被监管人员性别(1男,2女)',
  `nationality` varchar(20) DEFAULT NULL DEFAULT '' COMMENT '被监管人员名族',
  `birth_place` varchar(50) DEFAULT NULL DEFAULT '' COMMENT '被监管人员籍贯',
  `birth_day` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '被监管人员生日',
  `home_address` varchar(50) NOT NULL DEFAULT '' COMMENT '家庭住址',
  `crime` varchar(50) NOT NULL DEFAULT '' COMMENT '罪名',
  `into_the_prison_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入监时间',
  `prison_partition_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `detention_state_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '在押状态id',
  `visit_times` int(4) NOT NULL DEFAULT '0' COMMENT '本月已探访次数',
  `prison_sentence_level_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '服刑级别id',
  `prison_quarters_number` varchar(50) NOT NULL DEFAULT '' COMMENT '监仓',
  `is_special_treatment` int(4) NOT NULL DEFAULT '1' COMMENT '特殊待遇(1是,2否)',
  `is_key_monitoring` int(4) NOT NULL DEFAULT '1' COMMENT '重点监控(1是,2否)',
  `permit_visit_times_per_month` int(4) NOT NULL DEFAULT '0' COMMENT '每月可会见次数(0为不限)',
  `permit_visit_times_everyday` int(4) NOT NULL DEFAULT '0' COMMENT '每天可会见次数(0为不限)',
  `suggest_visit_duration_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '每次会见建议时长id',
  `is_permit_remit_money` int(4) NOT NULL DEFAULT '1' COMMENT '是否允许汇款(1允许,2不允许)',
  `account_state` int(4) DEFAULT 1 COMMENT '用户状态，0禁用，1激活',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='被监管人员信息表';


DROP TABLE IF EXISTS `bus_prisoner_fund_account`;
CREATE TABLE `bus_prisoner_fund_account` (
  `prisoner_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被监管人员id',
  `bank_card_number` varchar(20) NOT NULL DEFAULT '' COMMENT '被监管人银行卡号',
  `permit_remit_money_times` int(4) NOT NULL DEFAULT '0' COMMENT '每月可汇款次数(0为不限)',
  `permit_remit_money_Interval` int(4) NOT NULL DEFAULT '0' COMMENT '每月汇款间隔时长(0为不限)',
  `max_remit_money_single_time` int(10) NOT NULL DEFAULT '0' COMMENT '单次汇款上限',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='被监管人员资金账户表';


DROP TABLE IF EXISTS `bus_prison_partition`;
CREATE TABLE `bus_prison_partition` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `prison_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '监狱名称',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监区表';


DROP TABLE IF EXISTS `bus_family_account`;
CREATE TABLE `bus_family_account` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '注册手机号',
  `password` varchar(50) DEFAULT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(50) DEFAULT NULL DEFAULT '' COMMENT '邮箱',
  `prison_partition_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `prisoner_name` varchar(50) DEFAULT NULL DEFAULT '' COMMENT '被监管人员姓名',
  `prisoner_number` varchar(50) NOT NULL DEFAULT '' COMMENT '被监管人员编号',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家属帐号表';

DROP TABLE IF EXISTS `bus_family_member`;
CREATE TABLE `bus_family_member` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `id_card` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证',
  `nationality` varchar(20) DEFAULT NULL DEFAULT '' COMMENT '民族',
  `gender` int(4) DEFAULT NULL DEFAULT '0' COMMENT '性别(1男,2女)',
  `relationship_dic_type_value` int(4) DEFAULT NULL DEFAULT '0' COMMENT '关系(所在字典表type_value)',
  `relationship_dic_item_value` int(4) DEFAULT NULL DEFAULT '0' COMMENT '关系(所在字典表type_value)',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `home_address` varchar(50) NOT NULL DEFAULT '' COMMENT '家庭住址',
  `photo` varchar(255) DEFAULT NULL DEFAULT '' COMMENT '家属本人照片',
  `is_del` int(4) DEFAULT 2 COMMENT '是否删除,1删除,2未删除',
  `review_state` int(4) NOT NULL DEFAULT '0' COMMENT '审核状态(1待审核,2审核通过,3不通过,4删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家属人员表';


DROP TABLE IF EXISTS `bus_reservation_record`;
CREATE TABLE `bus_reservation_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `prisoner_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被探视人id',
  `prisoner_name` varchar(50) NOT NULL DEFAULT '' COMMENT '被探视人姓名',
  `prisoner_number` varchar(50) NOT NULL DEFAULT '' COMMENT '被监管人员编号',
  `prison_partition_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '监区名称',
  `prison_quarters_number` varchar(50) NOT NULL DEFAULT '' COMMENT '监仓',
  `prisoner_family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '探视人账户id',
  `family_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '家属备注',
  `scheduling_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '排班备注',
  `review_state` int(4) NOT NULL DEFAULT '0' COMMENT '审核状态(1待审核,2审核通过待安排,3安排完成待会见,4未批准,5,家属已取消,6通话中,7已通话)',
  `reservation_state` int(4) NOT NULL DEFAULT '0' COMMENT '预约状态(1待审核,2审核通过待安排,3安排完成待会见,4未批准,5,家属已取消,6通话中,7已通话)',
  `start_visit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始会见时间',
  `end_visit_time` datetime DEFAULT NULL COMMENT '结束会见时间(null为不限)',
  `start_scheduling_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '安排时间(开始时间)',
  `end_scheduling_time` datetime DEFAULT NULL COMMENT '安排时间(结束时间)(null为不限)',
  `refuse_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '(审核)操作员',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='探视预约记录表';


DROP TABLE IF EXISTS `bus_visit_record`;
CREATE TABLE `bus_visit_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `reservation_record_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '预约记录id',
  `prisoner_family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '探视人账户id',
  `prisoner_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被探视人id',
  `video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '录像地址(探视成功)',
  `video_cover_url` varchar(255) NOT NULL DEFAULT '' COMMENT '录像封面地址(探视成功)',
  `start_visit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始会见时间',
  `end_visit_time` datetime DEFAULT NULL COMMENT '结束会见时间(null为不限)',
  `visit_duration` int(11) NOT NULL DEFAULT '0' COMMENT '会见时长(分钟)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会见记录表';


DROP TABLE IF EXISTS `bus_reservation_record_family_middle`;
CREATE TABLE `bus_reservation_record_family_middle` (
  `reservation_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '预约id',
  `family_member_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '探视人家属id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='探视预约记录家属中间表';


DROP TABLE IF EXISTS `bus_family_message`;
CREATE TABLE `bus_family_message` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `prision_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `partition_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `prisioner_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被探视人id',
  `family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '消息内容',
  `state` int(4) NOT NULL DEFAULT '1' COMMENT '消息状态(1未读,2已读)',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '(发送信息)操作员',
  `msg_sent_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发送时间',
  `msg_read_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息读取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家属消息表';


DROP TABLE IF EXISTS `bus_video_visit_account`;
CREATE TABLE `bus_video_visit_account` (
  `family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`family_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家属(平台)账户表';


DROP TABLE IF EXISTS `bus_video_visit_recharge_record`;
CREATE TABLE `bus_video_visit_recharge_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '充值记录id',
  `family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `tripartite_flow_number` varchar(50) NOT NULL DEFAULT '' COMMENT '三方流水号',
  `recharge_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `balance_after_recharge` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '充值后账户余额',
  `certificate` varchar(255) NOT NULL DEFAULT '' COMMENT '凭证',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `recharge_terminal_dic_type_value` int(4) NOT NULL DEFAULT '0' COMMENT '充值终端(所在字典表type_value)',
  `recharge_terminal_dic_item_value` int(4) NOT NULL DEFAULT '0' COMMENT '充值终端(所在字典表type_value)',
  `recharge_way_dic_type_value` int(4) NOT NULL DEFAULT '0' COMMENT '充值方式(所在字典表type_value)',
  `recharge_way_dic_item_value` int(4) NOT NULL DEFAULT '0' COMMENT '充值方式(所在字典表type_value)',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作员(代充的时候)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(充值时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家属充值(平台)明细表';


DROP TABLE IF EXISTS `bus_video_visit_consume_record`;
CREATE TABLE `bus_video_visit_consume_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '消费记录id',
  `family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `tripartite_flow_number` varchar(50) NOT NULL DEFAULT '' COMMENT '三方流水号',
  `consume_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费金额',
  `balance_after_consume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费后账户余额',
  `consume_type_dic_type_value` int(4) NOT NULL DEFAULT '0' COMMENT '消费类型(所在字典表type_value)',
  `consume_type_dic_item_value` int(4) NOT NULL DEFAULT '0' COMMENT '消费类型(所在字典表type_value)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(消费时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家属消费(平台)明细表';


DROP TABLE IF EXISTS `bus_prisoner_family_remit_record`;
CREATE TABLE `bus_prisoner_family_remit_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '汇款记录id',
  `family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `tripartite_flow_number` varchar(50) NOT NULL DEFAULT '' COMMENT '三方流水号',
  `accept_bank_card_number` varchar(20) NOT NULL DEFAULT '' COMMENT '接收方银行卡号',
  `accept_type` int(4) NOT NULL DEFAULT '1' COMMENT '接收方类型(1被探视人,2监狱)',
  `remit_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '汇款金额',
  `remit_server_charge` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `remit_way_dic_type_value` int(4) NOT NULL DEFAULT '0' COMMENT '汇款方式(所在字典表type_value)',
  `remit_way_dic_item_value` int(4) NOT NULL DEFAULT '0' COMMENT '汇款方式(所在字典表type_value)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(充值时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='家属汇款(监狱/被探视人)明细表';


DROP TABLE IF EXISTS `bus_platform_refund_record`;
CREATE TABLE `bus_platform_refund_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '退款记录id',
  `consume_record_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '消费记录ID',
  `tripartite_flow_number` varchar(50) NOT NULL DEFAULT '' COMMENT '三方流水号',
  `refund_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作员',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `reserved` varchar(255) NOT NULL DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台退款(家属)记录表';


DROP TABLE IF EXISTS `bus_platform_settle_record`;
CREATE TABLE `bus_platform_settle_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算记录id',
  `family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '家属帐号id',
  `tripartite_flow_number` varchar(50) NOT NULL DEFAULT '' COMMENT '三方流水号',
  `settle_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  `amount_before_settle` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '结算前金额',
  `amount_after_settle` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '结算后金额',
  `certificate` varchar(255) NOT NULL DEFAULT '' COMMENT '凭证',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作员',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(结算时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台结算(家属)记录表';


DROP TABLE IF EXISTS `bus_prison_scheduling`;
CREATE TABLE `bus_prison_scheduling` (
  `reservation_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '预约id',
  `prisoner_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被探视人id',
  `prisoner_name` varchar(50) NOT NULL DEFAULT '' COMMENT '被探视人姓名',
  `prisoner_number` varchar(50) NOT NULL DEFAULT '' COMMENT '被监管人员编号',
  `prison_partition_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '监区名称',
  `prison_quarters_number` varchar(50) NOT NULL DEFAULT '' COMMENT '监仓',
  `prisoner_family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '探视人账户id',
  `start_scheduling_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '安排时间(开始时间)',
  `end_scheduling_time` datetime DEFAULT NULL COMMENT '安排时间(结束时间)(null为不限)',
  `visit_duration` int(11) NOT NULL DEFAULT '0' COMMENT '本次通话时长',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(结算时间)',
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='监狱排班表';


DROP TABLE IF EXISTS `bus_prison_announcement`;
CREATE TABLE `bus_prison_announcement` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `start_display_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '公告显示时间(开始时间)',
  `end_display_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '公告显示时间(结束时间)',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `state` int(4) NOT NULL DEFAULT '2' COMMENT '状态(1启用,2禁用)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(结算时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='租户端公告表';


DROP TABLE IF EXISTS `bus_prison_announcement_middle`;
CREATE TABLE `bus_prison_announcement_middle` (
  `announcement_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公告id',
  `prison_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(结算时间)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='租户端公告中间表';


DROP TABLE IF EXISTS `bus_prisoner_family_announcement`;
CREATE TABLE `bus_prisoner_family_announcement` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `prison_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `start_display_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '公告显示时间(开始时间)',
  `end_display_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '公告显示时间(结束时间)',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `state` int(4) NOT NULL DEFAULT '2' COMMENT '状态(1启用,2禁用)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(结算时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端公告表';


DROP TABLE IF EXISTS `bus_msg_configuration`;
CREATE TABLE `bus_msg_configuration` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `prison_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `start_accept_msg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接受短信时间(开始时间)',
  `end_accept_msg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '接受短信时间(结束时间)',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `state` int(4) NOT NULL DEFAULT '1' COMMENT '状态(1启用,2禁用)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(结算时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信通知配置表';


DROP TABLE IF EXISTS `bus_msg_configuration_partition_middle`;
CREATE TABLE `bus_msg_configuration_partition_middle` (
  `msg_configuration_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '短信通知配置id',
  `partition_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(结算时间)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信通知配置监区中间表';


DROP TABLE IF EXISTS `bus_prisoner_family_account_flow`;
CREATE TABLE `bus_prisoner_family_account_flow` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `change_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单次变动金额',
  `balance_before_change` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '变动前账户余额',
  `balance_after_change` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单次变动金额',
  `partition_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '类型(1充值,2退款,3结算)',
  `record_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作记录id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='被探视人家属账户流水表';


DROP TABLE IF EXISTS `bus_platform_business_flow`;
CREATE TABLE `bus_platform_business_flow` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `change_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单次变动金额',
  `balance_before_change` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '变动前账户余额',
  `balance_after_change` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单次变动金额',
  `partition_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '类型(1充值,2退款,3结算)',
  `record_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作记录id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台业务流水表';


DROP TABLE IF EXISTS `bus_platform_system_flow`;
CREATE TABLE `bus_platform_system_flow` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `change_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单次变动金额',
  `balance_before_change` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '变动前账户余额',
  `balance_after_change` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单次变动金额',
  `partition_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监区id',
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '类型(1视屏,2短信,3其他)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台系统流水表';


DROP TABLE IF EXISTS `bus_platform_system_flow_record_middle`;
CREATE TABLE `bus_platform_system_flow_record_middle` (
  `platform_system_flow_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '流水id',
  `platform_system_consume_record_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '消费记录id',
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '类型(1视屏,2短信)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台系统流水表';


DROP TABLE IF EXISTS `bus_platform_system_msg_consume_record`;
CREATE TABLE `bus_platform_system_msg_consume_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '消费记录id',
  `prison_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `msg_configuration_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '短信配置id',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '短信接收方手机号(监狱管理员手机号)',
  `tripartite_flow_number` varchar(50) NOT NULL DEFAULT '' COMMENT '三方流水号',
  `consume_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费金额',
  `amount_before_consume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费前金额',
  `amount_after_consume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费后金额',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作员',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(消费时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台系统短信消费记录表';


DROP TABLE IF EXISTS `bus_platform_system_visit_consume_record`;
CREATE TABLE `bus_platform_system_visit_consume_record` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '消费记录id',
  `prison_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '监狱id',
  `reservation_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '预约id',
  `prisoner_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '被探视人id',
  `prisoner_name` varchar(50) NOT NULL DEFAULT '' COMMENT '被探视人姓名',
  `prisoner_number` varchar(50) NOT NULL DEFAULT '' COMMENT '被监管人员编号',
  `prison_partition_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '监区名称',
  `prison_quarters_number` varchar(50) NOT NULL DEFAULT '' COMMENT '监仓',
  `prisoner_family_account_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '探视人账户id',
  `tripartite_flow_number` varchar(50) NOT NULL DEFAULT '' COMMENT '三方流水号',
  `consume_money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费金额',
  `amount_before_consume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费前金额',
  `amount_after_consume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '消费后金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间(消费时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台系统探视(视频)消费记录表';


DROP TABLE IF EXISTS `sys_prison_role`;
CREATE TABLE `sys_prison_role` (
  `id` bigint(32) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '角色名称',
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '类型',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  `state` int(4) DEFAULT '1' COMMENT '状态 1是正常',
  `is_del` int(4) NOT NULL DEFAULT '2' COMMENT '是否删除 1 删除 2 没有删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='监狱角色表';

DROP TABLE IF EXISTS `sys_prison_acl`;
CREATE TABLE `sys_prison_acl` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '权限名称',
  `code` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '权限码',
  `url` varchar(500) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '资源访问路径url,restful需要填正则表达式',
  `type` int(4) NOT NULL DEFAULT '3' COMMENT '类型，1是菜单 2是按钮 3是其他...',
  `remark` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '备注',
  `state` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1是正常',
  `seq` int(4) NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `is_del` int(4) NOT NULL DEFAULT '2' COMMENT '是否删除 1 删除 2 未删除 ',
  `acl_module_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '权限模块id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='监狱权限表';

DROP TABLE IF EXISTS `sys_prison_acl_module`;
CREATE TABLE `sys_prison_acl_module` (
  `id` bigint(32) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '权限模块名称',
  `parent_id` bigint(32) NOT NULL DEFAULT '0' COMMENT '上级id',
  `level` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '权限模块层级',
  `state` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '权限模块在当前层级下的顺序,由小到大',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='监狱权限模块表';

DROP TABLE IF EXISTS `sys_prison_role_acl`;
CREATE TABLE `sys_prison_role_acl` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `acl_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='监狱角色权限表';

DROP TABLE IF EXISTS `sys_prison_role_user`;
CREATE TABLE `sys_prison_role_user` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='监狱角色用户表';

DROP TABLE IF EXISTS `sys_platform_user`;
CREATE TABLE `sys_platform_user` (
  `id` bigint(20) NOT NULL,
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `lgin_id` VARCHAR(50) NOT NULL COMMENT '登录id',
  `password` VARCHAR(50) NOT NULL COMMENT '密码',
  `state` INTEGER(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `is_del` INTEGER(11) NOT NULL DEFAULT 2 COMMENT '是否删除 1删除 2没删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='平台用户表';

DROP TABLE IF EXISTS `bus_prison_user`;
CREATE TABLE `bus_prison_user` (
  `id` bigint(20) NOT NULL,
  `username` VARCHAR(50) NOT NULL COMMENT '使用者名字',
  `login_id` VARCHAR(50) NOT NULL COMMENT '登录id',
  `password` VARCHAR(50) NOT NULL COMMENT '密码',
  `type` int(4) NOT NULL DEFAULT 1 COMMENT '类型(1狱警)',
  `state` INTEGER(11) NOT NULL DEFAULT 1 COMMENT '状态',
  `is_del` INTEGER(11) NOT NULL DEFAULT 2 COMMENT '是否删除 1删除 2没删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='监狱用户(狱警)';

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL,
  `operation_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '操作内容',
  `operator` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人名字',
  `params` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '出入参数',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '操作模块',
  `operation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_id` bigint(20) NOT NULL COMMENT '操作人id',
  `action_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '操作模块url',
  `prison_id` bigint(20) NOT NULL COMMENT '监狱id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='监狱(操作日志)';

-- ----------------------------
-- Table structure for dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_type`;
CREATE TABLE `dictionary_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `value` int(11) NOT NULL DEFAULT '1' COMMENT '类型value',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `reserved` varchar(255) DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典类型表';

-- ----------------------------
-- Records of dictionary_type
-- ----------------------------
INSERT INTO `dictionary_type` VALUES ('1', '监狱类型', '1', '', '');
INSERT INTO `dictionary_type` VALUES ('2', '视频质量', '2', '', '');
INSERT INTO `dictionary_type` VALUES ('3', '家属关系', '3', '', '');
INSERT INTO `dictionary_type` VALUES ('4', '支付方式', '4', '', '');
INSERT INTO `dictionary_type` VALUES ('5', '充值终端', '5', '', '');
INSERT INTO `dictionary_type` VALUES ('6', '消费类型', '6', '', '');


DROP TABLE IF EXISTS `dictionary_item`;
CREATE TABLE `dictionary_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_value` int(11) NOT NULL COMMENT '类型value',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT '值',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `state` int(4) NOT NULL DEFAULT '1' COMMENT '状态，1正常 2 禁用',
  `reserved` varchar(255) DEFAULT '' COMMENT '预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典项目表';

-- ----------------------------
-- Records of dictionary_item
-- ----------------------------
INSERT INTO `dictionary_item` VALUES ('1', '1', '戒毒所', '1', '100', '1', '');
INSERT INTO `dictionary_item` VALUES ('2', '1', '监狱', '2', '99', '1', '');
INSERT INTO `dictionary_item` VALUES ('21', '1', '劳改所', '3', '98', '1', '');
INSERT INTO `dictionary_item` VALUES ('22', '1', '看守所', '4', '97', '1', '');
INSERT INTO `dictionary_item` VALUES ('3', '2', '360p', '1', '99', '1', '');
INSERT INTO `dictionary_item` VALUES ('4', '2', '720p', '2', '100', '1', '');
INSERT INTO `dictionary_item` VALUES ('5', '2', '1080p', '3', '98', '1', '');
INSERT INTO `dictionary_item` VALUES ('6', '3', '父亲', '1', '100', '1', '');
INSERT INTO `dictionary_item` VALUES ('7', '3', '母亲', '2', '99', '1', '');
INSERT INTO `dictionary_item` VALUES ('8', '3', '妻子', '3', '98', '1', '');
INSERT INTO `dictionary_item` VALUES ('9', '3', '丈夫', '4', '97', '1', '');
INSERT INTO `dictionary_item` VALUES ('10', '3', '儿子', '5', '96', '1', '');
INSERT INTO `dictionary_item` VALUES ('11', '3', '女儿', '6', '95', '1', '');
INSERT INTO `dictionary_item` VALUES ('12', '3', '其他', '7', '94', '1', '');
INSERT INTO `dictionary_item` VALUES ('13', '4', '微信', '1', '100', '1', '');
INSERT INTO `dictionary_item` VALUES ('14', '4', '支付宝', '2', '99', '1', '');
INSERT INTO `dictionary_item` VALUES ('15', '4', '线下汇款', '3', '98', '1', '');
INSERT INTO `dictionary_item` VALUES ('16', '4', '其他', '4', '97', '1', '');
INSERT INTO `dictionary_item` VALUES ('17', '5', '移动端', '1', '100', '1', '');
INSERT INTO `dictionary_item` VALUES ('18', '5', '管理员代付', '2', '99', '1', '');
INSERT INTO `dictionary_item` VALUES ('19', '6', '视频通话', '1', '100', '1', '');
INSERT INTO `dictionary_item` VALUES ('20', '6', '其他', '2', '99', '1', '');