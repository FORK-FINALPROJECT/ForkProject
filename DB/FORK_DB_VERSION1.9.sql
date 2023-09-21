-- ������ ����
--DROP USER FORK CASCADE;
--CREATE USER FORK IDENTIFIED BY FORK;
--GRANT RESOURCE, CONNECT TO FORK;

-- ���� ���� : ������  - ī�װ��� - Ű����ũ - ���� �� ������  - �޴� - �ɼ� - �ѿ����� - ���� - ������
--	        - ������+�޴� - �޴�+�ɼ� - // �̿�� - ȸ�� - �������� - ��������÷������ - QNA - QNA���
-- ���� ���� : ����

-- ���̺� ����
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

-- ������ ����
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


-- 1. ������ ����
CREATE TABLE COO(
-- Į��
	COO_NO NUMBER,
	COO_NAME VARCHAR2(20) CONSTRAINT COO_NAME_NN NOT NULL,
	COO_COUNTRY VARCHAR2(20) CONSTRAINT COO_COUNTRY_NN NOT NULL,
-- ��������
	CONSTRAINT COO_NO_PK PRIMARY KEY (COO_NO),
	CONSTRAINT COO_NAME_UNQ UNIQUE (COO_NAME)
	
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE COO IS '������';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN COO.COO_NO IS '��������ȣ';
COMMENT ON COLUMN COO.COO_NAME IS '����';
COMMENT ON COLUMN COO.COO_COUNTRY IS '��������';
-- ������ ����
CREATE SEQUENCE SEQ_COO NOCACHE;
-- ������ ��

-- 2. ī�װ��� ����
CREATE TABLE CATEGORY(
-- Į��
	CATEGORY_NO NUMBER,
	CATEGORY_NAME VARCHAR2(40) CONSTRAINT CATEGORY_NAME_NN NOT NULL,
	PR_CATEGORY_NO NUMBER,
-- ��������
	CONSTRAINT CATEGORY_NO_PK PRIMARY KEY (CATEGORY_NO),
	CONSTRAINT CATEGORY_NAME_UNQ UNIQUE (CATEGORY_NAME)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE CATEGORY IS 'ī�װ���';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN CATEGORY.CATEGORY_NO IS 'ī�װ�����ȣ';
COMMENT ON COLUMN CATEGORY.CATEGORY_NAME IS 'ī�װ����̸�';
COMMENT ON COLUMN CATEGORY.PR_CATEGORY_NO IS '�θ�ī�װ�����ȣ';
-- ������ ����
CREATE SEQUENCE SEQ_CATEGORY NOCACHE;
-- ī�װ��� ��

-- 3. Ű����ũ ����
CREATE TABLE KIOSK(
-- Į��
	KIOSK_NO NUMBER,
	KIOSK_TYPE VARCHAR2(6),
-- ��������
	CONSTRAINT KIOSK_NO_PK PRIMARY KEY (KIOSK_NO),
	CONSTRAINT KIOSK_TYPE_CHK CHECK (KIOSK_TYPE IN ('Ȧ','����'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE KIOSK IS 'Ű����ũ';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN KIOSK.KIOSK_NO IS 'Ű����ũ��ȣ';
COMMENT ON COLUMN KIOSK.KIOSK_TYPE IS 'Ȧ/���忩��(Ȧ,����)';
-- Ű����ũ �⺻ DB ����
INSERT INTO KIOSK VALUES(0, 'Ȧ');
INSERT INTO KIOSK VALUES(1, 'Ȧ');
INSERT INTO KIOSK VALUES(2, 'Ȧ');
INSERT INTO KIOSK VALUES(3, 'Ȧ');
INSERT INTO KIOSK VALUES(4, 'Ȧ');
INSERT INTO KIOSK VALUES(5, 'Ȧ');
INSERT INTO KIOSK VALUES(6, 'Ȧ');
INSERT INTO KIOSK VALUES(7, 'Ȧ');
INSERT INTO KIOSK VALUES(8, 'Ȧ');
INSERT INTO KIOSK VALUES(9, 'Ȧ');
INSERT INTO KIOSK VALUES(10, 'Ȧ');
INSERT INTO KIOSK VALUES(11, '����');
INSERT INTO KIOSK VALUES(12, '����');
-- Ű����ũ ��

-- 4. ���� �� ������ ����
CREATE TABLE STRUCTURE(
-- Į��
	KIOSK_NO NUMBER,
	STRUC_TYPE VARCHAR2(9) CONSTRAINT STRUC_TYPE_NN NOT NULL,
	STRUC_TITLE VARCHAR2(20),
	POSITION_X NUMBER CONSTRAINT POSITION_X_NN NOT NULL,
	POSITION_Y NUMBER CONSTRAINT POSITION_Y_NN NOT NULL,
-- ��������
	CONSTRAINT STRUC_KIOSK_NO_FK FOREIGN KEY (KIOSK_NO) REFERENCES KIOSK(KIOSK_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE STRUCTURE IS '���峻 ������';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN STRUCTURE.KIOSK_NO IS 'Ű����ũ��ȣ';
COMMENT ON COLUMN STRUCTURE.STRUC_TYPE IS '������Ÿ��(���̺�,����,������)';
COMMENT ON COLUMN STRUCTURE.STRUC_TITLE IS '�������̸�';
COMMENT ON COLUMN STRUCTURE.POSITION_X IS 'X��ǥ';
COMMENT ON COLUMN STRUCTURE.POSITION_Y IS 'Y��ǥ';
-- ������ ���� ��������
-- CREATE SEQUENCE SEQ_STRUC NOCACHE;
-- ���峻 ������ ��

-- 5. �޴� ���� �߰�
CREATE TABLE MENU(
-- Į��
	MENU_NO NUMBER,
	MENU_NAME VARCHAR2(100) CONSTRAINT MENU_NAME_NN NOT NULL,
	MENU_DETAIL VARCHAR2(2000),
	PRICE NUMBER CONSTRAINT MENU_PRICE_NN NOT NULL,
	ORIGIN_NAME VARCHAR2(50),
	CHANGE_NAME VARCHAR2(50),
	FILE_PATH VARCHAR2(50),
	CATEGORY_NO NUMBER CONSTRAINT CATEGORY_NO_NN NOT NULL,
-- ��������
	CONSTRAINT MENU_NO_PK PRIMARY KEY (MENU_NO),
	CONSTRAINT MENU_NAME_UNQ UNIQUE (MENU_NAME),
	CONSTRAINT CATEGORY_NO_FK FOREIGN KEY (CATEGORY_NO) REFERENCES CATEGORY(CATEGORY_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE MENU IS '�޴�';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN MENU.MENU_NO IS '�޴���ȣ';
COMMENT ON COLUMN MENU.MENU_NAME IS '�޴��̸�';
COMMENT ON COLUMN MENU.MENU_DETAIL IS '�޴�������';
COMMENT ON COLUMN MENU.PRICE IS '�޴�����';
COMMENT ON COLUMN MENU.ORIGIN_NAME IS '�޴�����������';
COMMENT ON COLUMN MENU.CHANGE_NAME IS '�޴�����������';
COMMENT ON COLUMN MENU.FILE_PATH IS '�޴��������';
COMMENT ON COLUMN MENU.CATEGORY_NO IS 'ī�װ�����ȣ';
-- ������ ����
CREATE SEQUENCE SEQ_MENU NOCACHE;
-- �޴� ��

-- 6. �ɼ� ����
CREATE TABLE OPT(
-- Į��
	OPTION_NO NUMBER,
	OPTION_NAME VARCHAR2(20) CONSTRAINT OPTION_NAME_NN NOT NULL,
	PRICE NUMBER DEFAULT 0,
	PR_OPTION_NO NUMBER,
	MENU_NO NUMBER,
-- ��������
	CONSTRAINT OPTION_NO_PK PRIMARY KEY (OPTION_NO),
	CONSTRAINT OPT_MENU_NO_FK FOREIGN KEY (MENU_NO) REFERENCES MENU(MENU_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE OPT IS ' �ɼ�';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN OPT.OPTION_NO IS '�ɼǹ�ȣ';
COMMENT ON COLUMN OPT.OPTION_NAME IS '�ɼ��̸�';
COMMENT ON COLUMN OPT.PRICE IS '�ɼǰ���';
COMMENT ON COLUMN OPT.PR_OPTION_NO IS '�θ�ɼǹ�ȣ';
COMMENT ON COLUMN OPT.MENU_NO IS '�޴���ȣ';
-- ������ ����
CREATE SEQUENCE SEQ_OPTION NOCACHE;
-- �ɼ� ��

-- 7. �ѿ����� ����
CREATE TABLE TOTAL_RECEIPT(
-- Į��
	TR_NO NUMBER,
	KIOSK_NO NUMBER,
	ORDER_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT ORDER_STATUS_NN NOT NULL,
-- �������� 
	CONSTRAINT TR_NO_PK PRIMARY KEY (TR_NO),
	CONSTRAINT TOTAL_KIOSK_NO_FK FOREIGN KEY (KIOSK_NO) REFERENCES KIOSK(KIOSK_NO),
	CONSTRAINT ORDER_STATUS_CHECK CHECK(ORDER_STATUS IN ('N', 'Y'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE TOTAL_RECEIPT IS '�ѿ�����';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN TOTAL_RECEIPT.TR_NO IS '�ѿ�������ȣ';
COMMENT ON COLUMN TOTAL_RECEIPT.KIOSK_NO IS 'Ű����ũ��ȣ';
COMMENT ON COLUMN TOTAL_RECEIPT.ORDER_STATUS IS '����߿���';
-- ������ ����
CREATE SEQUENCE SEQ_TTRC NOCACHE;
-- �ѿ����� ��

-- 8. ���� ����
CREATE TABLE PAY(
-- Į��
	PAY_NO NUMBER,
	PAY_DATE DATE DEFAULT SYSDATE CONSTRAINT PAY_DATE_NN NOT NULL,
	PRICE NUMBER CONSTRAINT PAY_PRICE_NN NOT NULL,
-- ��������
	CONSTRAINT PAY_NO_PK PRIMARY KEY (PAY_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE PAY IS '����';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN PAY.PAY_NO IS '������ȣ';
COMMENT ON COLUMN PAY.PAY_DATE IS '������¥�׽ð�';
COMMENT ON COLUMN PAY.PRICE IS '�����ݾ�';
-- ������ ����
CREATE SEQUENCE SEQ_PAY NOCACHE;
-- ���� ��

-- 9. ������ ����
CREATE TABLE RECEIPT(
-- Į��
	RECEIPT_NO NUMBER,
	PAY_NO NUMBER CONSTRAINT PAY_NO_NN NOT NULL,
	TR_NO NUMBER CONSTRAINT TR_NO_NN NOT NULL,
-- ��������
	CONSTRAINT RECEIPT_NO_PK PRIMARY KEY (RECEIPT_NO),
	CONSTRAINT PAY_NO_FK FOREIGN KEY (PAY_NO) REFERENCES PAY (PAY_NO),
	CONSTRAINT TR_NO_FK FOREIGN KEY (TR_NO) REFERENCES TOTAL_RECEIPT(TR_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE RECEIPT IS '������';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN RECEIPT.RECEIPT_NO IS '��������ȣ';
COMMENT ON COLUMN RECEIPT.PAY_NO IS '������ȣ';
COMMENT ON COLUMN RECEIPT.TR_NO IS '�ѿ�������ȣ';
-- ������ ����
CREATE SEQUENCE SEQ_RC NOCACHE;
-- ������ ��

-- 10. ������+�޴�(�������� �޴� ��)
CREATE TABLE RECEIPT_MENU(
-- Į��
	RCM_NO NUMBER,
	RECEIPT_NO NUMBER CONSTRAINT RECEIPT_NO_NN NOT NULL,
	MENU_NO NUMBER CONSTRAINT MENU_NO_NN NOT NULL,
	CNT NUMBER DEFAULT 1,
-- ��������
	CONSTRAINT RCM_NO_PK PRIMARY KEY (RCM_NO),
	CONSTRAINT RECEIPT_NO_FK FOREIGN KEY (RECEIPT_NO) REFERENCES RECEIPT (RECEIPT_NO),
	CONSTRAINT RECEIPT_MENU_NO_FK FOREIGN KEY (MENU_NO) REFERENCES MENU (MENU_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE RECEIPT_MENU IS '������+�޴�(�������� �޴� ��)';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN RECEIPT_MENU.RCM_NO IS '���������޴��󼼹�ȣ';
COMMENT ON COLUMN RECEIPT_MENU.RECEIPT_NO IS '��������ȣ';
COMMENT ON COLUMN RECEIPT_MENU.MENU_NO IS '�޴���ȣ';
COMMENT ON COLUMN RECEIPT_MENU.CNT IS '����';
-- ������ ����
CREATE SEQUENCE SEQ_RCM NOCACHE;
-- ������+�޴� ��

-- 11. ������ �޴�+�ɼ�(�޴��� �ɼ� ��)
CREATE TABLE RECEIPT_OPTION(
-- Į��
	RCM_NO NUMBER,
	OPTION_NO NUMBER,
-- ��������
	CONSTRAINT RECEIPT_OPTION_PFK PRIMARY KEY (RCM_NO, OPTION_NO),
	CONSTRAINT RCM_NO_FK FOREIGN KEY (RCM_NO) REFERENCES RECEIPT_MENU (RCM_NO),
	CONSTRAINT OPTION_NO_FK FOREIGN KEY (OPTION_NO) REFERENCES OPT (OPTION_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE RECEIPT_OPTION IS '������ �޴�+�ɼ�(�޴��� �ɼ� ��)';
-- Į�� �ڸ�Ʈ
COMMENT ON COLUMN RECEIPT_OPTION.RCM_NO IS '���������޴��󼼹�ȣ';
COMMENT ON COLUMN RECEIPT_OPTION.OPTION_NO IS '�ɼǹ�ȣ';
-- ������ ����
CREATE SEQUENCE SEQ_RN NOCACHE;
-- ������ �޴�+�ɼ� ��

-- 12. �̿�� ����
CREATE TABLE LICENSE(
-- �÷�
    LICENSE_NO NUMBER,
    LICENSE_DATE VARCHAR2(10) CONSTRAINT LICENSE_DATE_NN NOT NULL,
    LICENSE_PRICE NUMBER CONSTRAINT LICENSE_PRICE_NN NOT NULL,
-- ��������
    CONSTRAINT LICENSE_NO_PK PRIMARY KEY(LICENSE_NO)
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE LICENSE IS  '�̿��';
-- �÷� �ڸ�Ʈ
COMMENT ON COLUMN LICENSE.LICENSE_NO IS '�̿�ǹ�ȣ';
COMMENT ON COLUMN LICENSE.LICENSE_DATE IS '�̿�ǱⰣ';
COMMENT ON COLUMN LICENSE.LICENSE_PRICE IS '�̿�ǰ���';
-- ������ ����
CREATE SEQUENCE SEQ_LN NOCACHE;
-- �̿�� ��

-- 13. ȸ�� ����
CREATE TABLE MEMBER(
-- �÷�
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
-- ��������
    CONSTRAINT MEMBER_NO_PK PRIMARY KEY(MEMBER_NO),
    CONSTRAINT MEMBER_ID_UNQ UNIQUE(MEMBER_ID),
    CONSTRAINT MEMBER_NAME_UNQ UNIQUE(MEMBER_NAME),
    CONSTRAINT FILE_NO_UNQ UNIQUE(FILE_NO),
    CONSTRAINT FILE_CHANGE_NAME_UNQ UNIQUE(FILE_CHANGE_NAME),
    CONSTRAINT PHONE_UNQ UNIQUE(PHONE),
    CONSTRAINT EMAIL_UNQ UNIQUE(EMAIL),
    CONSTRAINT STATUS_CHECK CHECK(STATUS IN ('N', 'Y'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE MEMBER IS 'ȸ��';
-- �÷� �ڸ�Ʈ
COMMENT ON COLUMN MEMBER.MEMBER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '����ڸ�';
COMMENT ON COLUMN MEMBER.FILE_NO IS '����ڵ������ȣ';
COMMENT ON COLUMN MEMBER.FILE_ORIGIN_NAME IS '����ڵ������������';
COMMENT ON COLUMN MEMBER.FILE_CHANGE_NAME IS '����ڵ������ȣȭ����';
COMMENT ON COLUMN MEMBER.ADDRESS IS '�����ּ�';
COMMENT ON COLUMN MEMBER.PHONE IS '����ڹ�ȣ';
COMMENT ON COLUMN MEMBER.EMAIL IS '������̸���';
COMMENT ON COLUMN MEMBER.EXTRA_NUMBER IS '������ȣ';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '������';
COMMENT ON COLUMN MEMBER.STATUS IS '���Խ��ο���';
-- ������ ����
CREATE SEQUENCE SEQ_MN NOCACHE;
-- ȸ�� ��

-- 14. ȸ�� + �̿�� ����
CREATE TABLE LICENSE_HISTORY(
-- �÷�
    LH_NO NUMBER,
    LICENSE_NO NUMBER CONSTRAINT LICENSE_NO_NN NOT NULL,
    MEMBER_NO NUMBER CONSTRAINT MEMBR_NO_NN NOT NULL,
    LH_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT LH_DATE_NN NOT NULL,
    LH_DAY VARCHAR2(21) CONSTRAINT LH_DAY_NN NOT NULL,
    LH_STATUS VARCHAR2(1) CONSTRAINT LH_STATUS_NN NOT NULL,
-- ��������
    CONSTRAINT LH_NO_PK PRIMARY KEY(LH_NO),
    CONSTRAINT LH_LICENSE_NO_FK FOREIGN KEY(LICENSE_NO) REFERENCES LICENSE(LICENSE_NO),
    CONSTRAINT LH_MEMBER_NO_FK FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT LH_STATUS_CHECK CHECK(LH_STATUS IN ('Y', 'N'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE LICENSE_HISTORY IS 'ȸ���̿��';
-- �÷� �ڸ�Ʈ
COMMENT ON COLUMN LICENSE_HISTORY.LH_NO IS '���ǹ�ȣ';
COMMENT ON COLUMN LICENSE_HISTORY.LICENSE_NO IS '�̿�ǹ�ȣ';
COMMENT ON COLUMN LICENSE_HISTORY.MEMBER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN LICENSE_HISTORY.LH_DATE IS '�̿�Ǳ��ų�¥';
COMMENT ON COLUMN LICENSE_HISTORY.LH_DAY IS '�̿�Ⱓ';
COMMENT ON COLUMN LICENSE_HISTORY.LH_STATUS IS '�̿�ǻ���';
-- ������ ����
CREATE SEQUENCE SEQ_LHNO NOCACHE;
-- ȸ�� + �̿�� ��

-- 15. �������� ����
CREATE TABLE NOTICE(
-- �÷�
    NOTICE_NO NUMBER,
    NOTICE_TITLE VARCHAR2(100) CONSTRAINT NOTICE_TITLE_NN NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) CONSTRAINT NOTICE_CONTENT_NN NOT NULL,
    NOTICE_WRITER NUMBER CONSTRAINT NOTICE_WRITER_NN NOT NULL,
    NOTICE_COUNT NUMBER DEFAULT 0,
    NOTICE_CREATE_DATE VARCHAR2(10) DEFAULT SYSDATE,
    NOTICE_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT NOTICE_STATUS_NN NOT NULL,
-- ��������
    CONSTRAINT NOTICE_NO_PK PRIMARY KEY(NOTICE_NO),
    CONSTRAINT NOTICE_WRITER_FK FOREIGN KEY(NOTICE_WRITER) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT NOTICE_STATUS_CHECK CHECK(NOTICE_STATUS IN ('Y', 'N'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE NOTICE IS '��������';
-- �÷� �ڸ�Ʈ
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '�������׹�ȣ';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '������������';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '�������׳���';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER IS '�ۼ���ȸ����ȣ';
COMMENT ON COLUMN NOTICE.NOTICE_COUNT IS '����������ȸ��';
COMMENT ON COLUMN NOTICE.NOTICE_CREATE_DATE IS '���������ۼ���';
COMMENT ON COLUMN NOTICE.NOTICE_STATUS IS '�������׻���';
-- ������ ����
CREATE SEQUENCE SEQ_NN NOCACHE;
-- �������� ��

-- 16. �������� ÷������ ����
CREATE TABLE NOTICE_ATTACH(
-- �÷�
    FA_NO NUMBER,
    REF_NNO NUMBER CONSTRAINT REF_NNO_NN NOT NULL,
    FA_ORIGIN_NAME VARCHAR2(300) CONSTRAINT FA_ORIGIN_NAME_NN NOT NULL,
    FA_CHANGE_NAME VARCHAR2(300) CONSTRAINT FA_CHANGE_NAME_NN NOT NULL,
    FA_PATH VARCHAR2(1000),
    FA_UPLOAD_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT FA_UPLOAD_DATE_NN NOT NULL,
    FA_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT FA_STATUS_NN NOT NULL,
-- ��������
    CONSTRAINT FA_NO_PK PRIMARY KEY(FA_NO),
    CONSTRAINT REF_NNO_FK FOREIGN KEY(REF_NNO) REFERENCES NOTICE(NOTICE_NO) ON DELETE CASCADE,
    CONSTRAINT FA_STATUS_CHECK CHECK(FA_STATUS IN ('Y', 'N'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE NOTICE_ATTACH IS '��������÷������';
-- �÷� �ڸ�Ʈ
COMMENT ON COLUMN NOTICE_ATTACH.FA_NO IS '��������÷�����Ϲ�ȣ';
COMMENT ON COLUMN NOTICE_ATTACH.REF_NNO IS '��������������ȣ';
COMMENT ON COLUMN NOTICE_ATTACH.FA_ORIGIN_NAME IS '�����������Ͽ�����';
COMMENT ON COLUMN NOTICE_ATTACH.FA_CHANGE_NAME IS '�����������ϼ�����';
COMMENT ON COLUMN NOTICE_ATTACH.FA_PATH IS '�����������ϰ��';
COMMENT ON COLUMN NOTICE_ATTACH.FA_UPLOAD_DATE IS '�����������Ͼ��ε���';
COMMENT ON COLUMN NOTICE_ATTACH.FA_STATUS IS '��������÷�����ϻ���';
-- ������ ����
CREATE SEQUENCE SEQ_FAN NOCACHE;
-- �������� ÷������ ��

-- 17. QNA �Խñ� ����
CREATE TABLE QNA_BOARD(
-- �÷�
    BOARD_NO NUMBER,
    BOARD_TITLE VARCHAR2(100) CONSTRAINT BOARD_TITLE_NN NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) CONSTRAINT BOARD_CONTENT_NN NOT NULL,
    BOARD_WRITER NUMBER CONSTRAINT BOARD_WRITER_NN NOT NULL,
    BOARD_CREATE_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT BOARD_CREATE_DATE_NN NOT NULL,
    BOARD_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT BOARD_STATUS_NN NOT NULL,
    BOARD_COUNT NUMBER DEFAULT 0,
-- ��������
    CONSTRAINT BOARD_NO_PK PRIMARY KEY(BOARD_NO),
    CONSTRAINT BOARD_STATUS_CHECK CHECK(BOARD_STATUS IN ('N', 'Y'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE QNA_BOARD IS 'QNA�Խñ�';
-- �÷� �ڸ�Ʈ
COMMENT ON COLUMN QNA_BOARD.BOARD_NO IS 'QNA�Խñ۹�ȣ';
COMMENT ON COLUMN QNA_BOARD.BOARD_TITLE IS 'QNA�Խñ�����';
COMMENT ON COLUMN QNA_BOARD.BOARD_CONTENT IS 'QNA�Խñ۳���';
COMMENT ON COLUMN QNA_BOARD.BOARD_WRITER IS '�ۼ���ȸ����ȣ';
COMMENT ON COLUMN QNA_BOARD.BOARD_CREATE_DATE IS 'QNA�Խñ��ۼ���';
COMMENT ON COLUMN QNA_BOARD.BOARD_STATUS IS 'QNA�Խñۻ���';
COMMENT ON COLUMN QNA_BOARD.BOARD_COUNT IS 'QNA��ȸ��';
-- ������ ����
CREATE SEQUENCE SEQ_BN NOCACHE;
-- QNA �Խñ� ��

-- 18. QNA �Խ��� ��� ����
CREATE TABLE REPLY(
-- �÷�
    REPLY_NO NUMBER,
    REPLY_CONTENT VARCHAR2(500) CONSTRAINT REPLY_CONTENT_NN NOT NULL,
    REF_BNO NUMBER CONSTRAINT REF_BNO_NN NOT NULL,
    REPLY_WRITER NUMBER CONSTRAINT REPLY_WRITER_NN NOT NULL,
    REPLY_CREATE_DATE VARCHAR2(10) DEFAULT SYSDATE CONSTRAINT REPLY_CREATE_DATE_NN NOT NULL,
    REPLY_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT REPLY_STATUS_NN NOT NULL,
-- ��������
    CONSTRAINT REPLY_NO_PK PRIMARY KEY(REPLY_NO),
    CONSTRAINT REF_BNO_FK FOREIGN KEY(REF_BNO) REFERENCES QNA_BOARD(BOARD_NO) ON DELETE CASCADE,
    CONSTRAINT REPLY_WRITER_FK FOREIGN KEY(REPLY_WRITER) REFERENCES MEMBER(MEMBER_NO),
    CONSTRAINT REPLY_STATUS_CHECK CHECK(REPLY_STATUS IN ('N', 'Y'))
);
-- ���̺� �ڸ�Ʈ
COMMENT ON TABLE REPLY IS 'QNA�Խ��Ǵ��';
-- �÷� �ڸ�Ʈ
COMMENT ON COLUMN REPLY.REPLY_NO IS '��۹�ȣ';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '��۳���';
COMMENT ON COLUMN REPLY.REF_BNO IS 'QNA�Խ���������ȣ';
COMMENT ON COLUMN REPLY.REPLY_WRITER IS '�ۼ���ȸ����ȣ';
COMMENT ON COLUMN REPLY.REPLY_CREATE_DATE IS '����ۼ���';
COMMENT ON COLUMN REPLY.REPLY_STATUS IS '��ۻ���';
-- ������ ����
CREATE SEQUENCE SEQ_RNO NOCACHE;
-- QNA �Խ��� ��� ��

INSERT INTO LICENSE VALUES(SEQ_LN.NEXTVAL,3,100);

COMMIT;