package com.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.social.common.model.Query;
import com.social.common.result.PageResult;
import com.social.entity.AppVersion;
import com.social.vo.AppVersionVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
public interface AppVersionService extends IService<AppVersion> {

	/**
	 * 版本列表(分页)
	 *
	 * @param query
	 * @return
	 */
	PageResult<AppVersionVO> page(Query query);


	/**
	 * 新增版本管理
	 *
	 * @param appVersionVO
	 */
	void save(AppVersionVO appVersionVO);

	/**
	 * 修改版本管理信息
	 *
	 * @param appVersionVO
	 */
	void edit(AppVersionVO appVersionVO);

	/**
	 * 删除版本管理记录
	 *
	 * @param idList
	 */
	void delete(List<Integer> idList);


}
