package com.social.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.social.common.model.Query;
import com.social.common.result.PageResult;
import com.social.convert.AppVersionConvert;
import com.social.entity.AppVersion;
import com.social.enums.DeleteFlagEnum;
import com.social.mapper.AppVersionMapper;
import com.social.service.AppVersionService;
import com.social.vo.AppVersionVO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
@Service
public class AppVersionServiceImpl extends ServiceImpl<AppVersionMapper, AppVersion> implements AppVersionService {
	@Override
	public PageResult<AppVersionVO> page(Query query) {
		Page<AppVersion> page = new Page<>(query.getPage(), query.getLimit());
		List<AppVersionVO> list = AppVersionConvert.INSTANCE.convertList(baseMapper.selectPage(page, new LambdaQueryWrapper<AppVersion>().eq(AppVersion::getDeleteFlag, DeleteFlagEnum.NOT_DELETE.getValue())).getRecords());
		return new PageResult<>(list, page.getTotal());
	}

	@Override
	public void save(AppVersionVO appVersionVO) {
		AppVersion appVersion = AppVersionConvert.INSTANCE.convert(appVersionVO);
		baseMapper.insert(appVersion);
	}

	@Override
	public void edit(AppVersionVO appVersionVO) {
		AppVersion appVersion = AppVersionConvert.INSTANCE.convert(appVersionVO);
		updateById(appVersion);

	}

	@Override
	public void delete(List<Integer> idList) {
		removeByIds(idList);
	}
}
