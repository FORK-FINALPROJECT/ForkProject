-- �׽�Ʈ�� ���
-- ������
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '��','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '��ġ','�߱���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '����','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '����','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�������','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�Ұ��','�̱���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�߰��','�±���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '��¡��','����');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '��','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, 'ġ��','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '����','�±���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '���κ�','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '����','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�߹�','�߱���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '���̹���','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�õ�����','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�õ�Į������','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�','�Ϻ���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�ҽ���','���ϻ�');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�õ�����Ƣ��','�߱���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�а���','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�����','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '����','�̱���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�ҿ���','�߱���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�õ�ġ�','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�����','������');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '����','�߱���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '���ξ���','�ʸ��ɻ�');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�޷�','�±���');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '�ĸ���Ĭ����','������');

-- ī�װ�
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '����','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '�Ļ�','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '����Ʈ','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '�ַ�','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '����','');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '��'|| CHR(038)||'���� �޴�','1');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '����'|| CHR(038)||'���� �޴�','1');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, 'Ƣ�� �޴�','1');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '�� �޴�','2');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '�� �޴�','2');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '���� �޴�','3');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '�ÿ��� �޴�','3');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '����','4');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '����','4');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '������','4');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '���� ����','5');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, 'ź�� ����','5');

-- �޴�
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�ѱٱ�ġ�', '������Ⱑ ���� �ѱ��� �� ���� ��ġ�', 18000, 'tang01.png', 'tang01.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ȭ�긶����', 'ȭ��ó�� �׾ƿø� ��� �Ʒ� ��ū�� ������', 20000, 'tang02.png', 'tang02.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��ū���κο쵿', '��ū�ϰ� �����ϸ鼭 ��θ��� ����! ���κο� �쵿�� �ݶ󺸷��̼�!', 22000, 'tang03.png', 'tang03.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�ѿ��â����', '��� �ѿ��â�� ����!�߿�� ���� ����!', 22000, 'tang04.png', 'tang04.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���������߹�'|| CHR(038)||'�ָԹ�', '�������� ��������!���� �߹��� ���⼭!����� �ָԹ����!', 20000, 'tang05.png', 'tang05.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�����δ��', '�̱��δ� �տ��� 10�⵿�� ����Ͻ� �ҸӴ��� ������', 20000, 'tang06.png', 'tang06.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� �����', '������ �ѼҲ� ������ ����� �����', 18000, 'tang07.png', 'tang07.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� �ߺ�����', '���� �ߴٸ���θ� �̷���� ����� �ε巴�� �����!', 20000, 'tang08.png', 'tang08.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���¡�� «����', '��¡�� �Ѹ����� ������ �� ��ū�� ���� «���� ��ħ�ξ�', 19000, 'tang09.png', 'tang09.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�� �Ѹ��� Į����', '�߰� Į������ ����. ����� ���������� �ߵ��� ����', 20000, 'tang10.png', 'tang10.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�λ� ��ġ ���', '�λ꿡�� ������ ����� �ٴ���� ���� ���� ���', 16000, 'tang11.png', 'tang11.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ġ�쵿', '���帶�� ��ġ�쵿 �Ϻ����� �߾��� ��', 15000, 'tang12.png', 'tang12.png', '/resources/image/', 6);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ġ������߰���', '������ �߰���� ġ�������� ������� �ѹ���!', 20000, 'menu01.png', 'menu01.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���ڴ�', '���ڹ� ��������!�츮�� �� ���ִ�!', 18000, 'menu02.png', 'menu02.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������', '��ġġ�������� ȯ���� �ݶ󺸷��̼�', 20000, 'menu04.png', 'menu04.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'MBTI������', 'MBTI �� ������?�� ���� ��������?����', 18000, 'menu05.png', 'menu05.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���빬���', '��� �̸��� �޴��� ����.�ÿ��ϰ� �ѻ��!', 15000, 'menu06.png', 'menu06.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ġ�����', '����찡 ġ����̿� ����!', 22000, 'menu07.png', 'menu07.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�̻�', '�̸�� ������ ����!������ �� ���� ����', 21000, 'menu09.png', 'menu09.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���ٽ�', '������ ���찡 �ø��������� ����� ģ��', 18000, 'menu10.png', 'menu10.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '����� �κα�ġ', '��Ⱑ �̷��� ���� ���� �ǳ�? ���� ������ �� �κα�ġ', 19000, 'menu11.png', 'menu11.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��ȸ', '���� �����Ͽ� �ż��� ����! �ϰ� �Դ� ��ȸ', 22000, 'menu12.png', 'menu12.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�����Ľ�ŸġŲ', '�츮 ������ ���̽�!�ñ״��� �޴�', 20000, 'menu13.png', 'menu13.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�Ұ�� ���ֺ���', '���̿��� ����ī�߱� �Ұ�� ���ֺ���', 18000, 'menu14.png', 'menu14.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� �߱���'|| CHR(038)||'�����', '�߱��̿� ������� ������. �̰� ����?', 22000, 'menu15.png', 'menu15.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ���� ����', '���쿡�� �븩�ϰ� ������ ���� ���� ġ�� �ּּ�~Ư�� �ҽ��� ���� Ư���ϰ� ��ܺ����� ', 22000, 'menu16.png', 'menu16.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��ġ��', '�ٺ� �ø��� ù ��°. ����� �� ���ֿ� ��ġ�� ���� ������ �ٺ� ����?', 15000, 'menu17.jpg', 'menu17.jpg', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�ع�����', '�ٺ� �ø��� �� ��°. ���忡 ���� �������� �������� ��¡���� �ܸ�', 18000, 'menu18.jpg', 'menu18.jpg', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ��������', '������ �� ��? ������������ ������ �������� ������ �̹� ������', 15000, 'menu19.jpg', 'menu19.jpg', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������', '�ٺ� �ø��� �� ��°. ���� ���� �⸧�� ���� �ӱ��� �ٻ�ٻ��� �������� �ʼ� �޴�.', 18000, 'menu20.jpg', 'menu20.jpg', '/resources/image/', 7);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�Ķ��̵� �޺�', '���밭ȣ. ġ���� ������', 22000, 'fri01.png', 'fri01.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� ������', '�������� ���� �Ʒ� �޴��� �ҽ��� ������! �ҽ��� �ξ����� ���ɴϴ�. �������', 20000, 'fri02.png', 'fri02.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��� �Ҽ���', '���Ͽ��� ���� ������ �Ҽ���!����ġ������ ��!', 20000, 'fri03.png', 'fri03.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ����Ƣ��', '������ ���°ž� ������ �����~�ູ�� �����̾� ���� ����!', 18000, 'fri04.png', 'fri04.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��� ����Ƣ��', '���� ����Ƣ�� ������! ���ִ°� ���Դ� ģ���� �ɷ�~', 18000, 'fri05.png', 'fri05.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���벿ġ', '�ż��� �ҿ����� ����ؼ� �⳻�� ���� ���� ���� �޴�!', 15000, 'fri06.png', 'fri06.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�߲��� Ƣ��', 'ġŲ ������ ��ġ���鼭 ������ ���� �Դ��� ����� ���! ���ϰ� �Ծ��!', 16000, 'fri07.png', 'fri07.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� ��� ġ�', '�߰ſ�� �����ؼ� �弼�� ���� �� ���� �������� ġ���� �� ������', 15000, 'fri08.png', 'fri08.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� �߰���', '���� ������ ������ ������ ��', 20000, 'fri09.png', 'fri09.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '����ġ���Ķ���', '����Ƣ�� ���� ��ū�ϰ� ¬©�� ġ�� �ҽ� ���', 17000, 'fri10.png', 'fri10.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���ಿġ', '����� ������� ������ ����ִ� ��ġ �ұ���� ������ �������� �����', 12000, 'fri11.png', 'fri11.png', '/resources/image/', 8);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ų�ٻ� ��¥��ġ', '������ ¥�İ�Ƽ,����Ķ���,ġ��� �ϼ��� ���տ� ų�ٻ縦 ��� ���� ������ �İ�����! ', 15000, 'menu08.png', 'menu08.png', '/resources/image/', 9);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ġ�� ��ġ������', '���޴����� ��ġ������ ���� ����� ġ�� ���� ��� ���ִ� ��ġ������ �ϼ�', 12000, 'menu03.png', 'menu03.png', '/resources/image/', 10);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�޷�', '�̷��� �޾Ƶ� �ǳ� ���� ������ �� �޷�', 12000, 'fruit01.png', 'fruit01.png', '/resources/image/', 11);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�޷й� ���ξ��ù�', '�޼��޼� �޴� ���� �޷й� ���ξ��ù�', 12000, 'fruit02.png', 'fruit02.png', '/resources/image/', 11);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���̽�Ȳ��', '������ ��ΰ� �����ϴ� ���̽�Ȳ��', 12000, 'fruit03.png', 'fruit03.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ����', '�������� ������ �� �ֳ�?', 15000, 'fruit04.png', 'fruit04.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ����', '�� �� ������', 15000, 'fruit05.png', 'fruit05.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���ξ��� ����Ʈ', '�츮 ���� �Կ� �츰 ���ξ��� ����Ʈ! �츮�� ������', 12000, 'fruit06.png', 'fruit06.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���θӽ�Ĺ ����Ʈ', '��μ� ����Դ� ���θӽ�Ĺ ���⼭ ��ܿ�', 12000, 'fruit07.png', 'fruit07.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '����Ʈ ����Ʈ', '����� ����! ����Դ� ����Ʈ�� ����', 12000, 'fruit08.png', 'fruit08.png', '/resources/image/', 12);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ó��ó��', '16.5��', 5000, 'soju01.png', 'soju01.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '����', '16.9��', 5000, 'soju02.png', 'soju02.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���̽� �ķ���', '16.5��', 5000, 'soju03.png', 'soju03.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���̽� ��������', '20.1��', 5000, 'soju04.png', 'soju04.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�Ѷ��21', '21��', 5000, 'soju05.png', 'soju05.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ȭ��17', '17��', 12000, 'soju06.png', 'soju06.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '����', '16��', 5000, 'soju07.png', 'soju07.png', '/resources/image/', 13);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������500', 'ī��', 5000, 'beer01.jpg', 'beer01.jpg', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�׶�', '�׶�', 5000, 'beer02.png', 'beer02.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��������', '��������� ��ȿ�� ���� ���Ͻ��� ������ ���(Sour Ale)�� ������ ��ŭ���� �����ϱ� ���� �ڸ��ش����Ѱ� õ�Ͽ��� ÷���Ͽ����ϴ�. ��Ʈ������ ��� §���� Ư¡�̸� ����, �ػ깰�丮�ϰ� �߾�︳�ϴ�.', 7000, 'beer03.png', 'beer03.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�׷��̾� ũ��Ŀ ����', '�׷��̾� ũ��Ŀ�� ��з� ���� �Ļ����� �������� �̱����� ������ ��Ŷ�Դϴ�. �׷��̾� ũ��Ŀ ���ʹ� �̸� �״�� �׷��̾� ũ��Ŀ ��� �Բ� ��ũ ���ݸ��� �ٴҶ� ���ε��� ���� ������ ���� ���� �� �ֽ��ϴ�. �ε巯�� ũ�� ���� �Ը��� ������ �ٵ����� ���ñ� �����ϴ�.', 7000, 'beer04.png', 'beer04.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��� ���� �����ǿ���', '���� ������ Juicy Freak IPA�� ������ ȩ�� simcoeȩ ���⿡ �ҷ��� ������ ������ ���� �����Ǿ����ϴ�. ���� ������ ���� ��Ʈ������ �Ʒθ���� ������ �⵵ �������ϴ�. ��Ʈ�����԰� ������ ������ �������� ������ �� �� �ֽ��ϴ�.', 8000, 'beer05.png', 'beer05.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ȣ��Ʃ��Ƽ �콺', '�̸�ó�� ȩ�� ��� �Խ��� ���� ���� �����Դϴ�. ���� ���� ���ϰ� ���� ���� ���� ���ÿ� �� ���� ����ϰ� �ٵ��� ������ ������ ��� �� �ִ� IPA�Դϴ�.', 8000, 'beer06.png', 'beer06.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� ����', '�����뽬�� ���� ����Ŭ�� ���̵带 6:4�� ���� ������ ¥���԰� ������ ��ŭ���� ���ÿ� ���� �� �ִ� 2.0%�� ������ �������. ����� ���ϸ��ַ� ����ó�� ���ų� ������ ���� �ͽ��ؼ� ���� �� �ֽ��ϴ�.', 8000, 'beer07.png', 'beer07.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���ǽ� ���̸���', '160�� ������ ���� 3�� �����. ���ñ� ���� īǪġ�� ���� ���̸��� ��Ÿ��Ʈ .���� ��Ʈ�� ���� ��, ĳ����, Ŀ�� ���� ǳ��, �������� �ε巯���� ��� ���ν���� Ŀ�Ǹ� ���ô� ���� ������ �ҷ�����Ű�� ������ ����.', 7000, 'beer08.png', 'beer08.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�̳��� ��Ʈ��', '���ó�� ������ ������ ����, ǳ���� ��Ʈ������ ȩ�� �׸��� ������� �̷�� ���� ��ȭ, ����� ȣ�� ������ ���� ������� �ǴϽ�.��κ��� ������ ���� ���ְ� ���ڿ� ������ ������ ���� 5.5%�� ���� �����ӿ��� ������ ������ ���� ����� ���� Ư¡.', 8000, 'beer09.png', 'beer09.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�׸��� ��е�', '���⿡ �������� �۷��� ���� (Gluten free) �� ����� (organic) ������ ���� ���� ��ǰ �Դϴ�. �� ������ 2 �� ��ȿ�� �Ͽ��� �ٸ� ���ֿ����� �߰ߵ��� �ʴ� ǳ���� ��Ⱑ ����˴ϴ�. ���� soft�ϰ� ����̸�, ���� ¤(straw)�����Դϴ�. �����ϸ鼭�� Ư���� ��⸦ ������ �ֽ��ϴ�.', 7000, 'beer10.png', 'beer10.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'Į���� IPA', 'Į���� ����� ���۴��� IPA�� �������� �Ƹ޸�ĭ ��Ÿ���Դϴ�. ǳ���� �ٵ𰨰� ���� ȩ ���� Ư¡�̰� �Ƹ�����, ���״Ͼ�, ���� ȩ�� ����� ������, �ڸ� ���� ��Ʈ���� ��� �������, �� ���� �Ծ��� �ڱ��ϴ� �ŷ��� �ֽ��ϴ�. ȩ�� ǳ�̿� �Բ� ��Ʈ�� �ܸ��� ������ �Ϻ��� ��ȭ�� ���� �� �ֽ��ϴ�. ���뼺�� ���� IPA�� ã�´ٸ� ��õ�ϴ� �����Դϴ�.', 8000, 'beer11.png', 'beer11.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�Ҽ� ��Ż��', 'Hazy IPA ��Ÿ���� ���ַ� ���� Į���� ������� ���� IBU(����)�� ������ ���ְ� �ƴ� ���� IBU�� ������ ���� ���ñ� ���� �����Դϴ�. Premium Two Row ��Ʈ�� ������� Ư���� Azacca ȩ �� Idaho 7ȩ�� �־� UFO(��Ȯ�κ��๰ü)�� ���� ���Ͽ� ���� �����Դϴ�.', 7000, 'beer12.png', 'beer12.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ȭ��Ʈ', '������ ȭ��Ʈ�� ȣ�����̶�� �̸����� Belgian Witbier ��Ÿ���� ��Ȱ��Ų ȣ������ â���� �ǿ��� ������(Pierre Celis)�� ���� ��� ���ַ� õ�� ���Ḹ�� �����ϸ� ���ָ� ����ϴ�. �ż��� ������ ������ ��� ������ ����ϰ� �����̽��� ǳ�̸� ���� Belgian Witbier�� ����!', 7000, 'beer13.png', 'beer13.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��ġ��� ���', '70, 80��� �̱��� �������ϴ� ��Ʈ�� ������ �������� �λ����� �����͵� ���. �������� ��ġ�� �����Ͼ� ������ �ְ�� ��Ʈ�� ȩ���� �����ϰ� ���͸��� ��ġ�� �ʾ� ����� ǳ�̰� �帨�ϴ�. �ǴϽÿ� ��Ʈ���� �� ������ �ֱ� ���� Cascade ȩ�� 20% ������ ����߽��ϴ�.', 8000, 'beer14.png', 'beer14.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ȫ��Ҹ���', '������ : Energy+Ginseng(ȫ��)�� �ռ��� 6��� ȫ������ �� �����ݽ��� ÷�� �� �����̾� ����. û����, ����� ���� ����Ⱑ Ư¡�Դϴ�. 2021 �뱹�� �������� �߱� ����� 2�� ����', 9000, 'beer15.png', 'beer15.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ �� ���', '���⿡ ��Ÿ���� ����� �� ����. ��ŭ�� ������ ��� ��� ���� ��ѱ�� ����� ��ĥ ���� ȫ������ �����Ǿ� �ֽ��ϴ�. 2021 �뱹�� �������� �߱� ����� 6�� ����', 9000, 'beer16.png', 'beer16.png', '/resources/image/', 14);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ȸ�� �ȵ�����22', '100% �츮 �Ұ� ���봩������ ���� ���� ������ ���ַμ� �޸��� ����� �������� ������ ����. �������� ������ �ʰ� �ε巴�� ������ �� �ѱ����� ���� ���ְ����� �Ը����� �� �´� �������Դϴ�. �� 3���� ������ ������ �̸� ���� ���ڷ� ���ڿ� ������ ��Ÿ����.', 12000, 'trsoju01.png', 'trsoju01.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '�����25', '���� ������ ������� ���� ���� �� ��ȿ���� ������ ����. ���質�� ���ǰ� ����� ���� ���� ���� Ư¡�̴�. �� �̸���� ������ ������ ��Ⱑ ����, ���� ���������� �����ϰ� ������ ���� Ư¡. ��ѱ��� �ε巴�� �Ծ� ������ ���� ��ĥ���� ���� �� �ִ� �������̴�. ������ Ư���� ����� ���� �����԰� ���Ҿ�, ������ �ѱ�� ���� ��� ���� ǳ�̸� �����. ', 12000, 'trsoju02.png', 'trsoju02.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���� �̰���25', '�̰��ִ� ���� �߿����� ���󵵿� Ȳ�ص����� �����Ǿ��� �츮���� 3�� ������ �ϳ���, ���� ������ �����ȸ���� ��� ���ô� ��� ������̴�. �� ���� ������ �ڶ��� ����� �� ���� ���� ���ֿ� ��(��)�� ����(˹)�� �� �̰��ֶ� �Ҹ��� �ִ�. ', 10000, 'trsoju03.png', 'trsoju03.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��������', '������ ��������� �ε巯�� �� �ѱ��� Ư¡�� ������ �������Դϴ�. ������ ���� �ܸ��� ��ŭ���� ���� �� �־� �����ָ� ��ȣ�ϴ� ������� �˸½��ϴ�.', 10000, 'trsoju04.png', 'trsoju04.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��Ҹ���29', '��ǰ���� �����޴� 3�� ������ ��������, �ȵ�����, ���ּ���. �� �� ���ּ��ִ� ������ ����� ��� ������ ���� ��Ҹ����� ���Ѵ�. ���κ��� ���� ���� ���� ���ߴ� ���ֿ��� �� ��� ������ ����� ����� ���� �����鼭 Ÿ �������� ���� ���� �ٸ� ���� �����ϰ� �Ǿ���.', 15000, 'trsoju05.png', 'trsoju05.png', '/resources/image/', 15);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��������', '����', 3000, 'fruitjuice01.jpg', 'fruitjuice01.jpg', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���Ƹ��� ��', '��', 3000, 'fruitjuice02.jpg', 'fruitjuice02.jpg', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ����', '����', 3000, 'fruitjuice03.png', 'fruitjuice03.png', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ �����ڳ�', '�������ڳ�', 3000, 'fruitjuice04.png', 'fruitjuice04.png', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ ������', '������', 3000, 'fruitjuice05.png', 'fruitjuice05.png', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '������ �䱸��Ʈ', '�䱸��Ʈ', 3000, 'fruitjuice06.png', 'fruitjuice06.png', '/resources/image/', 16);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��ī�ݶ�', '�ݶ�', 2000, 'juice01.png', 'juice01.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��������Ʈ ����', '���̴�', 2000, 'juice02.png', 'juice02.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ȯŸ ������', '������', 2000, 'juice03.png', 'juice03.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'ȯŸ ����', '����', 2000, 'juice04.png', 'juice04.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '���Ƹ��� �� ���̴�', '���̴�', 2000, 'juice05.png', 'juice05.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '��������', '�ݶ�', 2000, 'juice06.png', 'juice06.png', '/resources/image/', 17);

