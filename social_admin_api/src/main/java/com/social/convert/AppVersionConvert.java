package com.social.convert;

import com.social.entity.AppVersion;
import com.social.entity.SysRole;
import com.social.vo.AppVersionVO;
import com.social.vo.SysRoleVO;
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
