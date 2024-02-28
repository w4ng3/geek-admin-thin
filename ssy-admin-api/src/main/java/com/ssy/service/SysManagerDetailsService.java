package com.ssy.service;

import com.ssy.entity.SysManager;
import org.springframework.security.core.userdetails.UserDetails;

public interface SysManagerDetailsService {

    /**
     * 获取 UserDetails 对象
     */
    UserDetails getManagerDetails(SysManager sysManager);
}
