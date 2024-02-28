package com.ssy.convert;

import com.ssy.dto.DictConfigRequestDTO;
import com.ssy.entity.DictConfig;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface DictConfigConvert {
    DictConfigConvert INSTANCE = Mappers.getMapper(DictConfigConvert.class);


    DictConfig convertToConfig(DictConfigRequestDTO dto);
}
