package com.ssy.controller;

import com.ssy.common.result.PageResult;
import com.ssy.common.result.Result;
import com.ssy.query.SysRoleQuery;
import com.ssy.service.SysMenuService;
import com.ssy.service.SysRoleService;
import com.ssy.vo.SysMenuVO;
import com.ssy.vo.SysRoleVO;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 角色管理 前端控制器
 * </p>
 *
 * @author ycshang
 * @since 2023-05-18
 */
@Api(tags = "角色管理")
@AllArgsConstructor
@RestController
@RequestMapping("/sys/role")
public class SysRoleController {

    private SysRoleService sysRoleService;

    private SysMenuService sysMenuService;

    @PostMapping("page")
    @Operation(summary = "分页")
    public Result<PageResult<SysRoleVO>> page(@RequestBody @Valid SysRoleQuery query) {
        PageResult<SysRoleVO> page = sysRoleService.page(query);
        return Result.ok(page);
    }

    @PostMapping("list")
    @Operation(summary = "列表")
    public Result<List<SysRoleVO>> list() {
        List<SysRoleVO> list = sysRoleService.getList(new SysRoleQuery());
        return Result.ok(list);
    }

    @PostMapping("add")
    @Operation(summary = "保存")
    public Result<String> save(@RequestBody @Valid SysRoleVO vo) {
        sysRoleService.save(vo);
        return Result.ok();
    }

    @PostMapping("edit")
    @Operation(summary = "修改")
    public Result<String> update(@RequestBody @Valid SysRoleVO vo) {
        sysRoleService.update(vo);
        return Result.ok();
    }

    @PostMapping("remove")
    @Operation(summary = "删除")
    public Result<String> delete(@RequestBody List<Integer> idList) {
        sysRoleService.delete(idList);
        return Result.ok();
    }

    @PostMapping("menu")
    @Operation(summary = "角色表单菜单列表")
    public Result<List<SysMenuVO>> getRoleFormMenuList() {
        List<SysMenuVO> list = sysMenuService.getRoleFormMenuList();
        return Result.ok(list);
    }

}
