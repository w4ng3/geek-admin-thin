package com.social.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.social.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

	/**
	 * 根据角色ID，获取菜单ID列表
	 */
	List<Integer> getMenuIdList(@Param("roleId") Integer roleId);

}
