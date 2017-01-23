package com.geniisys.underwriting.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.geniisys.underwriting.controller.PremProductionController;
import com.geniisys.underwriting.service.PremProductionService;

public class PremProductionServiceImpl implements PremProductionService {

	@Override
	public String parseVsDate(String date) {

		DateFormat df = new SimpleDateFormat("yyyy-M-d");
		// Date startDate;
		// Date endDate;

		Date testDate;
		// String fromDate2 = "";
		// String toDate2 = "";
		String date2 = "";
		try {
			// startDate = df.parse(fromDate);
			// endDate = df.parse(toDate);
			testDate = df.parse(date);

			Integer year = testDate.getYear() + 1900 - 1;
			Integer month = testDate.getMonth() + 1;
			Integer day = testDate.getDate();
			date2 = year.toString() + "-" + month.toString() + "-" + day.toString();
			System.out.println(date2);
			/*
			 * year = endDate.getYear() + 1900 - 1; month = endDate.getMonth() +
			 * 1; intDate = endDate.getDate(); intDate = year.toString() + "-" +
			 * month.toString() + "-" + intDate.toString();
			 * System.out.println(toDate2);
			 */
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return date2;
	}

}
