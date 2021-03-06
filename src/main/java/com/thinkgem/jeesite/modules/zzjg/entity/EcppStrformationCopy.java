/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zzjg.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 组织机构Entity
 * @author nan
 * @version 2018-03-29
 */
public class EcppStrformationCopy extends DataEntity<EcppStrformationCopy> {
	
	private static final long serialVersionUID = 1L;
	private String fzrnane;		// 负责人姓名
	private String fzrzhiwei;		// 职位
	private String fzrdianhua;		// 电话
	private String fzryouxiang;		// 邮箱
	private String llrnane1;		// 姓名
	private String oaaccount1;		// OA账号
	private String llrbumen1;		// 部门
	private String llrzhiwei1;		// 职位
	private String llrdianhua1;		// 电话
	private String llrshouji1;		// 手机
	private String llryouxiang1;		// 邮箱
	private String llrnane2;		// 姓名
	private String oaaccount2;		// OA账号
	private String llrbumen2;		// 部门
	private String llrzhiwei2;		// 职位
	private String llrdianhua2;		// 电话
	private String llrshouji2;		// 手机
	private String llryouxiang2;		// 邮箱
	private Date delDate;		// del_date
	private String statuss;		// 邮箱
	
	public String getStatuss() {
		return statuss;
	}

	public void setStatuss(String statuss) {
		this.statuss = statuss;
	}

	public EcppStrformationCopy() {
		super();
	}

	public EcppStrformationCopy(String id){
		super(id);
	}

	@Length(min=1, max=255, message="负责人姓名长度必须介于 1 和 255 之间")
	public String getFzrnane() {
		return fzrnane;
	}

	public void setFzrnane(String fzrnane) {
		this.fzrnane = fzrnane;
	}
	
	@Length(min=1, max=255, message="职位长度必须介于 1 和 255 之间")
	public String getFzrzhiwei() {
		return fzrzhiwei;
	}

	public void setFzrzhiwei(String fzrzhiwei) {
		this.fzrzhiwei = fzrzhiwei;
	}
	//@Pattern(regexp = "[0-9-()（）]{7,18}", message="非电话格式")
	@Length(min=1, max=255, message="电话长度必须介于 1 和 255 之间")
	public String getFzrdianhua() {
		return fzrdianhua;
	}

	public void setFzrdianhua(String fzrdianhua) {
		this.fzrdianhua = fzrdianhua;
	}
	
	@Length(min=1, max=255, message="邮箱长度必须介于 1 和 255 之间")
	public String getFzryouxiang() {
		return fzryouxiang;
	}

	public void setFzryouxiang(String fzryouxiang) {
		this.fzryouxiang = fzryouxiang;
	}
	
	@Length(min=1, max=255, message="姓名长度必须介于 1 和 255 之间")
	public String getLlrnane1() {
		return llrnane1;
	}

	public void setLlrnane1(String llrnane1) {
		this.llrnane1 = llrnane1;
	}
	
	@Length(min=1, max=255, message="部门长度必须介于 1 和 255 之间")
	public String getLlrbumen1() {
		return llrbumen1;
	}

	public void setLlrbumen1(String llrbumen1) {
		this.llrbumen1 = llrbumen1;
	}
	
	@Length(min=1, max=255, message="职位长度必须介于 1 和 255 之间")
	public String getLlrzhiwei1() {
		return llrzhiwei1;
	}

	public void setLlrzhiwei1(String llrzhiwei1) {
		this.llrzhiwei1 = llrzhiwei1;
	}
	
	@Length(min=0, max=255, message="电话长度必须介于 0 和 255 之间")
	public String getLlrdianhua1() {
		return llrdianhua1;
	}

	public void setLlrdianhua1(String llrdianhua1) {
		this.llrdianhua1 = llrdianhua1;
	}
	//@Pattern(regexp = "0?(13|14|15|18)[0-9]{9}", message="非手机格式")
	@Length(min=1, max=255, message="手机长度必须介于 1 和 255 之间")
	public String getLlrshouji1() {
		return llrshouji1;
	}

	public void setLlrshouji1(String llrshouji1) {
		this.llrshouji1 = llrshouji1;
	}
	
	@Length(min=1, max=255, message="邮箱长度必须介于 1 和 255 之间")
	public String getLlryouxiang1() {
		return llryouxiang1;
	}

	public void setLlryouxiang1(String llryouxiang1) {
		this.llryouxiang1 = llryouxiang1;
	}
	
	@Length(min=0, max=255, message="姓名长度必须介于 0 和 255 之间")
	public String getLlrnane2() {
		return llrnane2;
	}

	public void setLlrnane2(String llrnane2) {
		this.llrnane2 = llrnane2;
	}
	
	@Length(min=0, max=255, message="部门长度必须介于 0 和 255 之间")
	public String getLlrbumen2() {
		return llrbumen2;
	}

	public void setLlrbumen2(String llrbumen2) {
		this.llrbumen2 = llrbumen2;
	}
	
	@Length(min=0, max=255, message="职位长度必须介于 0 和 255 之间")
	public String getLlrzhiwei2() {
		return llrzhiwei2;
	}

	public void setLlrzhiwei2(String llrzhiwei2) {
		this.llrzhiwei2 = llrzhiwei2;
	}
	
	@Length(min=0, max=255, message="电话长度必须介于 0 和 255 之间")
	public String getLlrdianhua2() {
		return llrdianhua2;
	}

	public void setLlrdianhua2(String llrdianhua2) {
		this.llrdianhua2 = llrdianhua2;
	}
	//@Pattern(regexp = "0?(13|14|15|18)[0-9]{9}", message="非手机格式")
	@Length(min=0, max=255, message="手机长度必须介于 0 和 255 之间")
	public String getLlrshouji2() {
		return llrshouji2;
	}

	public void setLlrshouji2(String llrshouji2) {
		this.llrshouji2 = llrshouji2;
	}
	
	@Length(min=0, max=255, message="邮箱长度必须介于 0 和 255 之间")
	public String getLlryouxiang2() {
		return llryouxiang2;
	}

	public void setLlryouxiang2(String llryouxiang2) {
		this.llryouxiang2 = llryouxiang2;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public String getOaaccount1() {
		return oaaccount1;
	}

	public void setOaaccount1(String oaaccount1) {
		this.oaaccount1 = oaaccount1;
	}

	public String getOaaccount2() {
		return oaaccount2;
	}

	public void setOaaccount2(String oaaccount2) {
		this.oaaccount2 = oaaccount2;
	}
	
}