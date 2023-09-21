-- 관리자 계정
--DROP USER FORK CASCADE;
--CREATE USER FORK IDENTIFIED BY FORK;
--GRANT RESOURCE, CONNECT TO FORK;

-- 생성 순서 : 원산지  - 카테고리 - 키오스크 - 매장 내 구조물  - 메뉴 - 옵션 - 총영수증 - 결제 - 영수증
--	        - 영수증+메뉴 - 메뉴+옵션 - // 이용권 - 회원 - 공지사항 - 공지사항첨부파일 - QNA - QNA댓글
-- 삭제 순서 : 역순

-- 테이블 리셋
DROP TABLE RECEIPT_OPTION CASCADE CONSTRAINTS;
DROP TABLE RECEIPT_MENU CASCADE CONSTRAINTS;
DROP TABLE RECEIPT CASCADE CONSTRAINTS;
DROP TABLE PAY CASCADE CONSTRAINTS;
DROP TABLE TOTAL_RECEIPT CASCADE CONSTRAINTS;
DROP TABLE OPT CASCADE CONSTRAINTS;
DROP TABLE MENU CASCADE CONSTRAINTS;
DROP TABLE STRUCTURE CASCADE CONSTRAINTS;
DROP TABLE KIOSK CASCADE CONSTRAINTS;
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
DROP TABLE COO CASCADE CONSTRAINTS;
DROP TABLE LICENSE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE LICENSE_HISTORY CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE NOTICE_ATTACH CASCADE CONSTRAINTS;
DROP TABLE QNA_BOARD CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;

-- 시퀀스 리셋
DROP SEQUENCE SEQ_RN;
DROP SEQUENCE SEQ_RCM;
DROP SEQUENCE SEQ_RC;
DROP SEQUENCE SEQ_PAY;
DROP SEQUENCE SEQ_TTRC;
DROP SEQUENCE SEQ_OPTION;
DROP SEQUENCE SEQ_MENU;
DROP SEQUENCE SEQ_CATEGORY;
DROP SEQUENCE SEQ_COO;
DROP SEQUENCE SEQ_LN;
DROP SEQUENCE SEQ_MN;
DROP SEQUENCE SEQ_LHNO;
DROP SEQUENCE SEQ_NN;
DROP SEQUENCE SEQ_FAN;
DROP SEQUENCE SEQ_BN;
DROP SEQUENCE SEQ_RNO;


-- 1. 원산지 시작
CREATE TABLE COO(
-- 칼럼
	COO_NO NUMBER,
	COO_NAME VARCHAR2(20) CONSTRAINT COO_NAME_NN NOT NULL,
	COO_COUNTRY VARCHAR2(20) CONSTRAINT COO_COUNTRY_NN NOT NULL,
-- 제약조건
	CONSTRAINT COO_NO_PK PRIMARY KEY (COO_NO),
	CONSTRAINT COO_NAME_UNQ UNIQUE (COO_NAME)
	
);
-- 테이블 코멘트
COMMENT ON TABLE COO IS '원산지';
-- 칼럼 코멘트
COMMENT ON COLUMN COO.COO_NO IS '원산지번호';
COMMENT ON COLUMN COO.COO_NAME IS '재료명';
COMMENT ON COLUMN COO.COO_COUNTRY IS '원산지명';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_COO NOCACHE;
-- 원산지 끝

-- 2. 카테고리 시작
CREATE TABLE CATEGORY(
-- 칼럼
	CATEGORY_NO NUMBER,
	CATEGORY_NAME VARCHAR2(40) CONSTRAINT CATEGORY_NAME_NN NOT NULL,
	PR_CATEGORY_NO NUMBER,
-- 제약조건
	CONSTRAINT CATEGORY_NO_PK PRIMARY KEY (CATEGORY_NO),
	CONSTRAINT CATEGORY_NAME_UNQ UNIQUE (CATEGORY_NAME)
);
-- 테이블 코멘트
COMMENT ON TABLE CATEGORY IS '카테고리';
-- 칼럼 코멘트
COMMENT ON COLUMN CATEGORY.CATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS '카테고리이름';
COMMENT ON COLUMN CATEGORY.PR_CATEGORY_NO IS '부모카테고리번호';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_CATEGORY NOCACHE;
-- 카테고리 끝

