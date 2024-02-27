package com.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.social.dto.DictConfigRequestDTO;
import com.social.entity.DictConfig;
import com.social.query.DictConfigQuery;
import com.social.vo.DictConfigVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-11-13
 */
public interface DictConfigService extends IService<DictConfig> {
    /**
     * 字典列表
     *
     * @param query
     * @return
     */
    List<DictConfigVO> list(DictConfigQuery query);

    /**
     * 新增字典配置
     *
     * @param dto
     */
    void add(DictConfigRequestDTO dto);

    /**
     * 编辑字典配置
     *
     * @param dto
     */
    void edit(DictConfigRequestDTO dto);

    /**
     * 删除字典配置
     *
     * @param ids
     */
    void remove(List<Integer> ids);

}
