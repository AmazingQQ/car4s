package com.xiaoyu.car4s.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Role implements Serializable {
	private Integer id;// 角色id
	private String name;// 角色名称
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;// 创建日期
	private Integer delFlag;// 删除标志(1-未删,0-已删)
}
