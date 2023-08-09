package com.social.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.social.converter.GenderConverter;
import com.social.utils.DateUtils;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;

/**
 * @Author ycshang
 * @Date 2023/7/13
 * @Description TODO
 */
@Data
@Schema(description = "用户")
@ExcelIgnoreUnannotated
public class UserVO {

	@Schema(description = "主键id")
	private Integer pkId;

	@Schema(description = "昵称")
	@ExcelProperty(value = "昵称", index = 0)
	private String nickname;

	@Schema(description = "账号")
	@NotBlank(message = "请输入账号")
	@ExcelProperty(value = "账号", index = 1)
	private String account;

	@Schema(description = "头像")
	private String avatar;

	@Schema(description = "手机号")
	@NotBlank(message = "手机号不能为空")
	@Length(min = 11, max = 11, message = "手机号只能为11位")
	@Pattern(regexp = "^[1][3,4,5,6,7,8,9][0-9]{9}$", message = "手机号格式有误")
	@ExcelProperty(value = "手机号", index = 2)
	private String phone;
	@Schema(description = "工作单位")
	@ExcelProperty(value = "工作单位", index = 3)
	private String company;

	@Schema(description = "性别(0：男，1：女，2：保密)")
	@ExcelProperty(value = "性别", index = 4,converter = GenderConverter.class)
	private Integer gender;

	@Schema(description = "会员结束时间")
	@ExcelProperty(value = "会员结束时间", index = 5)
	@JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
	private LocalDateTime endTime;

	@Schema(description = "创建时间")
	@JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
	private LocalDateTime createTime;

}
