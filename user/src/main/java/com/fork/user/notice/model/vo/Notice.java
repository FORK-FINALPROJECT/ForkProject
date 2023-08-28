package com.fork.user.notice.model.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private int noticeCount;
	private String noticeCreateDate;
	private String noticeStatus;
	
}
