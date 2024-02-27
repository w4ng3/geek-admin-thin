package com.ssy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ssy.common.exception.ServerException;
import com.ssy.entity.Privacy;
import com.ssy.mapper.PrivacyMapper;
import com.ssy.service.PrivacyService;
import com.ssy.vo.PrivacyVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
@Service
public class PrivacyServiceImpl extends ServiceImpl<PrivacyMapper, Privacy> implements PrivacyService {
	@Override
	public Privacy getPrivacyByType(PrivacyVO privacyVO) {
		Privacy privacy = baseMapper.selectOne(new LambdaQueryWrapper<Privacy>().eq(Privacy::getType, privacyVO.getType()));
		if (privacy == null) {
			throw new ServerException("隐私协议不存在");
		}
		return privacy;
	}

	@Override
	public void update(PrivacyVO privacyVO) {
		Privacy privacy = baseMapper.selectOne(new LambdaQueryWrapper<Privacy>().eq(Privacy::getType, privacyVO.getType()));
		if (privacy == null) {
			throw new ServerException("隐私协议不存在");
		}
		if (StringUtils.isBlank(privacyVO.getContent())) {
			throw new ServerException("请完善协议内容");
		}
		privacy.setContent(privacyVO.getContent());

		updateById(privacy);


	}
}
