package com.social.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * <p>
 *
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
@Getter
@Setter
@TableName("t_user")
@ApiModel(value = "User对象", description = "")
public class User {

	@ApiModelProperty("自增主键")
	@TableId(value = "pk_id", type = IdType.AUTO)
	private Integer pkId;

	@ApiModelProperty("账号")
	@TableField("account")
	private String account;

	@ApiModelProperty("昵称")
	@TableField("nickname")
	private String nickname;

	@ApiModelProperty("密码")
	@TableField("password")
	private String password;

	@ApiModelProperty("盐值")
	@TableField("salt")
	private String salt;

	@ApiModelProperty("头像")
	@TableField("avatar")
	private String avatar;

	@ApiModelProperty("手机号")
	@TableField("phone")
	private String phone;

	@ApiModelProperty("工作单位")
	@TableField("company")
	private String company;

	@ApiModelProperty("性别(0：男，1：女，2：保密)")
	@TableField("gender")
	private Integer gender;

	@ApiModelProperty("会员结束时间")
	@TableField(value = "end_time", fill = FieldFill.INSERT)
	private LocalDateTime endTime;

	@ApiModelProperty("逻辑删除(0-未删除，1-删除)")
	@TableField("delete_flag")
	@TableLogic
	private Integer deleteFlag;

	@ApiModelProperty("创建时间")
	@TableField(value = "create_time", fill = FieldFill.INSERT)
	private LocalDateTime createTime;

	@ApiModelProperty("更新时间")
	@TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
	private LocalDateTime updateTime;
}
