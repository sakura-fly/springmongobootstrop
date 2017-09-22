package com.gsdea.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsdea.util.ExlInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/userctl")
public class UserCtlController {

	@RequestMapping(value = "", method = GET)
	public String ucView() {
		return "userctl";
	}
                       
	@RequestMapping(value = "/export", method = RequestMethod.POST)
	public void export(PrintWriter out, String userList, HttpServletRequest request) {
		JSONArray list = JSONArray.fromObject(userList);
//		String fileSavingFolder = "";
		String fileSavingFolder = request.getSession().getServletContext().getRealPath(File.separator + "load" + File.separator);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

		String fileName = "tbox" + sdf.format(new Date()) + ".xlsx";
		int stat = 1;
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("tbox");
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell;
		for (int i = 0; i < ExlInfo.USER_TABLE_HEAD.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(ExlInfo.USER_TABLE_HEAD[i]);
		}
		for (int i = 0; i < list.size(); i++) {
			JSONObject user = (JSONObject) list.get(i);
			String ustat = "";
			switch ( user.getInt("stat")) {
			case 1:
				ustat = "禁用";
				break;
			case 2:
				ustat = "激活";
				break;
			case 3:
				ustat = "正在使用";

				break;

			default:
				break;
			}
			row = sheet.createRow(i + 1);
			cell = row.createCell(0);
			cell.setCellValue((String) user.get("regc"));
			cell = row.createCell(1);
			cell.setCellValue((String) user.get("uuid"));
			cell = row.createCell(2);
			cell.setCellValue((String) user.get("phone"));
			cell = row.createCell(3);
			cell.setCellValue((String) user.get("user"));
			cell = row.createCell(4);
			cell.setCellValue(ustat);
			cell = row.createCell(5);
			cell.setCellValue((String) user.get("time"));

		}
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(new File(fileSavingFolder + File.separator + fileName));
		} catch (FileNotFoundException e) {
			stat = -1;
			e.printStackTrace();
		}
		try {
			workbook.write(fos);
//			workbook.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
			stat = -2;
		}
		out.print("{\"stat\":" + stat + ",\"fileName\":\"" + fileName + "\"}");

	}

}
