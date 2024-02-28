package com.ssy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ssy.common.result.PageResult;
import com.ssy.dto.DictRequestDTO;
import com.ssy.entity.Dict;
import com.ssy.query.DictQuery;

import java.util.List;

public interface DictService extends IService<Dict> {

    /**
     * 字典列表 -分页
     *
     * @param query
     * @return
     */
    PageResult<Dict> getPage(DictQuery query);

    void refreshTransCache();

    /**
     * 新增字典
     *
     * @param dto
     */
    void add(DictRequestDTO dto);

    /**
     * 修改字典
     *
     * @param dto
     */
    void edit(DictRequestDTO dto);

    /**
     * 删除字典
     *
     * @param ids
     */
    void remove(List<Integer> ids);

    /**
     * 根据字典编号查询
     * @param number
     * @return
     */
    boolean existByNumber(String number);
}
