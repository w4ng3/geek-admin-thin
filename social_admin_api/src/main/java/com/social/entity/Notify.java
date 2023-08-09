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
@TableName("t_notify")
@ApiModel(value = "Notify对象", description = "")
public class Notify {

	@ApiModelProperty("主键")
	@TableId(value = "pk_id", type = IdType.AUTO)
	private Integer pkId;

	@ApiModelProperty("用户id")
	@TableField("user_id")
	private Integer userId;

	@ApiModelProperty("通知类型(0：系统通知，1：添加好友通知)")
	@TableField("type")
	private Integer type;

	@ApiModelProperty("消息内容标记(根据通知类型记录不同信息)")
	@TableField("remark")
	private String remark;

	@ApiModelProperty("消息名称")
	@TableField("title")
	private String title;

	@ApiModelProperty("消息内容")
	@TableField("content")
	private String content;


	@ApiModelProperty("是否已读，0:未读，1: 已读")
	@TableField("is_read")
	private Integer isRead;

	@ApiModelProperty("创建时间")
	@TableField(value = "create_time", fill = FieldFill.INSERT)
	private LocalDateTime createTime;
}
