package com.ssy.convert;

import com.ssy.entity.AppVersion;
import com.ssy.vo.AppVersionVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @Author ycshang
 * @Date 2023/7/13
 * @Description TODO
 */
@Mapper
public interface AppVersionConvert {

	AppVersionConvert INSTANCE = Mappers.getMapper(AppVersionConvert.class);

	AppVersion convert(AppVersionVO vo);

	List<AppVersionVO> convertList(List<AppVersion> list);
}
