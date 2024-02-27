package com.ssy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ssy.common.result.PageResult;
import com.ssy.entity.SysRole;
import com.ssy.query.SysRoleQuery;
import com.ssy.vo.SysRoleVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
public interface SysRoleService extends IService<SysRole> {
	PageResult<SysRoleVO> page(SysRoleQuery query);

	List<SysRoleVO> getList(SysRoleQuery query);

	void save(SysRoleVO vo);

	void update(SysRoleVO vo);

	void delete(List<Integer> idList);

}
