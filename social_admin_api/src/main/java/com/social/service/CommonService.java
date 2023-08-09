package com.social.service;

import com.social.vo.FileUrlVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;

/**
 * @Author ycshang
 * @Date 2023/7/12
 * @Description TODO
 */
public interface CommonService {

	FileUrlVO upload(MultipartFile uploadFile);



}
