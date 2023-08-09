package com.social.query;

import com.social.common.model.Query;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author ycshang
 * @Date 2023/7/13
 * @Description TODO
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "用户查询")
public class UserQuery extends Query {
	@Schema(description = "用户昵称")
	private String nickname;
	@Schema(description = "手机号")
	private String phone;
	@Schema(description = "工作单位")
	private String company;
	@Schema(description = "性别")
	private Integer gender;
	@Schema(description = "是否是会员，0:不是会员，1:是会员")
	private Integer isCertified;

}
