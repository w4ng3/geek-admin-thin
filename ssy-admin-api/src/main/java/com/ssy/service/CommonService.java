package com.ssy.service;

import com.ssy.vo.FileUrlVO;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author ycshang
 * @Date 2023/7/12
 * @Description TODO
 */
public interface CommonService {

	FileUrlVO upload(MultipartFile uploadFile);



}
