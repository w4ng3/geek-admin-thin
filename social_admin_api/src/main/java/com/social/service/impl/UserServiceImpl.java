package com.social.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.social.common.result.PageResult;
import com.social.convert.UserConvert;
import com.social.entity.User;
import com.social.mapper.UserMapper;
import com.social.query.UserExportQuery;
import com.social.query.UserQuery;
import com.social.service.UserService;
import com.social.utils.ExcelUtils;
import com.social.vo.UserVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletResponse;

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
@AllArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

	@Override
	public PageResult<UserVO> page(UserQuery query) {
		Page<UserVO> page = new Page<>(query.getPage(), query.getLimit());
		List<UserVO> userList = baseMapper.getUserList(page, query);
		return new PageResult<>(userList, page.getTotal());
	}

	@Override
	public void edit(UserVO userVO) {
		User user = UserConvert.INSTANCE.convert(userVO);
		updateById(user);
	}

	@Override
	public void exportUserInfo(UserExportQuery query, HttpServletResponse response) {
		List<UserVO> userList = baseMapper.getAllUserList(query);
		ExcelUtils.writeExcel(response, userList, "用户信息", "用户信息", UserVO.class);

	}
}
