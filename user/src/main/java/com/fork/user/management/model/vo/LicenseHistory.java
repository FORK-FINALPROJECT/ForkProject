package com.fork.user.management.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LicenseHistory {

	private int lhNo;
	private int licenseNo;
	private int memberNo;
	private Date lhDate;
	private String lhDay;
	private String lhStatus;
	
}
