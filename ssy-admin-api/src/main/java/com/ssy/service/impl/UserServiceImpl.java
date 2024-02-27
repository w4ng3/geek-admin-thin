package com.ssy.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ssy.common.result.PageResult;
import com.ssy.convert.UserConvert;
import com.ssy.entity.User;
import com.ssy.mapper.UserMapper;
import com.ssy.query.UserExportQuery;
import com.ssy.query.UserQuery;
import com.ssy.service.UserService;
import com.ssy.utils.ExcelUtils;
import com.ssy.vo.UserVO;
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
