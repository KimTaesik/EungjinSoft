package com.groupware.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.common.DownloadView;
import com.groupware.common.Util;
import com.groupware.dao.UploadDao;
import com.groupware.dto.Upload;
import com.groupware.dto.UploadFile;

@Controller
@RequestMapping(value = "upload")
public class UploadController {
	
	private UploadDao uploadDao;
	@Autowired
	@Qualifier("uploadDao")
	public void setUploadDao(UploadDao uploadDao) {
		this.uploadDao = uploadDao;
	}
	
/*	@RequestMapping(value = "list.action", method = RequestMethod.GET)
	public ModelAndView list() {
		
		List<Upload> uploads = uploadDao.getUploadList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("upload/uploadlist");
		mav.addObject("uploads", uploads);
		
		return mav;
		
	}*/
	
	@RequestMapping(value = "write.action", method = RequestMethod.GET)
	public String writeForm() {
		
		return "upload/uploadwriteform";
		
	}
	
	@RequestMapping(value = "write.action", method = RequestMethod.POST)
	public String write(
		MultipartHttpServletRequest req,				//file-data + form-data
		String title, String uploader, String content) {//form-data 저장 변수
		System.out.println("test write");
		//가상경로를 물리경로로 변환하는 기능을 가진 객체 반환
		ServletContext application = req.getSession().getServletContext();
				
		//가상경로 -> 물리경로
		//String path = application.getRealPath("/WEB-INF/uploadfiles/");
		String path = application.getRealPath("/resources/image/admin/");
	
		//Upload 객체에 요청 데이터 저장 -> DB에 insert 처리
		Upload upload = new Upload();
		upload.setTitle(title);
		upload.setUploader(uploader);
		upload.setContent(content);
				
		//!!!!!!!!!!!!!!!int newUploadNo = uploadDao.insertUpload(upload);//insert하면 신규 자료번호 반환
		
		MultipartFile file = req.getFile("attach");//요청 데이터에서 파일 정보 추출
		if (file != null && file.getSize() > 0) {
			
			String fileName = file.getOriginalFilename();//파일이름 읽어서 변수에 저장
			if (fileName.contains("\\")) {//IE일 경우 전체 경로에서 파일이름만 추출
				//C:\ABC\DEF\xyz.txt -> xyz.txt
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			}
			
			//첨부파일 데이터 DB에 저장
			UploadFile fileItem = new UploadFile();
			//!!!!!!!!!!fileItem.setUploadNo(newUploadNo);//등록된 상위 글번호
			fileItem.setSavedFileName(Util.getUniqueFileName(path, fileName));
			fileItem.setUserFileName(fileName);
			
			//!!!!!!!!!!!!!uploadDao.insertUploadFile(fileItem);//DB에 저장
			
			//파일을 디스크에 저장
			try {
				FileOutputStream ostream = 
					//new FileOutputStream(new File(path, fileItem.getSavedFileName()));
					new FileOutputStream(new File(path, "logo.png"));
				InputStream istream = file.getInputStream();
				while (true) {
					int data = istream.read();
					if (data == -1) break;
					ostream.write(data);
				}
				istream.close();
				ostream.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return "redirect:/admin/companylogo.action";
		
	}
	
	/*@RequestMapping(value = "view.action", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("uploadno") int uploadNo) {
		
		Upload upload = uploadDao.getUploadByUploadNo(uploadNo);		
		
		ModelAndView mav = new ModelAndView();
		if (upload != null) {
			mav.setViewName("upload/uploadview");
			mav.addObject("upload", upload);
		} else {
			mav.setViewName("redirect:/upload/list.action");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "download.action", method = RequestMethod.GET)
	public ModelAndView download(@RequestParam("uploadfileno") int uploadFileNo) {
		
		UploadFile uploadFile = 
			uploadDao.getUploadFileByUploadFileNo(uploadFileNo);
		
		ModelAndView mav = new ModelAndView();
		if (uploadFile != null) {
			//다운로드 증가 - 여기서는 생략
			mav.setView(new DownloadView());
			mav.addObject("uploadfile", uploadFile);
		} else {
			mav.setViewName("redirect:/upload/list.action");
		}
		
		return mav;
	}*/

}















