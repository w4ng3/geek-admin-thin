package com.ssy.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ssy.utils.DateUtils;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * @Author ycshang
 * @Date 2023/7/13
 * @Description TODO
 */

@Data
@Schema(description = "版本列表")
@AllArgsConstructor
public class AppVersionVO {

	@Schema(description = "主键id")
	private Integer pkId;

	@Schema(description = "平台")
	@NotBlank(message = "平台信息不能为空")
	private String platform;

	@Schema(description = "简介")
	@NotBlank(message = "简介不能为空")
	private String summary;

	@Schema(description = "最小版本")
	@NotBlank(message = "最小版本不能为空")
	private String minVersion;

	@Schema(description = "最大版本")
	@NotBlank(message = "最大版本不能为空")
	private String maxVersion;

	@Schema(description = "更新地址")
	@NotBlank(message = "更新地址不能为空")
	private String url;

	@Schema(description = "创建时间")
	@JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
	private LocalDateTime createTime;

}
