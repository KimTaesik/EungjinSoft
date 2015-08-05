package com.groupware.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Log;
import com.groupware.dto.Position;
import com.groupware.ui.ThePager2;

 
@Controller
@RequestMapping(value="log")
public class LogController {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	@RequestMapping(value="userLoginInfo.action", method = RequestMethod.GET)
	public ModelAndView log123(String id, String year) {
		int logAllcount = 0;
		int[] logMonthcount = new int[12];
		if( year == null)
			year = "15";
		if (id != null) {
			logAllcount = employeeDao.logAllcount(id);	
			for (int i = 0; i < 12; i++) {
				logMonthcount[i] = employeeDao.logMonthcount(year + "/" + ( (int)(i+1) >= 10 ? "" : "0" ) + (int)(i+1), id);
				//logMonthcount[i-1] = employeeDao.logMonthcount("15/08");
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("logAllcount", logAllcount);
		mav.addObject("id", id);
		//mav.addObject("year", year);
		mav.addObject("logMonthcount", logMonthcount);
		mav.setViewName("admin/logview");
		return mav;
	}
	
	@RequestMapping(value="log.action", method = RequestMethod.GET)
	public ModelAndView log(Integer pageno) {
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 15; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "log.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo =pageno;
		}
		
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7
		
		//1. 데이터 조회 (DAO객체 이용해서 처리)
		
		//내가 조건에 맞게 검색한 정보만, (type별로) 나오게 하는 작업.
		List<Log> logs = null;

		logs= employeeDao.loglist(first, first + pageSize); // 페이징 처리로 해줬기 때문에 이런 처리를 해줘야한다.			

		
		//$$$$$$$$$$$$$$$$  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		
		
		dataCount = employeeDao.getlogCount(); //전체 게시물 갯수 조회
			
		ThePager2 pager = new ThePager2(dataCount, pageNo, pageSize, pagerSize, url);
		
		ModelAndView mav = new ModelAndView();

		/*List<Employee> employees = employeeDao.getEmployeeList(lineup);*/
	
		mav.addObject("logs", logs);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.setViewName("admin/log");
		
		return mav;
	}
	
	@RequestMapping(value="logexcel.action", method = RequestMethod.GET, produces="application/octet-stream")
	@ResponseBody
	public byte[] logexcel(HttpServletResponse resp) {
		Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
        Workbook xlsxWb = new XSSFWorkbook(); // Excel 2007 이상

        // *** Sheet-------------------------------------------------
        // Sheet 생성
        List<Log> logs = employeeDao.logalllist();

        Sheet sheet1 = xlsWb.createSheet("firstSheet");

        // 컬럼 너비 설정
        sheet1.setColumnWidth(0, 2000);
        sheet1.setColumnWidth(3, 5000);
        sheet1.setColumnWidth(4, 5000);

        // ----------------------------------------------------------
        // *** Style--------------------------------------------------
        // Cell 스타일 생성
        CellStyle cellStyle = xlsWb.createCellStyle();

        // 줄 바꿈
        cellStyle.setWrapText(true);

        // Cell 색깔, 무늬 채우기
        cellStyle.setFillForegroundColor(HSSFColor.LIME.index);
        cellStyle.setFillPattern(CellStyle.BIG_SPOTS);

        Row row = null;

        Cell cell = null;
        //----------------------------------------------------------

        // 첫 번째 줄
        row = sheet1.createRow(0);

        // 첫 번째 줄에 Cell 설정하기-------------
        cell = row.createCell(0);
        cell.setCellValue("NO");

        cell = row.createCell(1);
        cell.setCellValue("ID");
        
        cell = row.createCell(2);
        cell.setCellValue("부서");

        cell = row.createCell(3);
        cell.setCellValue("이름");
        
        cell = row.createCell(4);
        cell.setCellValue("IP");
        
        cell = row.createCell(5);
        cell.setCellValue("접속일");
        //---------------------------------

        // 두 번째 줄
        int i = 1;
        for (Log log : logs) {
        	row = sheet1.createRow(i);
        	
        	// 두 번째 줄에 Cell 설정하기-------------
            cell = row.createCell(0);
            cell.setCellValue(log.getLogno());

            cell = row.createCell(1);
            cell.setCellValue(log.getId());
            
            cell = row.createCell(2);
            cell.setCellValue(log.getDept());

            cell = row.createCell(3);
            cell.setCellValue(log.getName());
            
            cell = row.createCell(4);
            cell.setCellValue(log.getIp());
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            cell = row.createCell(5);
            cell.setCellValue(format.format(log.getLogdate()));
            //cell.setCellStyle(cellStyle); // 셀 스타일 적용
            i++;
            //---------------------------------
        }

        // excel 파일 저장


        
        try {
        	
        	ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
            xlsWb.write(fileOut);
            xlsWb.close();
            fileOut.close(); 
            
            resp.addHeader("Content-Disposition", "attachment; filename=Log.xls");
            
            return fileOut.toByteArray();
        	
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return null;

    }
	
	@RequestMapping(value="employeeexcel.action", method = RequestMethod.GET, produces="application/octet-stream")
	@ResponseBody
	public byte[] employeeexcel(HttpServletResponse resp) {
		Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
        Workbook xlsxWb = new XSSFWorkbook(); // Excel 2007 이상

        // *** Sheet-------------------------------------------------
        // Sheet 생성
        List<Employee> employees = employeeDao.getemList();
        List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
        
        Sheet sheet1 = xlsWb.createSheet("firstSheet");

        // 컬럼 너비 설정
        sheet1.setColumnWidth(0, 2000);
        sheet1.setColumnWidth(3, 5000);
        sheet1.setColumnWidth(4, 5000);

        // ----------------------------------------------------------
        // *** Style--------------------------------------------------
        // Cell 스타일 생성
        CellStyle cellStyle = xlsWb.createCellStyle();

        // 줄 바꿈
        cellStyle.setWrapText(true);

        // Cell 색깔, 무늬 채우기
        cellStyle.setFillForegroundColor(HSSFColor.LIME.index);
        cellStyle.setFillPattern(CellStyle.BIG_SPOTS);

        Row row = null;

        Cell cell = null;
        //----------------------------------------------------------

        // 첫 번째 줄
        row = sheet1.createRow(0);

        // 첫 번째 줄에 Cell 설정하기-------------
        cell = row.createCell(0);
        cell.setCellValue("ID");

        cell = row.createCell(1);
        cell.setCellValue("부서");

        cell = row.createCell(2);
        cell.setCellValue("직급");
        
        cell = row.createCell(3);
        cell.setCellValue("이름");
        
        cell = row.createCell(4);
        cell.setCellValue("전화번호");
        
        cell = row.createCell(5);
        cell.setCellValue("입사일");
        //---------------------------------

        // 두 번째 줄
        int i = 1;
        for (Employee employee : employees) {
        	row = sheet1.createRow(i);
        	
        	// 두 번째 줄에 Cell 설정하기-------------
            cell = row.createCell(0);
            cell.setCellValue(employee.getId());

            cell = row.createCell(1);   
            for (Dept dept : depts) {
            	if (employee.getDeptNo().equals(dept.getDeptNo())) {
            		cell.setCellValue(dept.getPartName());
            	}
            }
            
            cell = row.createCell(2);   
            for (Position position : positions) {
            	if (employee.getPositionNo().equals(position.getPositionNo())) {
            		cell.setCellValue(position.getPositionName());
            	}
            }   
            
            cell = row.createCell(3);
            cell.setCellValue(employee.getName());
            
            cell = row.createCell(4);
            cell.setCellValue(employee.getPhoneNumber());
            
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            cell = row.createCell(5);
            cell.setCellValue(format.format(employee.getJoinDatetype()));
            //cell.setCellStyle(cellStyle); // 셀 스타일 적용
            i++;
            //---------------------------------
        }

        // excel 파일 저장


        
        try {
        	
        	ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
            xlsWb.write(fileOut);
            xlsWb.close();
            fileOut.close(); 
            
            resp.addHeader("Content-Disposition", "attachment; filename=EmployeeList.xls");
            
            return fileOut.toByteArray();
        	
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return null;

    }
	
}
