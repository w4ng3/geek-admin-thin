package com.ssy.convert;


import com.ssy.entity.SysManager;
import com.ssy.security.user.ManagerDetail;
import com.ssy.vo.SysManagerVO;
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
