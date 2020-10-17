package com.xiaoyu.car4s.utils.tags;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import lombok.Setter;

@Setter
public class SelectTag extends SimpleTagSupport {

	private String name;
	private String css; // 样式
	private String id;
	private Map<String, String> data; // 数据
	private String value; // 哪一个默认选中
	private String firstOption; // 非必填，填写则将该内容作为第一个选项，例如： --请选择--

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		if (css != null) {
			out.println("<select name=\"" + name + "\" class=\"" + css + "\" id=\"" + id + "\">");
		} else {
			out.println("<select name=\"" + name + "\" id=\"" + id + "\">");
		}

		if (firstOption != null && !firstOption.equals("")) {
			out.println("<option value=''>" + firstOption + "</option>\n");
		}
		if (data != null) {
			for (String key : data.keySet()) {
				if (value != null && key.equals(value)) {
					out.println("<option selected value=\"" + key + "\">" + data.get(key) + "</option>");
				} else {
					out.println("<option value=\"" + key + "\">" + data.get(key) + "</option>");
				}
			}
		}
		out.println("</select>");
	}

}
