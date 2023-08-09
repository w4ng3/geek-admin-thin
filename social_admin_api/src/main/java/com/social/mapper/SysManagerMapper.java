package com.social.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.social.entity.SysManager;
import com.social.query.SysManagerQuery;
import com.social.vo.SysManagerVO;
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
public interface SysManagerMapper extends BaseMapper<SysManager> {

	default SysManager getByUsername(String username) {
		return this.selectOne(new LambdaQueryWrapper<SysManager>().eq(SysManager::getUsername, username));
	}

	List<SysManagerVO> getManagerPage(Page<SysManagerVO> page, @Param("query") SysManagerQuery query);

}
