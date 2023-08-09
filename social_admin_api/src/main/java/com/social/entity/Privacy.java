package com.social.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

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
@TableName("t_privacy")
@ApiModel(value = "Privacy对象", description = "")
public class Privacy {

    @ApiModelProperty("自增主键")
    @TableId(value = "pk_id", type = IdType.AUTO)
    private Integer pkId;

    @ApiModelProperty("隐私类型(0：隐私协议，1：用户协议，2：关于我们)")
    @TableField("type")
    private Integer type;

    @ApiModelProperty("隐私内容")
    @TableField("content")
    private String content;

    @ApiModelProperty("创建时间")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}
