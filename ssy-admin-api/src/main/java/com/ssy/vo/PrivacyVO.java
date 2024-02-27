package com.ssy.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @Author ycshang
 * @Date 2023/7/12
 * @Description TODO
 */
@Data
@Schema(description = "隐私协议")
public class PrivacyVO {
	@Schema(description = "隐私类型")
	@NotNull(message = "隐私类型不能为空")
	private Integer type;
	@Schema(description = "隐私内容")
	private String content;

}
