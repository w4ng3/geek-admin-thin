package com.ssy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ssy.common.result.PageResult;
import com.ssy.entity.SysManager;
import com.ssy.query.ChangePasswordQuery;
import com.ssy.query.SysManagerQuery;
import com.ssy.security.user.ManagerDetail;
import com.ssy.vo.SysManagerVO;

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