-- 3. 키오스크 시작
CREATE TABLE KIOSK(
-- 칼럼
	KIOSK_NO NUMBER,
	KIOSK_TYPE VARCHAR2(6),
-- 제약조건
	CONSTRAINT KIOSK_NO_PK PRIMARY KEY (KIOSK_NO),
	CONSTRAINT KIOSK_TYPE_CHK CHECK (KIOSK_TYPE IN ('홀','포장'))
);
-- 테이블 코멘트
COMMENT ON TABLE KIOSK IS '키오스크';
-- 칼럼 코멘트
COMMENT ON COLUMN KIOSK.KIOSK_NO IS '키오스크번호';
COMMENT ON COLUMN KIOSK.KIOSK_TYPE IS '홀/포장여부(홀,포장)';
-- 키오스크 기본 DB 구축
INSERT INTO KIOSK VALUES(0, '홀');
INSERT INTO KIOSK VALUES(1, '홀');
INSERT INTO KIOSK VALUES(2, '홀');
INSERT INTO KIOSK VALUES(3, '홀');
INSERT INTO KIOSK VALUES(4, '홀');
INSERT INTO KIOSK VALUES(5, '홀');
INSERT INTO KIOSK VALUES(6, '홀');
INSERT INTO KIOSK VALUES(7, '홀');
INSERT INTO KIOSK VALUES(8, '홀');
INSERT INTO KIOSK VALUES(9, '홀');
INSERT INTO KIOSK VALUES(10, '홀');
INSERT INTO KIOSK VALUES(11, '포장');
INSERT INTO KIOSK VALUES(12, '포장');
-- 키오스크 끝

