package com.ssy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ssy.entity.Privacy;
import com.ssy.vo.PrivacyVO;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
public interface PrivacyService extends IService<Privacy> {
	/**
	 * 根据 type 获取隐私信息
	 *
	 * @return
	 */
	Privacy getPrivacyByType(PrivacyVO privacyVO);

	void update(PrivacyVO privacyVO);

}
