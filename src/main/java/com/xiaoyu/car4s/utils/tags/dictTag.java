package com.xiaoyu.car4s.utils.tags;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import lombok.Setter;
/**
 * 自定义字典翻译标签
 * jsp通过使用:<my:dict value="${dictKey}" data="${map}" />
 * 生成HTML:dictKey对应的字典值
 * @author Administrator
 *
 */
@Setter
public class dictTag extends SimpleTagSupport{
	
	private String value;//要翻译的值
	private Map<String,String> data;
	
	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out=getJspContext().getOut();
		
		if(data !=null && data.get(value) !=null){
			out.write(data.get(value));
		}else {
			out.write("--");
		}
	}
	
	
	
}
	
