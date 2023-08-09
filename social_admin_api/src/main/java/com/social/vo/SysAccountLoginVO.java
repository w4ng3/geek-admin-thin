package com.social.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author 王子凡
 */
@Data
@Schema(description = "账号登录")
public class SysAccountLoginVO {

	@Schema(description = "用户名")
	private String username;

	@Schema(description = "密码")
	private String password;

//	@Schema(description = "key")
//	private String key;
//
//	@Schema(description = "验证码")
//	private String captcha;


}
