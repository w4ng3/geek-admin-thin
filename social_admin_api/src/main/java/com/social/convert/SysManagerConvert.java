package com.social.convert;


import com.social.entity.SysManager;
import com.social.security.user.ManagerDetail;
import com.social.vo.SysManagerVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;


@Mapper
public interface SysManagerConvert {
	SysManagerConvert INSTANCE = Mappers.getMapper(SysManagerConvert.class);

	SysManager convert(SysManagerVO vo);

	ManagerDetail convertDetail(SysManager entity);

	List<SysManagerVO> convertList(List<SysManager> list);
}
