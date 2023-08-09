package com.social.service.impl;


import com.social.convert.SysManagerConvert;
import com.social.entity.SysManager;
import com.social.enums.AccountStatusEnum;
import com.social.security.user.ManagerDetail;
import com.social.service.SysManagerDetailsService;
import com.social.service.SysMenuService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * 用户 UserDetails 信息
 *
 * @author 阿沐 babamu@126.com
 * <a href="https://maku.net">MAKU</a>
 */
@Service
@AllArgsConstructor
public class SysManagerDetailsServiceImpl implements SysManagerDetailsService {
    private final SysMenuService sysMenuService;

    @Override
    public UserDetails getManagerDetails(SysManager sysManager) {
        // 转换成UserDetail对象
        ManagerDetail managerDetail = SysManagerConvert.INSTANCE.convertDetail(sysManager);

        // 账号不可用
        if (sysManager.getStatus() == AccountStatusEnum.DISABLE.getValue()) {
            managerDetail.setEnabled(false);
        }

        // 用户权限列表
        Set<String> authoritySet = sysMenuService.getManagerAuthority(managerDetail);
        managerDetail.setAuthoritySet(authoritySet);

        return managerDetail;
    }

}
