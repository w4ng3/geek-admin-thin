package com.ssy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ssy.common.exception.ServerException;
import com.ssy.mapper.DictConfigMapper;
import com.ssy.convert.DictConfigConvert;
import com.ssy.dto.DictConfigRequestDTO;
import com.ssy.entity.DictConfig;
import com.ssy.query.DictConfigQuery;
import com.ssy.vo.DictConfigVO;
import com.ssy.service.DictConfigService;
import com.ssy.service.DictService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author ycshang
 * @since 2023-11-13
 */
@Service
@AllArgsConstructor
public class DictConfigServiceImpl extends ServiceImpl<DictConfigMapper, DictConfig> implements DictConfigService {
    private final DictService dictService;

    @Override
    public List<DictConfigVO> list(DictConfigQuery query) {
        LambdaQueryWrapper<DictConfig> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(query.getTitle())) {
            wrapper.eq(DictConfig::getTitle, query.getTitle());
        }
        wrapper.eq(DictConfig::getDictNumber, query.getNumber());
        wrapper.orderByDesc(DictConfig::getCreateTime);
        List<DictConfig> result = baseMapper.selectList(wrapper);
        List<DictConfigVO> list = DictConfigConvert.INSTANCE.convertToDictConfigVOList(result);

        return list;
    }

    protected List<DictConfig> getList(DictConfig dictConfig) {
        if (!dictService.existByNumber(dictConfig.getDictNumber())) {
            throw new ServerException("该字典编号不存在");
        }
        LambdaQueryWrapper<DictConfig> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(DictConfig::getDictNumber, dictConfig.getDictNumber());
        return baseMapper.selectList(wrapper);
    }

    @Override
    public void add(DictConfigRequestDTO dto) {
        DictConfig dictConfig = DictConfigConvert.INSTANCE.convertToDictConfig(dto);
        List<DictConfig> list = getList(dictConfig);
        if (list != null && list.size() > 0) {
            if (list.stream().anyMatch(item -> item.getTitle().equals(dictConfig.getTitle()))) {
                throw new ServerException("该字典标题已存在！");
            }
            if (list.stream().anyMatch(item -> item.getValue().equals(dictConfig.getValue()))) {
                throw new ServerException("该字典值已存在！");
            }
        }
        baseMapper.insert(dictConfig);
        dictService.refreshTransCache();
    }

    @Override
    public void edit(DictConfigRequestDTO dto) {
        DictConfig dictConfig = DictConfigConvert.INSTANCE.convertToDictConfig(dto);
        List<DictConfig> list = getList(dictConfig);
        if (list != null && list.size() > 0) {
            if (list.stream().filter(item -> !item.getPkId().equals(dictConfig.getPkId()))
                    .anyMatch(item -> item.getTitle().equals(dictConfig.getTitle()))) {
                throw new ServerException("该字典标题已存在！");
            }

            if (list.stream().filter(item -> !item.getPkId().equals(dictConfig.getPkId()))
                    .anyMatch(item -> item.getValue().equals(dictConfig.getValue()))) {
                throw new ServerException("该字典值已存在！");
            }
        }
        updateById(dictConfig);
        dictService.refreshTransCache();
    }

    @Override
    public void remove(List<Integer> ids) {
        removeBatchByIds(ids);
    }
}
