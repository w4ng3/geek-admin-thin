package com.social.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.social.common.result.PageResult;
import com.social.entity.SysManager;
import com.social.query.ChangePasswordQuery;
import com.social.query.SysManagerQuery;
import com.social.security.user.ManagerDetail;
import com.social.vo.SysManagerVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-07-11
 */
public interface SysManagerService extends IService<SysManager> {

	PageResult<SysManagerVO> page(SysManagerQuery query);

	void save(SysManagerVO vo);

	void update(SysManagerVO vo);

	void delete(List<Integer> idList);

	void changePassword(ChangePasswordQuery query);

	SysManagerVO getManagerInfo(ManagerDetail manage);

}