-- 4. 매장 내 구조물 시작
CREATE TABLE STRUCTURE(
-- 칼럼
	KIOSK_NO NUMBER,
	STRUC_TYPE VARCHAR2(9) CONSTRAINT STRUC_TYPE_NN NOT NULL,
	STRUC_TITLE VARCHAR2(20),
	POSITION_X NUMBER CONSTRAINT POSITION_X_NN NOT NULL,
	POSITION_Y NUMBER CONSTRAINT POSITION_Y_NN NOT NULL,
-- 제약조건
	CONSTRAINT STRUC_KIOSK_NO_FK FOREIGN KEY (KIOSK_NO) REFERENCES KIOSK(KIOSK_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE STRUCTURE IS '매장내 구조물';
-- 칼럼 코멘트
COMMENT ON COLUMN STRUCTURE.KIOSK_NO IS '키오스크번호';
COMMENT ON COLUMN STRUCTURE.STRUC_TYPE IS '구조물타입(테이블,계산대,구조물)';
COMMENT ON COLUMN STRUCTURE.STRUC_TITLE IS '구조물이름';
COMMENT ON COLUMN STRUCTURE.POSITION_X IS 'X좌표';
COMMENT ON COLUMN STRUCTURE.POSITION_Y IS 'Y좌표';
-- 시퀀스 생성 하지않음
-- CREATE SEQUENCE SEQ_STRUC NOCACHE;
-- 매장내 구조물 끝

-- 5. 메뉴 시작 추가
CREATE TABLE MENU(
-- 칼럼
	MENU_NO NUMBER,
	MENU_NAME VARCHAR2(100) CONSTRAINT MENU_NAME_NN NOT NULL,
	MENU_DETAIL VARCHAR2(2000),
	PRICE NUMBER CONSTRAINT MENU_PRICE_NN NOT NULL,
	ORIGIN_NAME VARCHAR2(50),
	CHANGE_NAME VARCHAR2(50),
	FILE_PATH VARCHAR2(50),
	CATEGORY_NO NUMBER CONSTRAINT CATEGORY_NO_NN NOT NULL,
-- 제약조건
	CONSTRAINT MENU_NO_PK PRIMARY KEY (MENU_NO),
	CONSTRAINT MENU_NAME_UNQ UNIQUE (MENU_NAME),
	CONSTRAINT CATEGORY_NO_FK FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY(CATEGORY_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE MENU IS '메뉴';
-- 칼럼 코멘트
COMMENT ON COLUMN MENU.MENU_NO IS '메뉴번호';
COMMENT ON COLUMN MENU.MENU_NAME IS '메뉴이름';
COMMENT ON COLUMN MENU.MENU_DETAIL IS '메뉴상세정보';
COMMENT ON COLUMN MENU.PRICE IS '메뉴가격';
COMMENT ON COLUMN MENU.ORIGIN_NAME IS '메뉴사진원본명';
COMMENT ON COLUMN MENU.CHANGE_NAME IS '메뉴사진수정명';
COMMENT ON COLUMN MENU.FILE_PATH IS '메뉴사진경로';
COMMENT ON COLUMN MENU.CATEGORY_NO IS '카테고리번호';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_MENU NOCACHE;
-- 메뉴 끝

-- 6. 옵션 시작
CREATE TABLE OPT(
-- 칼럼
	OPTION_NO NUMBER,
	OPTION_NAME VARCHAR2(20) CONSTRAINT OPTION_NAME_NN NOT NULL,
	PRICE NUMBER DEFAULT 0,
	PR_OPTION_NO NUMBER,
	MENU_NO NUMBER,
-- 제약조건
	CONSTRAINT OPTION_NO_PK PRIMARY KEY (OPTION_NO),
	CONSTRAINT OPT_MENU_NO_FK FOREIGN KEY (MENU_NO) REFERENCES MENU(MENU_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE OPT IS ' 옵션';
-- 칼럼 코멘트
COMMENT ON COLUMN OPT.OPTION_NO IS '옵션번호';
COMMENT ON COLUMN OPT.OPTION_NAME IS '옵션이름';
COMMENT ON COLUMN OPT.PRICE IS '옵션가격';
COMMENT ON COLUMN OPT.PR_OPTION_NO IS '부모옵션번호';
COMMENT ON COLUMN OPT.MENU_NO IS '메뉴번호';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_OPTION NOCACHE;
-- 옵션 끝

-- 7. 총영수증 시작
CREATE TABLE TOTAL_RECEIPT(
-- 칼럼
	TR_NO NUMBER,
	KIOSK_NO NUMBER,
	ORDER_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT ORDER_STATUS_NN NOT NULL,
-- 제약조건 
	CONSTRAINT TR_NO_PK PRIMARY KEY (TR_NO),
	CONSTRAINT TOTAL_KIOSK_NO_FK FOREIGN KEY (KIOSK_NO) REFERENCES KIOSK(KIOSK_NO),
	CONSTRAINT ORDER_STATUS_CHECK CHECK(ORDER_STATUS IN ('N', 'Y'))
);
-- 테이블 코멘트
COMMENT ON TABLE TOTAL_RECEIPT IS '총영수증';
-- 칼럼 코멘트
COMMENT ON COLUMN TOTAL_RECEIPT.TR_NO IS '총영수증번호';
COMMENT ON COLUMN TOTAL_RECEIPT.KIOSK_NO IS '키오스크번호';
COMMENT ON COLUMN TOTAL_RECEIPT.ORDER_STATUS IS '사용중여부';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_TTRC NOCACHE;
-- 총영수증 끝

-- 8. 결제 시작
CREATE TABLE PAY(
-- 칼럼
	PAY_NO NUMBER,
	PAY_DATE DATE DEFAULT SYSDATE CONSTRAINT PAY_DATE_NN NOT NULL,
	PRICE NUMBER CONSTRAINT PAY_PRICE_NN NOT NULL,
-- 제약조건
	CONSTRAINT PAY_NO_PK PRIMARY KEY (PAY_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE PAY IS '결제';
-- 칼럼 코멘트
COMMENT ON COLUMN PAY.PAY_NO IS '결제번호';
COMMENT ON COLUMN PAY.PAY_DATE IS '결제날짜및시간';
COMMENT ON COLUMN PAY.PRICE IS '결제금액';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_PAY NOCACHE;
-- 결제 끝

-- 9. 영수증 시작
CREATE TABLE RECEIPT(
-- 칼럼
	RECEIPT_NO NUMBER,
	PAY_NO NUMBER CONSTRAINT PAY_NO_NN NOT NULL,
	TR_NO NUMBER CONSTRAINT TR_NO_NN NOT NULL,
-- 제약조건
	CONSTRAINT RECEIPT_NO_PK PRIMARY KEY (RECEIPT_NO),
	CONSTRAINT PAY_NO_FK FOREIGN KEY (PAY_NO) REFERENCES PAY (PAY_NO),
	CONSTRAINT TR_NO_FK FOREIGN KEY (TR_NO) REFERENCES TOTAL_RECEIPT(TR_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE RECEIPT IS '영수증';
-- 칼럼 코멘트
COMMENT ON COLUMN RECEIPT.RECEIPT_NO IS '영수증번호';
COMMENT ON COLUMN RECEIPT.PAY_NO IS '결제번호';
COMMENT ON COLUMN RECEIPT.TR_NO IS '총영수증번호';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_RC NOCACHE;
-- 영수증 끝

-- 10. 영수증+메뉴(영수증별 메뉴 상세)
CREATE TABLE RECEIPT_MENU(
-- 칼럼
	RCM_NO NUMBER,
	RECEIPT_NO NUMBER CONSTRAINT RECEIPT_NO_NN NOT NULL,
	MENU_NO NUMBER CONSTRAINT MENU_NO_NN NOT NULL,
	CNT NUMBER DEFAULT 1,
-- 제약조건
	CONSTRAINT RCM_NO_PK PRIMARY KEY (RCM_NO),
	CONSTRAINT RECEIPT_NO_FK FOREIGN KEY (RECEIPT_NO) REFERENCES RECEIPT (RECEIPT_NO),
	CONSTRAINT RECEIPT_MENU_NO_FK FOREIGN KEY (MENU_NO) REFERENCES MENU (MENU_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE RECEIPT_MENU IS '영수증+메뉴(영수증별 메뉴 상세)';
-- 칼럼 코멘트
COMMENT ON COLUMN RECEIPT_MENU.RCM_NO IS '영수증별메뉴상세번호';
COMMENT ON COLUMN RECEIPT_MENU.RECEIPT_NO IS '영수증번호';
COMMENT ON COLUMN RECEIPT_MENU.MENU_NO IS '메뉴번호';
COMMENT ON COLUMN RECEIPT_MENU.CNT IS '수량';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_RCM NOCACHE;
-- 영수증+메뉴 끝

-- 11. 영수증 메뉴+옵션(메뉴별 옵션 상세)
CREATE TABLE RECEIPT_OPTION(
-- 칼럼
	RCM_NO NUMBER,
	OPTION_NO NUMBER,
-- 제약조건
	CONSTRAINT RECEIPT_OPTION_PFK PRIMARY KEY (RCM_NO, OPTION_NO),
	CONSTRAINT RCM_NO_FK FOREIGN KEY (RCM_NO) REFERENCES RECEIPT_MENU (RCM_NO),
	CONSTRAINT OPTION_NO_FK FOREIGN KEY (OPTION_NO) REFERENCES OPT (OPTION_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE RECEIPT_OPTION IS '영수증 메뉴+옵션(메뉴별 옵션 상세)';
-- 칼럼 코멘트
COMMENT ON COLUMN RECEIPT_OPTION.RCM_NO IS '영수증별메뉴상세번호';
COMMENT ON COLUMN RECEIPT_OPTION.OPTION_NO IS '옵션번호';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_RN NOCACHE;
-- 영수증 메뉴+옵션 끝

-- 12. 이용권 시작
CREATE TABLE LICENSE(
-- 컬럼
    LICENSE_NO NUMBER,
    LICENSE_DATE VARCHAR2(10) CONSTRAINT LICENSE_DATE_NN NOT NULL,
    LICENSE_PRICE NUMBER CONSTRAINT LICENSE_PRICE_NN NOT NULL,
-- 제약조건
    CONSTRAINT LICENSE_NO_PK PRIMARY KEY(LICENSE_NO)
);
-- 테이블 코멘트
COMMENT ON TABLE LICENSE IS  '이용권';
-- 컬럼 코멘트
COMMENT ON COLUMN LICENSE.LICENSE_NO IS '이용권번호';
COMMENT ON COLUMN LICENSE.LICENSE_DATE IS '이용권기간';
COMMENT ON COLUMN LICENSE.LICENSE_PRICE IS '이용권가격';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_LN NOCACHE;
-- 이용권 끝

-- 13. 회원 시작
CREATE TABLE MEMBER(
-- 컬럼
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(30) CONSTRAINT MEMBER_ID_NN NOT NULL,
    MEMBER_PWD VARCHAR2(100) CONSTRAINT MEMBER_PWD_NN NOT NULL,
    MEMBER_NAME VARCHAR2(30) CONSTRAINT MEMBER_NAME_NN NOT NULL,
    FILE_NO VARCHAR2(12) CONSTRAINT FILE_NO_NN NOT NULL,
    FILE_ORIGIN_NAME VARCHAR2(200) CONSTRAINT FILE_ORIGIN_NAME_NN NOT NULL,
    FILE_CHANGE_NAME VARCHAR2(30) CONSTRAINT FILE_CHANGE_NAME_NN NOT NULL,
    ADDRESS VARCHAR2(200) CONSTRAINT ADDRESS_NN NOT NULL,
    PHONE VARCHAR2(13) CONSTRAINT PHONE_NN NOT NULL,
    EMAIL VARCHAR2(30) CONSTRAINT EMAIL_NN NOT NULL,
    EXTRA_NUMBER VARCHAR2(4),
    MODIFY_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT MODIFY_DATE_NN NOT NULL,
    STATUS VARCHAR2(1) CONSTRAINT STATUS_NN NOT NULL,
-- 제약조건
    CONSTRAINT MEMBER_NO_PK PRIMARY KEY(MEMBER_NO),
    CONSTRAINT MEMBER_ID_UNQ UNIQUE(MEMBER_ID),
    CONSTRAINT MEMBER_NAME_UNQ UNIQUE(MEMBER_NAME),
    CONSTRAINT FILE_NO_UNQ UNIQUE(FILE_NO),
    CONSTRAINT FILE_CHANGE_NAME_UNQ UNIQUE(FILE_CHANGE_NAME),
    CONSTRAINT PHONE_UNQ UNIQUE(PHONE),
    CONSTRAINT EMAIL_UNQ UNIQUE(EMAIL),
    CONSTRAINT STATUS_CHECK CHECK(STATUS IN ('N', 'Y'))
);
-- 테이블 코멘트
COMMENT ON TABLE MEMBER IS '회원';
-- 컬럼 코멘트
COMMENT ON COLUMN MEMBER.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '사업자명';
COMMENT ON COLUMN MEMBER.FILE_NO IS '사업자등록증번호';
COMMENT ON COLUMN MEMBER.FILE_ORIGIN_NAME IS '사업자등록증원본파일';
COMMENT ON COLUMN MEMBER.FILE_CHANGE_NAME IS '사업자등록증암호화파일';
COMMENT ON COLUMN MEMBER.ADDRESS IS '매장주소';
COMMENT ON COLUMN MEMBER.PHONE IS '사업자번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '사업자이메일';
COMMENT ON COLUMN MEMBER.EXTRA_NUMBER IS '인증번호';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.STATUS IS '가입승인여부';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_MN NOCACHE;
-- 회원 끝

-- 14. 회원 + 이용권 시작
CREATE TABLE LICENSE_HISTORY(
-- 컬럼
    LH_NO NUMBER,
    LICENSE_NO NUMBER CONSTRAINT LICENSE_NO_NN NOT NULL,
    MEMBER_NO NUMBER CONSTRAINT MEMBR_NO_NN NOT NULL,
    LH_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT LH_DATE_NN NOT NULL,
    LH_DAY VARCHAR2(21) CONSTRAINT LH_DAY_NN NOT NULL,
    LH_STATUS VARCHAR2(1) CONSTRAINT LH_STATUS_NN NOT NULL,
-- 제약조건
    CONSTRAINT LH_NO_PK PRIMARY KEY(LH_NO),
    CONSTRAINT LH_LICENSE_NO_FK FOREIGN KEY(LICENSE_NO) REFERENCES LICENSE(LICENSE_NO),
    CONSTRAINT LH_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT LH_STATUS_CHECK CHECK(LH_STATUS IN ('Y', 'N'))
);
-- 테이블 코멘트
COMMENT ON TABLE LICENSE_HISTORY IS '회원이용권';
-- 컬럼 코멘트
COMMENT ON COLUMN LICENSE_HISTORY.LH_NO IS '사용권번호';
COMMENT ON COLUMN LICENSE_HISTORY.LICENSE_NO IS '이용권번호';
COMMENT ON COLUMN LICENSE_HISTORY.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN LICENSE_HISTORY.LH_DATE IS '이용권구매날짜';
COMMENT ON COLUMN LICENSE_HISTORY.LH_DAY IS '이용기간';
COMMENT ON COLUMN LICENSE_HISTORY.LH_STATUS IS '이용권상태';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_LHNO NOCACHE;
-- 회원 + 이용권 끝

-- 15. 공지사항 시작
CREATE TABLE NOTICE(
-- 컬럼
    NOTICE_NO NUMBER,
    NOTICE_TITLE VARCHAR2(100) CONSTRAINT NOTICE_TITLE_NN NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) CONSTRAINT NOTICE_CONTENT_NN NOT NULL,
    NOTICE_WRITER NUMBER CONSTRAINT NOTICE_WRITER_NN NOT NULL,
    NOTICE_COUNT NUMBER DEFAULT 0,
    NOTICE_CREATE_DATE VARCHAR2(10) DEFAULT SYSDATE,
    NOTICE_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT NOTICE_STATUS_NN NOT NULL,
-- 제약조건
    CONSTRAINT NOTICE_NO_PK PRIMARY KEY(NOTICE_NO),
    CONSTRAINT NOTICE_WRITER_FK FOREIGN KEY(NOTICE_WRITER) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT NOTICE_STATUS_CHECK CHECK(NOTICE_STATUS IN ('Y', 'N'))
);
-- 테이블 코멘트
COMMENT ON TABLE NOTICE IS '공지사항';
-- 컬럼 코멘트
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항내용';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER IS '작성자회원번호';
COMMENT ON COLUMN NOTICE.NOTICE_COUNT IS '공지사항조회수';
COMMENT ON COLUMN NOTICE.NOTICE_CREATE_DATE IS '공지사항작성일';
COMMENT ON COLUMN NOTICE.NOTICE_STATUS IS '공지사항상태';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_NN NOCACHE;
-- 공지사항 끝

-- 16. 공지사항 첨부파일 시작
CREATE TABLE NOTICE_ATTACH(
-- 컬럼
    FA_NO NUMBER,
    REF_NNO NUMBER CONSTRAINT REF_NNO_NN NOT NULL,
    FA_ORIGIN_NAME VARCHAR2(300) CONSTRAINT FA_ORIGIN_NAME_NN NOT NULL,
    FA_CHANGE_NAME VARCHAR2(300) CONSTRAINT FA_CHANGE_NAME_NN NOT NULL,
    FA_PATH VARCHAR2(1000),
    FA_UPLOAD_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT FA_UPLOAD_DATE_NN NOT NULL,
    FA_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT FA_STATUS_NN NOT NULL,
-- 제약조건
    CONSTRAINT FA_NO_PK PRIMARY KEY(FA_NO),
    CONSTRAINT REF_NNO_FK FOREIGN KEY(REF_NNO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,
    CONSTRAINT FA_STATUS_CHECK CHECK(FA_STATUS IN ('Y', 'N'))
);
-- 테이블 코멘트
COMMENT ON TABLE NOTICE_ATTACH IS '공지사항첨부파일';
-- 컬럼 코멘트
COMMENT ON COLUMN NOTICE_ATTACH.FA_NO IS '공지시항첨부파일번호';
COMMENT ON COLUMN NOTICE_ATTACH.REF_NNO IS '공지사항참조번호';
COMMENT ON COLUMN NOTICE_ATTACH.FA_ORIGIN_NAME IS '공지사항파일원본명';
COMMENT ON COLUMN NOTICE_ATTACH.FA_CHANGE_NAME IS '공지사항파일수정명';
COMMENT ON COLUMN NOTICE_ATTACH.FA_PATH IS '공지사항파일경로';
COMMENT ON COLUMN NOTICE_ATTACH.FA_UPLOAD_DATE IS '공지사항파일업로드일';
COMMENT ON COLUMN NOTICE_ATTACH.FA_STATUS IS '공지사항첨부파일상태';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_FAN NOCACHE;
-- 공지사항 첨부파일 끝

-- 17. QNA 게시글 시작
CREATE TABLE QNA_BOARD(
-- 컬럼
    BOARD_NO NUMBER,
    BOARD_TITLE VARCHAR2(100) CONSTRAINT BOARD_TITLE_NN NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) CONSTRAINT BOARD_CONTENT_NN NOT NULL,
    BOARD_WRITER NUMBER CONSTRAINT BOARD_WRITER_NN NOT NULL,
    BOARD_CREATE_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT BOARD_CREATE_DATE_NN NOT NULL,
    BOARD_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT BOARD_STATUS_NN NOT NULL,
    BOARD_COUNT NUMBER DEFAULT 0,
-- 제약조건
    CONSTRAINT BOARD_NO_PK PRIMARY KEY(BOARD_NO),
    CONSTRAINT BOARD_STATUS_CHECK CHECK(BOARD_STATUS IN ('N', 'Y'))
);
-- 테이블 코멘트
COMMENT ON TABLE QNA_BOARD IS 'QNA게시글';
-- 컬럼 코멘트
COMMENT ON COLUMN QNA_BOARD.BOARD_NO IS 'QNA게시글번호';
COMMENT ON COLUMN QNA_BOARD.BOARD_TITLE IS 'QNA게시글제목';
COMMENT ON COLUMN QNA_BOARD.BOARD_CONTENT IS 'QNA게시글내용';
COMMENT ON COLUMN QNA_BOARD.BOARD_WRITER IS '작성자회원번호';
COMMENT ON COLUMN QNA_BOARD.BOARD_CREATE_DATE IS 'QNA게시글작성일';
COMMENT ON COLUMN QNA_BOARD.BOARD_STATUS IS 'QNA게시글상태';
COMMENT ON COLUMN QNA_BOARD.BOARD_COUNT IS 'QNA조회수';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_BN NOCACHE;
-- QNA 게시글 끝

-- 18. QNA 게시판 댓글 시작
CREATE TABLE REPLY(
-- 컬럼
    REPLY_NO NUMBER,
    REPLY_CONTENT VARCHAR2(500) CONSTRAINT REPLY_CONTENT_NN NOT NULL,
    REF_BNO NUMBER CONSTRAINT REF_BNO_NN NOT NULL,
    REPLY_WRITER NUMBER CONSTRAINT REPLY_WRITER_NN NOT NULL,
    REPLY_CREATE_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT REPLY_CREATE_DATE_NN NOT NULL,
    REPLY_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT REPLY_STATUS_NN NOT NULL,
-- 제약조건
    CONSTRAINT REPLY_NO_PK PRIMARY KEY(REPLY_NO),
    CONSTRAINT REF_BNO_FK FOREIGN KEY(REF_BNO) REFERENCES QNA_BOARD(BOARD_NO) ON DELETE CASCADE,
    CONSTRAINT REPLY_WRITER_FK FOREIGN KEY(REPLY_WRITER) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT REPLY_STATUS_CHECK CHECK(REPLY_STATUS IN ('N', 'Y'))
);
-- 테이블 코멘트
COMMENT ON TABLE REPLY IS 'QNA게시판댓글';
-- 컬럼 코멘트
COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글번호';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '댓글내용';
COMMENT ON COLUMN REPLY.REF_BNO IS 'QNA게시판참조번호';
COMMENT ON COLUMN REPLY.REPLY_WRITER IS '작성자회원번호';
COMMENT ON COLUMN REPLY.REPLY_CREATE_DATE IS '댓글작성일';
COMMENT ON COLUMN REPLY.REPLY_STATUS IS '댓글상태';
-- 시퀀스 생성
CREATE SEQUENCE SEQ_RNO NOCACHE;
-- QNA 게시판 댓글 끝

INSERT INTO LICENSE VALUES(SEQ_LN.NEXTVAL,3,100);

COMMIT;
