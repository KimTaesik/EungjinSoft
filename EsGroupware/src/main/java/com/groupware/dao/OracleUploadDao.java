package com.groupware.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.groupware.dto.Upload;
import com.groupware.dto.UploadFile;
import com.groupware.mapper.EmployeeMapper;

@Component(value = "uploadDao")
public class OracleUploadDao implements UploadDao {
	private EmployeeMapper employeeMapper;
	
	@Autowired
	@Qualifier("employeeMapper")
	public void setEmployeeMapper(EmployeeMapper employeeMapper) {
		this.employeeMapper = employeeMapper;
	}
	
	@Override
	public int insertUpload(Upload upload) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("title", upload.getTitle());
		params.put("uploader", upload.getUploader());
		params.put("content", upload.getContent());
		
		return employeeMapper.insertUpload(params);
	}
	
	@Override
	public void insertUploadFile(UploadFile file) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("uploadno", file.getUploadNo());
		params.put("savedfilename", file.getSavedFileName());
		params.put("userfilename", file.getUserFileName());
		
		employeeMapper.insertUploadFile(params);
		
	}
	
	/*@Override
	public ArrayList<Upload> getUploadList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Upload> uploads = new ArrayList<Upload>();
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = "SELECT uploadno, title, regdate from upload where deleted = '0'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Upload upload = new Upload();
				upload.setUploadNo(rs.getInt(1));
				upload.setTitle(rs.getString(2));
				upload.setRegDate(rs.getDate(3));
				uploads.add(upload);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally { 
			try { rs.close(); } catch (Exception ex) { }
			try { pstmt.close(); } catch (Exception ex) { }
			try { conn.close(); } catch (Exception ex) { }
		}
		
		return uploads;
				
	}
	
	@Override
	public Upload getUploadByUploadNo(int uploadNo) {
		Connection conn = null;
		PreparedStatement pstmt = null, pstmt2 = null;;
		ResultSet rs = null, rs2 = null;
		Upload upload = null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = 
				"SELECT uploadno,title,uploader, " + 
				"content, regdate " +
				"FROM upload " + 
				"WHERE uploadno = ? AND deleted = '0'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uploadNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				upload = new Upload();
				upload.setUploadNo(uploadNo);
				upload.setTitle(rs.getString(2));
				upload.setUploader(rs.getString(3));
				upload.setContent(rs.getString(4));
				upload.setRegDate(rs.getDate(5));
				
				sql = 
					"SELECT uploadfileno, uploadno, savedfilename, userfilename " + 
					"FROM uploadfile WHERE uploadno = ?";
				pstmt2 = conn.prepareStatement(sql);
				pstmt2.setInt(1, uploadNo);
				rs2 = pstmt2.executeQuery();
				ArrayList<UploadFile> files = new ArrayList<UploadFile>();
				while (rs2.next()) {
					UploadFile file = new UploadFile();
					file.setUploadFileNo(rs2.getInt(1));
					file.setUploadNo(rs2.getInt(2));
					file.setSavedFileName(rs2.getString(3));
					file.setUserFileName(rs2.getString(4));
					files.add(file);					
				}
				upload.setFiles(files);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { rs2.close(); } catch (Exception ex) {}
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt2.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		return upload;
		
	}
	
	@Override
	public ArrayList<UploadFile> getUploadFilesByUploadNo(int uploadNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UploadFile> files = new ArrayList<UploadFile>();
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = 
				"SELECT uploadfileno, uploadno, savedfilename, userfilename " + 
				"FROM uploadfile WHERE uploadno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uploadNo);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				UploadFile file = new UploadFile();
				file.setUploadFileNo(rs.getInt(1));
				file.setUploadNo(rs.getInt(2));
				file.setSavedFileName(rs.getString(3));
				file.setUserFileName(rs.getString(4));
				files.add(file);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		return files;
		
	}
	
	@Override
	public UploadFile getUploadFileByUploadFileNo(int uploadFileNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UploadFile file = null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = 
				"SELECT uploadfileno, uploadno, savedfilename, userfilename " + 
				"FROM uploadfile WHERE uploadfileno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uploadFileNo);
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				file = new UploadFile();
				file.setUploadFileNo(rs.getInt(1));
				file.setUploadNo(rs.getInt(2));
				file.setSavedFileName(rs.getString(3));
				file.setUserFileName(rs.getString(4));
				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		return file;
		
	}*/
	
}
























