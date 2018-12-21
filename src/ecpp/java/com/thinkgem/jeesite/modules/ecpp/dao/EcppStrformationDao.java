/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ecpp.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.ecpp.entity.EcppStrformation;

/**
 * 组建机构DAO接口
 * @author lin
 * @version 2018-03-27
 */
@MyBatisDao
public interface EcppStrformationDao extends CrudDao<EcppStrformation> {
	
}