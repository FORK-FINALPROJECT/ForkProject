package com.fork.kiosk.main.model.vo;

import lombok.Data;

@Data
public class Menu{

	private int menuNo;
	private String menuName;
	private String menuDetail;
	private int price;
	private String originName;
	private String changeName;
	private String filePath;
	private int categoryNo;
	
}
