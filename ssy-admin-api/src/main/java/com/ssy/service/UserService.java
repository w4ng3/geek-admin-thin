package com.ssy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ssy.common.result.PageResult;
import com.ssy.entity.User;
import com.ssy.query.UserExportQuery;
import com.ssy.query.UserQuery;
import com.ssy.vo.UserVO;

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
