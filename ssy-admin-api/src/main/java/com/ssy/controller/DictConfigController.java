package com.ssy.controller;

import com.ssy.common.result.Result;
import com.ssy.dto.DictConfigRequestDTO;
import com.ssy.entity.DictConfig;
import com.ssy.query.DictConfigQuery;
import com.ssy.service.DictConfigService;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "字典配置")
@RestController
@RequestMapping("/dictConfig")
@AllArgsConstructor
public class DictConfigController {
    private final DictConfigService dictConfigService;


    @PostMapping("page")
    @Operation(summary = "字典配置列表")
    public Result<List<DictConfig>> page(@RequestBody @Validated DictConfigQuery query) {
        List<DictConfig> list = dictConfigService.list(query);
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
