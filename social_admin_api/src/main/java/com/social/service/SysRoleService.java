package com.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.social.common.result.PageResult;
import com.social.entity.SysRole;
import com.social.query.SysRoleQuery;
import com.social.vo.SysRoleVO;

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
