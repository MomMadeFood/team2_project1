package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Pager {
	private int totalRows;	
	private int totalPageNo;
	private int totalGroupNo;	
	private int startPageNo;	
	private int endPageNo;		
	private int pageNo;			
	private int pagesPerGroup;
	private int groupNo;		
	private int rowsPerPage;	
	private int startRowNo;		
	private int startRowIndex;	
	private int endRowNo;		
	private int endRowIndex;	

	public Pager(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
		this.rowsPerPage = rowsPerPage;
		this.pagesPerGroup = pagesPerGroup;
		this.totalRows = totalRows;
		this.pageNo = pageNo;

		totalPageNo = totalRows / rowsPerPage;
		if(totalRows % rowsPerPage != 0) totalPageNo++;
		
		totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo % pagesPerGroup != 0) totalGroupNo++;
		
		groupNo = (pageNo - 1) / pagesPerGroup + 1; 
		
		startPageNo = (groupNo-1) * pagesPerGroup + 1;
		
		endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNo) endPageNo = totalPageNo;
		
		startRowNo = (pageNo - 1) * rowsPerPage + 1;
		startRowIndex = startRowNo - 1;
		endRowNo = pageNo * rowsPerPage;
		endRowIndex = endRowNo - 1; 
	}
}