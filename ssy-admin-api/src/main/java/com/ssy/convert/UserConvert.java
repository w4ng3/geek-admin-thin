package com.ssy.convert;

import com.ssy.entity.User;
import com.ssy.vo.UserVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @Author ycshang
 * @Date 2023/7/13
 * @Description TODO
 */
@Mapper
public interface UserConvert {

	UserConvert INSTANCE = Mappers.getMapper(UserConvert.class);

	User convert(UserVO entity);
}
