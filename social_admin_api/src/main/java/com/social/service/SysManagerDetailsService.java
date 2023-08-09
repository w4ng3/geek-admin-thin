package com.social.service;

import com.social.entity.SysManager;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * @Author ycshang
 * @Date 2023/7/11
 * @Description TODO
 */
public interface SysManagerDetailsService {

	/**
	 * 获取 UserDetails 对象
	 */
	UserDetails getManagerDetails(SysManager sysManager);
}
