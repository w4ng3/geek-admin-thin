package com.ssy.controller;


import com.ssy.common.result.Result;
import com.ssy.service.CommonService;
import com.ssy.vo.FileUrlVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Api(tags = "通用模块")
@RestController
@RequestMapping("common")
@AllArgsConstructor
public class CommonController {

	private final CommonService commonService;

	@PostMapping(value = "/upload/img")
	@ResponseBody
	@ApiOperation("图片上传")
	public Result<FileUrlVO> upload(@RequestBody MultipartFile file) {
		return Result.ok(commonService.upload(file));
	}

}
