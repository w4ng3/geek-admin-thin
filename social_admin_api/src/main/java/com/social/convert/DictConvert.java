package com.social.convert;

import com.social.dto.DictRequestDTO;
import com.social.entity.Dict;
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
