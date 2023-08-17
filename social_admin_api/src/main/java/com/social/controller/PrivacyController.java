package com.social.controller;

import com.social.common.result.Result;
import com.social.entity.Privacy;
import com.social.service.PrivacyService;
import com.social.vo.PrivacyVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
@Api(tags = "隐私协议")
@RestController
@RequestMapping("privacy")
@AllArgsConstructor
public class PrivacyController {
    private final PrivacyService privacyService;

    @PostMapping("info")
    @ApiOperation("获取隐私协议信息")
    @PreAuthorize("hasAuthority('sys:protocol:list')")
    public Result<Privacy> getPrivacyInfo(@RequestBody @Valid PrivacyVO privacyVO) {
        return Result.ok(privacyService.getPrivacyByType(privacyVO));
    }

    @PostMapping("edit")
    @ApiOperation("修改隐私协议信息")
    @PreAuthorize("hasAuthority('sys:protocol:edit')")
    public Result editPrivacyInfo(@RequestBody @Valid PrivacyVO privacyVO) {
        privacyService.update(privacyVO);
        return Result.ok();
    }


}
