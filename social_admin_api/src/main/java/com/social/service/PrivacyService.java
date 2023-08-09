package com.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.social.entity.Privacy;
import com.social.vo.PrivacyVO;

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
