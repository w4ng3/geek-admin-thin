package com.social.controller;

import com.social.common.result.Result;
import com.social.security.utils.TokenUtils;
import com.social.service.AuthService;
import com.social.vo.SysAccountLoginVO;
import com.social.vo.SysTokenVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 用户管理 前端控制器
 * </p>
 *
 * @author 王子凡
 * @since 2023-05-18
 */
@Api(tags = "认证管理")
@RestController
@RequestMapping("sys/auth")
@AllArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("login")
    @ApiOperation("账号密码登录")
    public Result<SysTokenVO> login(@RequestBody SysAccountLoginVO login) {
        return Result.ok(authService.loginByAccount(login));
    }

    @PostMapping("logout")
    @ApiOperation("退出")
    public Result<String> logout(HttpServletRequest request) {
        authService.logout(TokenUtils.getAccessToken(request));
        return Result.ok();
    }

}
