package com.social.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.social.entity.User;
import com.social.query.UserExportQuery;
import com.social.query.UserQuery;
import com.social.vo.UserVO;
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
public interface UserMapper extends BaseMapper<User> {

	/**
	 * 用户列表(分页)
	 *
	 * @param page
	 * @param query
	 * @return
	 */
	List<UserVO> getUserList(Page<UserVO> page, @Param("query") UserQuery query);


	/**
	 * 用户列表
	 *
	 * @param query
	 * @return
	 */
	List<UserVO> getAllUserList(@Param("query") UserExportQuery query);

}
