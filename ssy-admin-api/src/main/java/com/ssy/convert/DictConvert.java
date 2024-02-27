package com.ssy.convert;

import com.ssy.dto.DictRequestDTO;
import com.ssy.entity.Dict;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author ycshang
 */
@Mapper
public interface DictConvert {
    DictConvert INSTANCE = Mappers.getMapper(DictConvert.class);


    Dict convertToDict(DictRequestDTO dto);
}
