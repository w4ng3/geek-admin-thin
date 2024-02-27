package com.ssy.security.exception;


import com.alibaba.fastjson2.JSONObject;
import com.ssy.common.exception.ErrorCode;
import com.ssy.common.result.Result;
import com.ssy.utils.HttpContextUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 * @author 王子凡
 */
public class SecurityAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException {
        response.setContentType("application/json; charset=utf-8");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Origin", HttpContextUtils.getOrigin());
        response.getWriter().print(JSONObject.toJSONString(Result.error(ErrorCode.UNAUTHORIZED)));
    }
}