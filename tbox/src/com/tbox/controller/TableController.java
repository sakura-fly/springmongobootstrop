package com.tbox.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tbox.dao.impl.ObdEnsusDaoImpl;
import com.tbox.model.Ensus;
import com.tbox.model.Page;
import com.tbox.model.SortPant;
import com.tbox.util.ExlInfo;

@Controller
@RequestMapping("/table")
public class TableController {

//	@Autowired
	ObdEnsusDaoImpl oud = new ObdEnsusDaoImpl();
	
	
	@RequestMapping(value = "", method = GET)
	public String table() {
		return "collapse";
	}

	@RequestMapping(value = "/ensus", method = GET)
	public String ecuUser() {
		return "census_obduser";
	}

	@RequestMapping(value = "/ensus", method = POST)
	public void suensList(Model model, @RequestParam(value = "pagenum", defaultValue = "1") int pagenum,
			SortPant sortPant, PrintWriter out) {
		Page<Ensus> page = new Page<>(pagenum);
		if (sortPant.getKey() != null && !sortPant.getKey().isEmpty()) {
			page.setSort(new Sort(sortPant.getValue() == -1 ? Direction.DESC : Direction.ASC, sortPant.getKey()));
		}
		Page<Ensus> ensuses = oud.findAll(page);
		model.addAttribute("ensus", ensuses);
		model.addAttribute("v", sortPant.getValue());
		out.print(ensuses);
	}

	@RequestMapping(value = "/exportensus", method = POST)
	public void ecuUserExport(HttpServletRequest request, PrintWriter out) {

		List<Ensus> es = oud.listAll();
		String fileSavingFolder = request.getServletContext().getRealPath(File.separator + "load" + File.separator);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

		String fileName = "tbox" + sdf.format(new Date()) + ".xlsx";
		int stat = 1;
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("tbox");
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell;
		for (int i = 0; i < ExlInfo.ENSUS_OBDUSE.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(ExlInfo.ENSUS_OBDUSE[i]);
		}
		for (int i = 0; i < es.size(); i++) {

			row = sheet.createRow(i + 1);
			cell = row.createCell(0);
			cell.setCellValue(es.get(i).getAppid());
			cell = row.createCell(1);
			cell.setCellValue(ExlInfo.ENSUS_MAIN);
			cell = row.createCell(2);
			cell.setCellValue(es.get(i).getCtime());
			cell = row.createCell(3);
			cell.setCellValue(es.get(i).getEtime());
			cell = row.createCell(4);
			cell.setCellValue(es.get(i).getCount());
			cell = row.createCell(5);
			cell.setCellValue(ExlInfo.ENSUS_SAPCE);
			cell = row.createCell(6);
			cell.setCellValue(es.get(i).getUnum());

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
			workbook.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
			stat = -2;
		}
		out.print("{\"stat\":" + stat + ",\"fileName\":\"" + fileName + "\"}");
	}
	// @RequestMapping(value = "/exportensus", method = GET)
	// public void ecuUserExportIO(HttpServletRequest request, PrintWriter out)
	// {
	//
	// List<Ensus> es = oud.findAll();
	// String fileSavingFolder =
	// request.getServletContext().getRealPath(File.separator + "load" +
	// File.separator);
	// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
	//
	// String fileName = "tbox" + sdf.format(new Date()) + ".xlsx";
	// int stat = 1;
	// XSSFWorkbook workbook = new XSSFWorkbook();
	// XSSFSheet sheet = workbook.createSheet("hello");
	// XSSFRow row = sheet.createRow(0);
	// XSSFCell cell;
	// for (int i = 0; i < ExlInfo.ENSUS_OBDUSE.length; i++) {
	// cell = row.createCell(i);
	// cell.setCellValue(ExlInfo.ENSUS_OBDUSE[i]);
	// }
	// for (int i = 0; i < es.size(); i++) {
	//
	// row = sheet.createRow(i + 1);
	// cell = row.createCell(0);
	// cell.setCellValue(es.get(i).getAppid());
	// cell = row.createCell(1);
	// cell.setCellValue(ExlInfo.ENSUS_MAIN);
	// cell = row.createCell(2);
	// cell.setCellValue(es.get(i).getCtime());
	// cell = row.createCell(3);
	// cell.setCellValue(es.get(i).getEtime());
	// cell = row.createCell(4);
	// cell.setCellValue(es.get(i).getCount());
	// cell = row.createCell(5);
	// cell.setCellValue(ExlInfo.ENSUS_SAPCE);
	// cell = row.createCell(6);
	// cell.setCellValue(es.get(i).getUnum());
	//
	// }
	// FileOutputStream fos = null;
	// try {
	// fos = new FileOutputStream(new File(fileSavingFolder + File.separator +
	// fileName));
	// } catch (FileNotFoundException e) {
	// stat = -1;
	// e.printStackTrace();
	// } finally {
	// try {
	// workbook.write(fos);
	// workbook.close();
	// fos.close();
	// } catch (IOException e) {
	// e.printStackTrace();
	// stat = -2;
	// }
	// }
	//
	// out.print("{\"stat\":" + stat + ",\"fileName\":\"" + fileName + "\"}");
	// }

}
