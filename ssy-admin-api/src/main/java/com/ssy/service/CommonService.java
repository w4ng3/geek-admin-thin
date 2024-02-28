package com.ssy.service;

import com.ssy.vo.FileUrlVO;
import org.springframework.web.multipart.MultipartFile;

public interface CommonService {

    /**
     * 图片上传
     *
     * @param uploadFile
     * @return
     */
    FileUrlVO upload(MultipartFile uploadFile);

}
