package com.social.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.social.entity.SysRole;
import com.social.query.SysRoleQuery;
import com.social.vo.SysRoleVO;
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
public interface SysRoleMapper extends BaseMapper<SysRole> {
	List<SysRoleVO> getRolePage(Page<SysRoleVO> page, @Param("query") SysRoleQuery query);

}
