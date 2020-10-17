package com.xiaoyu.car4s.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Dict implements Serializable {
	private Integer id;// 记录ID
	private String dictName;// 字典名称(英文大写，多个单词用下画线分隔)
	private String dkey;// 字典KEY
	private String dval;// 字典VALUE
	private Integer useFlag;// 状态(1-可用,2-不可用)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;// 创建日期
	private Integer orderNo;// 顺序号
	private Integer delFlag;// 删除标志(1-未删,0-已删)

}
