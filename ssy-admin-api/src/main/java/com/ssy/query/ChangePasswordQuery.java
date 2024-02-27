package com.ssy.query;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
@Schema(description = "修改管理员密码")
public class ChangePasswordQuery {
    @Schema(description = "主键")
    private Integer pkId;
    @Schema(description = "密码")
    @NotBlank(message = "密码不能为空")
    private String password;
}
