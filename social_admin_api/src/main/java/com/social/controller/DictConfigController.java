package com.social.controller;

import com.social.common.result.Result;
import com.social.dto.DictConfigRequestDTO;
import com.social.query.DictConfigQuery;
import com.social.vo.DictConfigVO;
import com.social.service.DictConfigService;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ycshang
 * @since 2023-11-13
 */
@Api(tags = "字典配置")
@RestController
@RequestMapping("/dictConfig")
@AllArgsConstructor
public class DictConfigController {
    private final DictConfigService dictConfigService;


    @PostMapping("page")
    @Operation(summary = "字典配置列表")
    public Result<List<DictConfigVO>> page(@RequestBody @Validated DictConfigQuery query) {
        List<DictConfigVO> list = dictConfigService.list(query);
        return Result.ok(list);
    }

    @PostMapping("save")
    @Operation(summary = "新增字典配置")
    public Result save(@RequestBody @Validated DictConfigRequestDTO dto) {
        dictConfigService.add(dto);
        return Result.ok();
    }

    @PostMapping("edit")
    @Operation(summary = "修改字典配置")
    public Result edit(@RequestBody @Validated DictConfigRequestDTO dto) {
        dictConfigService.edit(dto);
        return Result.ok();
    }

    @PostMapping("remove")
    @Operation(summary = "删除字典配置")
    public Result remove(@RequestBody List<Integer> ids) {
        dictConfigService.remove(ids);
        return Result.ok();
    }

}
