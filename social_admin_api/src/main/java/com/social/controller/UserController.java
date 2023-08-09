package com.social.controller;

import com.social.common.result.PageResult;
import com.social.common.result.Result;
import com.social.query.UserExportQuery;
import com.social.query.UserQuery;
import com.social.service.UserService;
import com.social.vo.UserVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("user")
@AllArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("page")
    @ApiOperation("用户列表")
    @PreAuthorize("hasAuthority('sys:user:list')")
    public Result<PageResult<UserVO>> page(@RequestBody UserQuery query) {
        PageResult<UserVO> page = userService.page(query);
        return Result.ok(page);
    }

    @PostMapping("edit")
    @ApiOperation("修改用户信息")
    @PreAuthorize("hasAuthority('sys:user:edit')")
    public Result<String> edit(@RequestBody @Valid UserVO userVO) {
        userService.edit(userVO);
        return Result.ok();
    }

    @PostMapping("export")
    @ApiOperation("导出用户信息")
    @PreAuthorize("hasAuthority('sys:user:export')")
    public Result<String> export(@RequestBody UserExportQuery query, HttpServletResponse response) {
        userService.exportUserInfo(query, response);
        return Result.ok();
    }

}
