package com.xiaoyu.car4s.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class User implements Serializable {
	private Integer id;// 员工ID(PK)
	private Integer deptId;// 所属部门(FK)
	private String name;// 员工姓名
	private Integer sex;// 性别(1-男,2-女)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;// 出生日期BIRTHDAY
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date entryDate;// 入职时间
	private String username;// 登录用户名
	private String password;// 登录密码
	private Integer loginFlag;// 登录状态(1-冻结,2-正常)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;// 创建日期
	private Integer applyFlag;// 申请状态(1-申请中,2-通过)
	private Integer roleId;// 角色ID(FK)
	private Integer delFlag;// 删除标志(1-未删,0-已删)
	private String pic;// 用户头像
}
