package com.social.controller;

import com.social.common.result.Result;
import com.social.entity.SysMenu;
import com.social.enums.MenuTypeEnum;
import com.social.query.SysMenuQuery;
import com.social.security.user.ManagerDetail;
import com.social.security.user.SecurityUser;
import com.social.service.SysMenuService;
import com.social.vo.IdVO;
import com.social.vo.SysMenuVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
@Api(tags = "菜单管理")
@RestController
@RequestMapping("sys/menu")
@AllArgsConstructor
public class SysMenuController {

	private final SysMenuService sysMenuService;

	@PostMapping("nav")
	@ApiOperation("用户菜单")
	public Result<List<SysMenuVO>> nav() {
		ManagerDetail manager = SecurityUser.getManager();
		return Result.ok(sysMenuService.getManagerMenuList(manager, MenuTypeEnum.BUTTON.name()));
	}

	@PostMapping("button")
	@ApiOperation("用户按钮权限")
	public Result<Set<String>> authority() {
		ManagerDetail manager = SecurityUser.getManager();
		return Result.ok(sysMenuService.getManagerAuthority(manager));
	}

	@PostMapping("list")
	@ApiOperation("菜单列表")
	@Parameter(name = "type", description = "菜单类型 0：菜单 1：按钮  null：全部")
	public Result<List<SysMenuVO>> list(@RequestBody SysMenuQuery query) {
		List<SysMenuVO> list = sysMenuService.getMenuList(query);
		return Result.ok(list);
	}

	@PostMapping("info")
	@ApiOperation("信息")
	public Result<SysMenuVO> get(@RequestBody IdVO vo) {
		return Result.ok(sysMenuService.infoById(vo.getId()));
	}

	@PostMapping("add")
	@ApiOperation("保存")
	public Result<String> save(@RequestBody @Valid SysMenuVO vo) {
		sysMenuService.save(vo);
		return Result.ok();
	}

	@PostMapping("edit")
	@ApiOperation("修改")
	public Result<String> update(@RequestBody @Valid SysMenuVO vo) {
		sysMenuService.update(vo);
		return Result.ok();
	}

	@PostMapping("remove")
	@ApiOperation("删除")
	public Result<String> delete(@RequestBody IdVO vo) {
		sysMenuService.delete(vo.getId());
		return Result.ok();
	}

	@PostMapping("form")
	@ApiOperation("表单菜单列表")
	public Result<List<SysMenu>> getFormMenuList() {
		List<SysMenu> list = sysMenuService.getFormMenuList();
		return Result.ok(list);
	}

}
