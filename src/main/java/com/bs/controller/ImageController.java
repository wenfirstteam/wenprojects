package com.bs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bs.result.ResponseResult;
import com.bs.service.IntroductionService;

import lombok.extern.slf4j.Slf4j;
/**
 * <p>ClassName: IntroductionCotroller</p>
 * <p>Description: [公司简介相关接口]</p> 
 * <p>2019年4月26日</p>
 */
@Slf4j
@Controller
@RequestMapping("/upload")
public class ImageController
{
	@Autowired
	private IntroductionService introductionService;

	/**
	 * <p>Title: addIntroduction</p>  
	 * <p>Description: [上传图片]</p> 
	 * @param file
	 * @return ResponseResult
	 * @throws
	 */
	@PostMapping("/upload")
	public @ResponseBody ResponseResult updateIntroductionIcon(@RequestParam("file") MultipartFile file)
	{
		if (file.isEmpty()) {
			return ResponseResult.failAddMessage("上传失败，请检查文件");
		}
		String fileName = file.getOriginalFilename(); 
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        String filePath = System.getProperty("user.dir") + "/upload";
        String tarFileName = UUID.randomUUID().toString() + suffix;
        File path = new File(filePath);
        File tar = new File(filePath + "/" + tarFileName);
        if (!path.exists())
        	path.mkdirs();
		try (InputStream in = file.getInputStream();
				FileOutputStream out = new FileOutputStream(tar);) {
			IOUtils.copy(in, out);
		} catch (IOException e) {
			log.info("upload failed ,cause by : {}", e.getMessage());
			return ResponseResult.failAddMessage("上传失败，请检查文件");
		}
//		Boolean result = introductionService.updateIntroduce(id, filePath + "/" + tarFileName);
		return ResponseResult.successAddData(tarFileName); 
	}
}