-- �ɼ�
INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '�ſ��', 0, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '1�ܰ�', 0, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '2�ܰ�', 0, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '3�ܰ�', 0, 1, 1);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '����߰�', 0, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '100g�߰�', 1000, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '200g�߰�', 2000, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '300g�߰�', 3000, 1, 1);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '��ġ�߰�', 0, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '100g�߰�', 500, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '200g�߰�', 1500, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '300g�߰�', 2000, 1, 1);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '���󸶶�', 0, 2);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '�ʺ���', 1000, 2, 2);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '�߱���', 2000, 2, 2);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '���� ���', 3000, 2, 2);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '�����߰�', 0, 3);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '���κ� �߰�', 2000, 3, 3);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '�쵿�� �߰�', 2000, 3, 3);

-- �ѿ�����
INSERT INTO TOTAL_RECEIPT VALUES (SEQ_TTRC.NEXTVAL, 1, 'Y');
INSERT INTO TOTAL_RECEIPT VALUES (SEQ_TTRC.NEXTVAL, 2, 'Y');

-- ����
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 30000);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 58000);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 76500);

-- ������
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 1, 1);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 2, 2);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 3, 2);

-- ������ + �޴�
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 1, 2, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 1, 52, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 1, 53, 1);

INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 2, 1, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 2, 5, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 2, 54, 3);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 2, 79, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 2, 84, 1);

INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 3, 1, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 3, 2, 2);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 3, 92, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 3, 93, 1);

-- �޴� + �ɼ�
INSERT INTO RECEIPT_OPTION VALUES (9,10);
INSERT INTO RECEIPT_OPTION VALUES (9,3);
INSERT INTO RECEIPT_OPTION VALUES (1,16);
INSERT INTO RECEIPT_OPTION VALUES (10,16);

-- �ѿ�����
INSERT INTO TOTAL_RECEIPT VALUES (SEQ_TTRC.NEXTVAL, 3, 'Y');
-- ���� 
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 0);
-- ������
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 4, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 5, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 6, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 7, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 8, 3);
-- ������ + �޴�
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 1, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 2, 2);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 79, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 82, 1);
-- �޴� + �ɼ�
INSERT INTO RECEIPT_OPTION VALUES (13,10);
INSERT INTO RECEIPT_OPTION VALUES (13,3);
INSERT INTO RECEIPT_OPTION VALUES (14,16);

-- �̿��
INSERT INTO LICENSE 
VALUES(SEQ_LN.NEXTVAL,3,100);

-- ��������
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, 'FORK SERVICE ����', 'FORK SERVICE ����', 1, DEFAULT, '23/08/01', 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '�������� �׽�Ʈ 1��', '�������� �׽�Ʈ 1��', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '�������� �׽�Ʈ 2��', '�������� �׽�Ʈ 2��', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '�������� �׽�Ʈ 3��', '�������� �׽�Ʈ 3��', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '�������� �׽�Ʈ 4��', '�������� �׽�Ʈ 4��', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '�������� �׽�Ʈ 5��', '�������� �׽�Ʈ 5��', 1, DEFAULT, SYSDATE, 'Y');


-- ���̺�
INSERT INTO STRUCTURE VALUES ('1', '���̺�', '���̺�#1', '0', '0');
INSERT INTO STRUCTURE VALUES ('2', '���̺�', '���̺�#2', '832', '254');
INSERT INTO STRUCTURE VALUES ('0', '����', '����', '522', '434');
INSERT INTO STRUCTURE VALUES ('0', '������', '������', '152', '214');

COMMIT;














