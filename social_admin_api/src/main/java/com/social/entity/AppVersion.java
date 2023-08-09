package com.social.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
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
@TableName("t_app_version")
@ApiModel(value = "AppVersion对象", description = "")
public class AppVersion {

    @ApiModelProperty("自增主键")
    @TableId(value = "pk_id", type = IdType.AUTO)
    private Integer pkId;

    @ApiModelProperty("平台")
    @TableField("platform")
    private String platform;

    @ApiModelProperty("描述")
    @TableField("summary")
    private String summary;

    @ApiModelProperty("最小版本")
    @TableField("min_version")
    private String minVersion;

    @ApiModelProperty("最大版本")
    @TableField("max_version")
    private String maxVersion;

    @ApiModelProperty("更新地址")
    @TableField("url")
    private String url;

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
