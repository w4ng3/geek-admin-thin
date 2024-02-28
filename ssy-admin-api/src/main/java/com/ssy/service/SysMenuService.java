package com.ssy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ssy.entity.SysMenu;
import com.ssy.query.SysMenuQuery;
import com.ssy.security.user.ManagerDetail;
import com.ssy.vo.SysMenuVO;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * 菜单管理 服务类
 * </p>
 *
 * @author ycshang
 * @since 2023-05-18
 */
public interface SysMenuService extends IService<SysMenu> {

    /**
     * 用户菜单列表
     *
     * @param type 菜单类型
     */
    List<SysMenuVO> getManagerMenuList(ManagerDetail manager,String type);

    Set<String> getManagerAuthority(ManagerDetail manager);

    /**
     * 菜单列表
     *
     * @param query 菜单筛选
     */
    List<SysMenuVO> getMenuList(SysMenuQuery query);

    SysMenuVO infoById(Integer id);

    void save(SysMenuVO vo);


    void update(SysMenuVO vo);

    void delete(Integer id);

    List<SysMenu> getFormMenuList();

    List<SysMenuVO> getRoleFormMenuList();
    /**
     * 获取子菜单的数量
     * @param pid  父菜单ID
     */
    Long getSubMenuCount(Integer pid);


}
