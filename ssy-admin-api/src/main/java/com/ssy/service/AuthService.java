package com.ssy.service;

import com.ssy.vo.SysAccountLoginVO;
import com.ssy.vo.SysTokenVO;

/**
 * 认证服务
 *
 * @Author 王子凡
 * @Date 2023-05-18 17:26
 */
public interface AuthService {

	/**
	 * 使用账号密码登录
	 *
	 * @param params
	 * @return
	 */
	SysTokenVO loginByAccount(SysAccountLoginVO params);

	/**
	 * 退出登录
	 *
	 * @param accessToken accessToken
	 */
	void logout(String accessToken);

}
