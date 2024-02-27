package com.ssy.common.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.ssy.common.constant.Constant;
import com.ssy.security.user.SecurityUser;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * @author 王子凡
 */
@Component
public class FieldMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        // 创建者
        strictInsertFill(metaObject, Constant.CREATOR, Integer.class, SecurityUser.getManagerId());
        // 创建时间
        strictInsertFill(metaObject, Constant.CREATE_TIME, LocalDateTime.class, LocalDateTime.now());
        // 更新者
        strictInsertFill(metaObject, Constant.UPDATER, Integer.class, SecurityUser.getManagerId());
        // 更新时间
        strictInsertFill(metaObject, Constant.UPDATE_TIME, LocalDateTime.class, LocalDateTime.now());
        // 删除标识
        strictInsertFill(metaObject, Constant.DELETED, Integer.class, 0);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 更新者
        strictUpdateFill(metaObject, Constant.UPDATER, Integer.class, SecurityUser.getManagerId());
        // 更新时间
        strictUpdateFill(metaObject, Constant.UPDATE_TIME, LocalDateTime.class, LocalDateTime.now());
    }
}