package com.groupware.dao;	

import java.util.ArrayList;

import com.groupware.dto.Upload;
import com.groupware.dto.UploadFile;

public interface UploadDao {

	int insertUpload(Upload upload);

	void insertUploadFile(UploadFile file);

	/*ArrayList<Upload> getUploadList();

	Upload getUploadByUploadNo(int uploadNo);

	ArrayList<UploadFile> getUploadFilesByUploadNo(int uploadNo);

	UploadFile getUploadFileByUploadFileNo(int uploadFileNo);*/

}