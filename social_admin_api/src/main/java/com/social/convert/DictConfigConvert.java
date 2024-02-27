package com.social.convert;

import com.social.dto.DictConfigRequestDTO;
import com.social.entity.DictConfig;
import com.social.vo.DictConfigVO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @author ycshang
 */
@Mapper
public interface DictConfigConvert {
    DictConfigConvert INSTANCE = Mappers.getMapper(DictConfigConvert.class);


    DictConfig convertToDictConfig(DictConfigRequestDTO dto);

    @Mapping(expression = "java(MapStruct.strToInteger(dictConfig.getValue()))", target = "value")
    DictConfigVO convertToDictConfigVO(DictConfig dictConfig);


    List<DictConfigVO> convertToDictConfigVOList(List<DictConfig> list);


    class MapStruct {
        public static Integer strToInteger(String str) {
            return Integer.valueOf(str);
        }
    }

}
