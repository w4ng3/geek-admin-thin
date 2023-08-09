package com.social.controller;

import com.social.common.model.Query;
import com.social.common.result.PageResult;
import com.social.common.result.Result;
import com.social.service.AppVersionService;
import com.social.vo.AppVersionVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
@Api(tags = "版本管理")
@RestController
@RequestMapping("appVersion")
@AllArgsConstructor
public class AppVersionController {
    private final AppVersionService appVersionService;

    @PostMapping("page")
    @ApiOperation("版本列表(分页)")
    @PreAuthorize("hasAuthority('platform:version:list')")
    public Result<PageResult<AppVersionVO>> page(@RequestBody @Valid Query query) {
        PageResult<AppVersionVO> page = appVersionService.page(query);
        return Result.ok(page);
    }

    @PostMapping("add")
    @ApiOperation("新增版本管理")
    @PreAuthorize("hasAuthority('platform:version:add')")
    public Result<String> save(@RequestBody @Valid AppVersionVO vo) {
        appVersionService.save(vo);
        return Result.ok();
    }

    @PostMapping("edit")
    @ApiOperation("修改版本管理")
    @PreAuthorize("hasAuthority('platform:version:edit')")
    public Result<String> update(@RequestBody @Valid AppVersionVO vo) {
        appVersionService.edit(vo);
        return Result.ok();
    }

    @PostMapping("remove")
    @ApiOperation("删除版本记录")
    @PreAuthorize("hasAuthority('platform:version:remove')")
    public Result<String> delete(@RequestBody List<Integer> idList) {
        appVersionService.delete(idList);
        return Result.ok();
    }

}
