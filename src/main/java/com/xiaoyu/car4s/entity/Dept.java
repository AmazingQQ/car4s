package com.xiaoyu.car4s.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Dept implements Serializable {
	private Integer id;// 部门id
	private String name;// 部门名称
	private String charger;// 负责人
	private String contactTel;// 联系电话
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;// 创建日期
	private Integer delFlag;// 删除标志(1-未删,0-已删)
}
