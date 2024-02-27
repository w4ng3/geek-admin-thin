package com.social.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.social.utils.DateUtils;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class DictConfigVO {

    @Schema(description = "pk_id")
    private Integer pkId;

    @Schema(description = "字典编号")
    private String dictNumber;

    @Schema(description = "名称")
    @TableField("title")
    private String title;

    @Schema(description = "数据值")
    private Integer value;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
    private LocalDateTime createTime;

    @Schema(description = "更新时间")
    @JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
    private LocalDateTime updateTime;
}
