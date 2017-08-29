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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tbox.dao.ObdEnsusDao;
import com.tbox.model.Ensus;
import com.tbox.model.Page;
import com.tbox.model.SortPant;
import com.tbox.util.ExlInfo;

@Controller
@RequestMapping("/table")
public class TableController {

	@Autowired
	ObdEnsusDao oud;

	@RequestMapping(value = "/ensus", method = GET)
	public String ecuUser(Model model, @RequestParam(value = "pagenum", defaultValue = "1") int pagenum,
			SortPant sortPant) {
		Page<Ensus> page = new Page<>(pagenum);
		if(sortPant.getKey() != null){
			page.setSort(new Sort(sortPant.getValue() == -1 ? Direction.DESC : Direction.ASC, sortPant.getKey()));
		}
		Page<Ensus> ensuses = oud.findAll(page);
		model.addAttribute("ensus", ensuses);
		model.addAttribute("v", sortPant.getValue());
		return "census_obduser";
	}

	@RequestMapping(value = "/exportensus", method = POST)
	public void ecuUserExport(HttpServletRequest request, PrintWriter out) {

		List<Ensus> es = oud.findAll();
		String fileSavingFolder = request.getServletContext().getRealPath(File.separator + "load" + File.separator);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

		String fileName = "tbox" + sdf.format(new Date()) + ".xlsx";
		int stat = 1;
		// 创建新工作簿
		XSSFWorkbook workbook = new XSSFWorkbook();
		// HSSFWorkbook workbook = new HSSFWorkbook();
		// 新建工作表
		XSSFSheet sheet = workbook.createSheet("hello");
		// 创建行,行号作为参数传递给createRow()方法,第一行从0开始计算
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell;
		// 创建单元格,row已经确定了行号,列号作为参数传递给createCell(),第一列从0开始计算
		for (int i = 0; i < ExlInfo.ENSUS_OBDUSE.length; i++) {
			cell = row.createCell(i);
			// 设置单元格的值,即C1的值(第一行,第yi列)
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
		// 输出到磁盘中
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

}
