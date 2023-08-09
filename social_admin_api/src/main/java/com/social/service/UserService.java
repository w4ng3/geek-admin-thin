package com.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.social.common.result.PageResult;
import com.social.entity.User;
import com.social.query.UserExportQuery;
import com.social.query.UserQuery;
import com.social.vo.UserVO;

import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
public interface UserService extends IService<User> {

	/**
	 * 分页获取用户列表
	 *
	 * @param query
	 * @return
	 */
	PageResult<UserVO> page(UserQuery query);


	/**
	 * 修改用户信息
	 *
	 * @param userVO
	 */
	void edit(UserVO userVO);


	/**
	 * 导出用户信息
	 *
	 * @param query
	 * @param response
	 */
	void exportUserInfo(UserExportQuery query, HttpServletResponse response);

}
