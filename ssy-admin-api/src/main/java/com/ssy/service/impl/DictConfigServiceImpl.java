package com.ssy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ssy.common.exception.ServerException;
import com.ssy.convert.DictConfigConvert;
import com.ssy.dto.DictConfigRequestDTO;
import com.ssy.entity.DictConfig;
import com.ssy.mapper.DictConfigMapper;
import com.ssy.query.DictConfigQuery;
import com.ssy.service.DictConfigService;
import com.ssy.service.DictService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class DictConfigServiceImpl extends ServiceImpl<DictConfigMapper, DictConfig> implements DictConfigService {

    private final DictService dictService;

    @Override
    public List<DictConfig> list(DictConfigQuery query) {
        LambdaQueryWrapper<DictConfig> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(query.getTitle())) {
            wrapper.like(DictConfig::getTitle, query.getTitle());
        }
        wrapper.eq(DictConfig::getDictNumber, query.getNumber());
        wrapper.orderByDesc(DictConfig::getCreateTime);
        List<DictConfig> result = baseMapper.selectList(wrapper);
        return result;
    }

    @Override
    public void add(DictConfigRequestDTO dto) {
        DictConfig dictConfig = DictConfigConvert.INSTANCE.convertToConfig(dto);
        LambdaQueryWrapper<DictConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(DictConfig::getDictNumber, dictConfig.getDictNumber());
        wrapper.eq(DictConfig::getTitle, dictConfig.getTitle());
        List<DictConfig> dictConfigs = baseMapper.selectList(wrapper);
        if (dictConfigs.size() > 0) {
            throw new ServerException("该字典标题已存在");
        }
        wrapper.clear();
        dictConfigs.clear();
        wrapper.eq(DictConfig::getDictNumber, dictConfig.getDictNumber());
        wrapper.eq(DictConfig::getValue, dictConfig.getValue());
        dictConfigs = baseMapper.selectList(wrapper);
        if (dictConfigs.size() > 0) {
            throw new ServerException("该字典值已存在");
        }
        baseMapper.insert(dictConfig);
        dictService.refreshTransCache();
    }


    @Override
    public void edit(DictConfigRequestDTO dto) {
        DictConfig dictConfig = DictConfigConvert.INSTANCE.convertToConfig(dto);
        LambdaQueryWrapper<DictConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(DictConfig::getDictNumber, dictConfig.getDictNumber());
        wrapper.eq(DictConfig::getTitle, dictConfig.getTitle());
        List<DictConfig> dictConfigs = baseMapper.selectList(wrapper);
        if (dictConfigs.size() > 0) {
            throw new ServerException("该字典标题已存在");
        }
        wrapper.clear();
        dictConfigs.clear();
        wrapper.eq(DictConfig::getDictNumber, dictConfig.getDictNumber());
        wrapper.eq(DictConfig::getValue, dictConfig.getValue());
        dictConfigs = baseMapper.selectList(wrapper);
        if (dictConfigs.size() > 0) {
            throw new ServerException("该字典值已存在");
        }
        updateById(dictConfig);
        dictService.refreshTransCache();
    }

    @Override
    public void remove(List<Integer> ids) {
        removeBatchByIds(ids);
    }
}
