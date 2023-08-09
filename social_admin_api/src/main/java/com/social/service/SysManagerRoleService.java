package com.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.social.entity.SysManagerRole;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
public interface SysManagerRoleService extends IService<SysManagerRole> {

	/**
	 * 保存或修改
	 *
	 * @param managerId 用户ID
	 * @param roleId    角色ID
	 */
	void saveOrUpdate(Integer managerId, Integer roleId);

	/**
	 * 删除
	 *
	 * @param idList 用户ID
	 */
	void removeByManagerId(List<Integer> idList);
;

	SysManagerRole getByManagerId(Integer managerId);

	Integer getByRoleId(Integer roleId);


}
