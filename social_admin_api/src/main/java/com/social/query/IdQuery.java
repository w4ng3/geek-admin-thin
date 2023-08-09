package com.social.query;

import com.social.common.model.Query;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author ycshang
 * @Date 2023/7/14
 * @Description TODO
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "根据id分页查询")
public class IdQuery extends Query {
	@Schema(description = "查询id")
	private Integer id;

	@Schema(description = "内容【标题等】")
	private String content;

}
