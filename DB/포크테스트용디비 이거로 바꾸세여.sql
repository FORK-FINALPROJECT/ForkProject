-- 테스트용 디비
-- 원산지
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '쌀','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '김치','중국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '양파','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '마늘','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '돼지고기','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '소고기','미국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '닭고기','태국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '오징어','페루산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '떡','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '치즈','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '새우','태국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '순두부','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '숙주','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '닭발','중국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '팽이버섯','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '냉동만두','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '냉동칼국수면','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '어묵','일본산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '소시지','독일산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '냉동감자튀김','중국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '밀가루','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '양배추','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '케찹','미국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '소염통','중국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '냉동치즈볼','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '양상추','국내산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '은행','중국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '파인애플','필리핀산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '메론','태국산');
INSERT INTO COO VALUES(SEQ_COO.NEXTVAL, '후르츠칵테일','국내산');

-- 카테고리
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '안주','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '식사','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '디저트','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '주류','');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '음료','');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '탕'|| CHR(038)||'전골 메뉴','1');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '볶음'|| CHR(038)||'간단 메뉴','1');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '튀김 메뉴','1');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '면 메뉴','2');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '밥 메뉴','2');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '과일 메뉴','3');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '시원한 메뉴','3');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '소주','4');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '맥주','4');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '전통주','4');

INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '과일 음료','5');
INSERT INTO CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '탄산 음료','5');

-- 메뉴
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '한근김치찌개', '돼지고기가 무려 한근이 들어간 혜자 김치찌개', 18000, 'tang01.png', 'tang01.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '화산마라탕', '화산처럼 쌓아올린 고기 아래 얼큰한 마라탕', 20000, 'tang02.png', 'tang02.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '얼큰순두부우동', '얼큰하게 해장하면서 배부르게 먹자! 순두부와 우동의 콜라보레이션!', 22000, 'tang03.png', 'tang03.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '한우대창전골', '비싼 한우대창을 가득!추운날엔 역시 전골!', 22000, 'tang04.png', 'tang04.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '무뼈국물닭발'|| CHR(038)||'주먹밥', 'ㅎㅅ포자 저리가라!이제 닭발은 여기서!든든한 주먹밥까지!', 20000, 'tang05.png', 'tang05.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '동동부대찌개', '미군부대 앞에서 10년동안 장사하신 할머니의 레시피', 20000, 'tang06.png', 'tang06.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '장인 계란탕', '장인이 한소끔 끓여낸 삼삼한 계란탕', 18000, 'tang07.png', 'tang07.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '순살 닭볶음탕', '순수 닭다리살로만 이루어진 순살로 부드럽게 즐기자!', 20000, 'tang08.png', 'tang08.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '통오징어 짬뽕탕', '어징어 한마리가 통으로 들어간 얼큰한 맛의 짬뽕탕 군침싸악', 19000, 'tang09.png', 'tang09.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '닭 한마리 칼국수', '닭과 칼국수의 만남. 깔끔한 국물맛으로 중독성 만점', 20000, 'tang10.png', 'tang10.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '부산 꼬치 어묵탕', '부산에서 공수한 어묵으로 바다향기 물씬 나는 어묵탕', 16000, 'tang11.png', 'tang11.png', '/resources/image/', 6);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '옛날김치우동', '포장마차 김치우동 완벽재현 추억의 맛', 15000, 'tang12.png', 'tang12.png', '/resources/image/', 6);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '치즈퐁듀닭갈비', '매콤한 닭갈비와 치즈퐁듀의 고소함을 한번에!', 20000, 'menu01.png', 'menu01.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '지코닭', '지코바 저리가라!우리가 더 맛있다!', 18000, 'menu02.png', 'menu02.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '김피탕', '김치치즈탕수육 환장의 콜라보레이션', 20000, 'menu04.png', 'menu04.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, 'MBTI떡볶이', 'MBTI 가 뭐에요?오 저랑 같은데요?ㅎㅎ', 18000, 'menu05.png', 'menu05.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '전통묵사발', '더운날 이만한 메뉴는 없다.시원하게 한사발!', 15000, 'menu06.png', 'menu06.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '쉬림프 치즈떡볶이', '통새우가 치즈떡볶이에 퐁당!', 22000, 'menu07.png', 'menu07.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '쫄삼', '쫄면과 삼겹살은 국룰!맛없을 수 없는 조합', 21000, 'menu09.png', 'menu09.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '감바스', '통통한 새우가 올리브유에서 헤엄을 친다', 18000, 'menu10.png', 'menu10.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '고기듬뿍 두부김치', '고기가 이렇게 많이 들어가도 되나? 싶을 정도로 들어간 두부김치', 19000, 'menu11.png', 'menu11.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '육회', '당일 공수하여 신선함 가득! 믿고 먹는 육회', 22000, 'menu12.png', 'menu12.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '로제파스타치킨', '우리 가게의 에이스!시그니쳐 메뉴', 20000, 'menu13.png', 'menu13.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '소고기 숙주볶음', '하이엔드 이자카야급 소고기 숙주볶음', 18000, 'menu14.png', 'menu14.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '숯불 닭구이'|| CHR(038)||'비빔면', '닭구이에 비빔면은 못참지. 이걸 참아?', 22000, 'menu15.png', 'menu15.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '쉬림프 벌집 퐁듀', '오븐에서 노릇하게 구워진 새우 위에 치즈 솔솔솔~특제 소스로 더욱 특별하게 즐겨보세요 ', 22000, 'menu16.png', 'menu16.png', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '김치전', '근본 시리즈 첫 번째. 비오는 날 소주에 김치전 한장 조합이 근본 ㅇㅈ?', 15000, 'menu17.jpg', 'menu17.jpg', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '해물파전', '근본 시리즈 두 번째. 간장에 콕콕 찍어먹으면 느껴지는 오징어의 단맛', 18000, 'menu18.jpg', 'menu18.jpg', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '스위스 옥수수전', '스위스 왜 감? 동동포차에서 스위스 옥수수전 먹으면 이미 스위스', 15000, 'menu19.jpg', 'menu19.jpg', '/resources/image/', 7);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '감자전', '근본 시리즈 세 번째. 말해 뭐해 기름기 가득 머금은 바삭바삭한 감자전이 필수 메뉴.', 18000, 'menu20.jpg', 'menu20.jpg', '/resources/image/', 7);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '후라이드 콤보', '전통강호. 치맥은 못참지', 22000, 'fri01.png', 'fri01.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '구름 탕수육', '구름구름 구름 아래 달달한 소스의 탕수육! 소스가 부어져서 나옵니다. 찍먹주의', 20000, 'fri02.png', 'fri02.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '모듬 소세지', '독일에서 직접 공수한 소세지!도이치란드의 맛!', 20000, 'fri03.png', 'fri03.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '스마일 감자튀김', '이제는 웃는거야 스마일 어게인~행복한 순간이야 해피 데이!', 18000, 'fri04.png', 'fri04.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '모듬 감자튀김', '각종 감자튀김 총집합! 맛있는거 골라먹는 친구는 걸러~', 18000, 'fri05.png', 'fri05.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '염통꼬치', '신선한 소염통을 사용해서 잡내가 전혀 없는 간단 메뉴!', 15000, 'fri06.png', 'fri06.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '닭껍질 튀김', '치킨 먹을때 눈치보면서 껍질만 떼어 먹느라 고생한 당신! 편하게 먹어라!', 16000, 'fri07.png', 'fri07.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '동동 대왕 치즈볼', '뜨거우니 조심해서 드세요 한입 문 순간 느껴지는 치즈의 향 대폭팔', 15000, 'fri08.png', 'fri08.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '매콤 닭강정', '혀를 때리는 적당한 매콤한 맛', 20000, 'fri09.png', 'fri09.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '오지치즈후라이', '감자튀김 위에 달큰하고 짭짤한 치즈 소스 듬뿍', 17000, 'fri10.png', 'fri10.png', '/resources/image/', 8);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '은행꼬치', '고소한 은행들이 줄줄이 꿰어있는 꼬치 소금찍어 먹으면 가을향취 제대로', 12000, 'fri11.png', 'fri11.png', '/resources/image/', 8);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '킬바사 불짜계치', '매콤한 짜파게티,계란후라이,치즈로 완성된 조합에 킬바사를 얹어 톡톡 터지는 식감까지! ', 15000, 'menu08.png', 'menu08.png', '/resources/image/', 9);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '치즈 김치볶음밥', '매콤달콤한 김치볶음밥 위에 고소한 치즈 한장 얹어 맛있는 김치볶음밥 완성', 12000, 'menu03.png', 'menu03.png', '/resources/image/', 10);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '메론', '이렇게 달아도 되나 싶을 정도로 단 메론', 12000, 'fruit01.png', 'fruit01.png', '/resources/image/', 11);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '메론반 파인애플반', '달세달세 달달 세콤 메론반 파인애플반', 12000, 'fruit02.png', 'fruit02.png', '/resources/image/', 11);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '아이스황도', '남녀노소 모두가 좋아하는 아이스황도', 12000, 'fruit03.png', 'fruit03.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '오레오 빙수', '오레오가 맛없을 수 있나?', 15000, 'fruit04.png', 'fruit04.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '돼지바 빙수', '올 때 돼지바', 15000, 'fruit05.png', 'fruit05.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '파인애플 샤베트', '우리 가게 먹여 살린 파인애플 샤베트! 우리가 원조다', 12000, 'fruit06.png', 'fruit06.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '샤인머스캣 샤베트', '비싸서 못사먹는 샤인머스캣 여기서 즐겨요', 12000, 'fruit07.png', 'fruit07.png', '/resources/image/', 12);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '요쿠르트 샤베트', '유산균 팡팡! 얼려먹는 요쿠르트는 국룰', 12000, 'fruit08.png', 'fruit08.png', '/resources/image/', 12);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '처음처럼', '16.5도', 5000, 'soju01.png', 'soju01.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '진로', '16.9도', 5000, 'soju02.png', 'soju02.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '참이슬 후레쉬', '16.5도', 5000, 'soju03.png', 'soju03.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '참이슬 오리지널', '20.1도', 5000, 'soju04.png', 'soju04.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '한라산21', '21도', 5000, 'soju05.png', 'soju05.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '화요17', '17도', 12000, 'soju06.png', 'soju06.png', '/resources/image/', 13);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '새로', '16도', 5000, 'soju07.png', 'soju07.png', '/resources/image/', 13);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '생맥주500', '카스', 5000, 'beer01.jpg', 'beer01.jpg', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '테라', '테라', 5000, 'beer02.png', 'beer02.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '영동고제', '유산균으로 발효한 정통 독일식의 상쾌한 사워(Sour Ale)로 레몬같은 상큼함을 강조하기 위해 코리앤더씨앗과 천일염을 첨가하였습니다. 시트러스한 향과 짠맛이 특징이며 과일, 해산물요리하고 잘어울립니다.', 7000, 'beer03.png', 'beer03.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '그레이엄 크래커 포터', '그레이엄 크래커는 통밀로 만든 식사대용의 간식으로 미국에서 유행한 비스킷입니다. 그레이엄 크래커 포터는 이름 그대로 그레이엄 크래커 향과 함께 밀크 초콜릿과 바닐라가 섞인듯한 같은 달콤한 맛을 느낄 수 있습니다. 부드러운 크림 같은 입맛에 가벼운 바디감으로 마시기 쉽습니다.', 7000, 'beer04.png', 'beer04.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '쥬시 프릭 아이피에이', '육즙 괴물인 Juicy Freak IPA는 모자익 홉과 simcoe홉 여기에 소량의 오렌지 과즙을 더해 양조되었습니다. 밝은 오렌지 빛깔에 시트러스한 아로마향과 오렌지 향도 느껴집니다. 시트러스함과 상쾌한 감귤의 육즙으로 마무리 할 수 있습니다.', 8000, 'beer05.png', 'beer05.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '호퍼튜니티 녹스', '이름처럼 홉의 향과 쌉쌀한 맛이 강한 맥주입니다. 송진 등의 진하고 깊은 맛이 나는 동시에 끝 맛이 깔끔하고 바디감이 적당해 누구나 즐길 수 있는 IPA입니다.', 8000, 'beer06.png', 'beer06.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '가펠 레몬', '가펠쾰쉬와 레몬 스파클링 에이드를 6:4로 섞어 맥주의 짜릿함과 레몬의 상큼함을 동시에 느낄 수 있는 2.0%의 저알콜 레몬맥주. 산뜻한 과일맥주로 음료처럼 즐기거나 고도수의 술과 믹스해서 마실 수 있습니다.', 8000, 'beer07.png', 'beer07.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '머피스 아이리쉬', '160년 전통의 세계 3대 흑맥주. 마시기 편한 카푸치노 같은 아이리쉬 스타우트 .구운 몰트의 진한 맛, 캐러멜, 커피 향의 풍미, 독보적인 부드러움은 흡사 아인슈페너 커피를 마시는 듯한 착각을 불러일으키는 마성의 맥주.', 7000, 'beer08.png', 'beer08.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '이나므 파트르', '라거처럼 가볍고 상쾌한 느낌, 풍부한 시트러스와 홉향 그리고 허브향이 이루어 내는 조화, 드라이 호핑 과정을 통한 드라이한 피니쉬.대부분의 수도원 인증 맥주가 알코올 돗수가 높은데 반해 5.5%의 낮은 돗수임에도 수도원 맥주의 맛을 살려낸 것이 특징.', 8000, 'beer09.png', 'beer09.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '그리셋 블론드', '벨기에 현지에서 글루텐 프리 (Gluten free) 및 유기농 (organic) 인증을 받은 맥주 제품 입니다. 병 주입후 2 차 발효를 하였고 다른 맥주에서는 발견되지 않는 풍부한 향기가 방출됩니다. 헤드는 soft하고 흰색이며, 몸은 짚(straw)색깔입니다. 강렬하면서도 특유의 향기를 가지고 있습니다.', 7000, 'beer10.png', 'beer10.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '칼데라 IPA', '칼데라 브루잉 컴퍼니의 IPA는 전통적인 아메리칸 스타일입니다. 풍부한 바디감과 강한 홉 향이 특징이고 아마릴로, 센테니얼, 심코 홉을 사용해 오렌지, 자몽 같은 시트러스 향과 열대과일, 솔 향이 입안을 자극하는 매력이 있습니다. 홉의 풍미와 함께 몰트의 단맛도 적절해 완벽한 조화를 느낄 수 있습니다. 음용성이 좋은 IPA를 찾는다면 추천하는 맥주입니다.', 8000, 'beer11.png', 'beer11.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '소서 포탈즈', 'Hazy IPA 스타일의 맥주로 기존 칼데라 브루잉의 높은 IBU(쓴맛)을 강조한 맥주가 아닌 낮은 IBU로 무더운 여름 마시기 좋은 맥주입니다. Premium Two Row 몰트를 기반으로 특이한 Azacca 홉 및 Idaho 7홉을 넣어 UFO(미확인비행물체)와 같은 베일에 쌓인 맥주입니다.', 7000, 'beer12.png', 'beer12.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '셀리스 화이트', '셀리스 화이트는 호가든이라는 이름으로 Belgian Witbier 스타일을 부활시킨 호가든의 창시자 피에르 셀리스(Pierre Celis)의 삶이 깃든 맥주로 천연 원료만을 고집하며 맥주를 만듭니다. 신선한 오렌지 껍질과 고수 씨앗의 향긋하고 스파이시한 풍미를 가진 Belgian Witbier의 정석!', 7000, 'beer13.png', 'beer13.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '리치몬드 라거', '70, 80년대 미국을 연상케하는 레트로 느낌의 디자인이 인상적인 언필터드 라거. 양조장이 위치한 버지니아 지역의 최고급 몰트와 홉으로 양조하고 필터링을 거치지 않아 고소한 풍미가 흐릅니다. 피니시에 시트러스 한 느낌을 주기 위해 Cascade 홉을 20% 비율로 사용했습니다.', 8000, 'beer14.png', 'beer14.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '에너진 홍삼쌀맥주', '에너진 : Energy+Ginseng(홍삼)의 합성어 6년근 홍삼농축액 및 금포금쌀이 첨가 된 프리미엄 맥주. 청량감, 깔끔한 맛과 꽃향기가 특징입니다. 2021 대국민 수제맥주 발굴 오디션 2위 수상', 9000, 'beer15.png', 'beer15.png', '/resources/image/', 14);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '벨지안 윗 비어', '벨기에 스타일의 향긋한 밀 맥주. 상큼한 오렌지 향과 기분 좋은 목넘김과 산뜻한 감칠 맛에 홍삼농축액 함유되어 있습니다. 2021 대국민 수제맥주 발굴 오디션 6위 수상', 9000, 'beer16.png', 'beer16.png', '/resources/image/', 14);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '회곡 안동소주22', '100% 우리 쌀과 전통누룩으로 빚은 술을 증류한 고도주로서 뒷맛이 깔끔한 전통적인 증류식 소주. 누룩향이 강하지 않고 부드럽고 묵직한 목 넘김으로 젊은 애주가들의 입맛에도 잘 맞는 전통주입니다. 총 3가지 종류가 있으며 이름 뒤의 숫자로 알코올 도수를 나타낸다.', 12000, 'trsoju01.png', 'trsoju01.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '문배술25', '좁쌀 누룩을 수수밥과 섞어 빚은 뒤 발효시켜 증류한 소주. 문배나무 과실과 비슷한 향이 나는 것이 특징이다. 그 이름답게 문배의 은은한 향기가 나며, 높은 도수이지만 정갈하고 깨끗한 맛이 특징. 목넘김이 부드럽고 입안 가득한 향기로 감칠맛을 더할 수 있는 순곡주이다. 순곡주 특유의 고소한 맛과 달콤함과 더불어, 목으로 넘기고 나면 기분 좋은 풍미를 남긴다. ', 12000, 'trsoju02.png', 'trsoju02.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '전주 이강주25', '이강주는 조선 중엽부터 전라도와 황해도에서 제조되었던 우리나라 3대 명주의 하나로, 선조 때부터 상류사회에서 즐겨 마시던 고급 약소주이다. 옛 문헌 곳곳에 자랑이 대단한 이 술은 토종 소주에 배(梨)와 생강(薑)이 들어가 이강주라 불리고 있다. ', 10000, 'trsoju03.png', 'trsoju03.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '도원결의', '은은한 복숭아향과 부드러운 목 넘김이 특징인 복숭아 증류주입니다. 과하지 않은 단맛과 상큼함을 느낄 수 있어 저도주를 선호하는 사람에게 알맞습니다.', 10000, 'trsoju04.png', 'trsoju04.png', '/resources/image/', 15);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '고소리술29', '명품으로 인정받는 3대 소주인 개성소주, 안동소주, 제주소주. 그 중 제주소주는 좁쌀을 원료로 빚어낸 제주의 명주 고소리술을 말한다. 예로부터 논이 적어 쌀이 귀했던 제주에서 쌀 대신 좁쌀을 원료로 사용해 술을 빚으면서 타 지역과는 맛과 향이 다른 술을 생산하게 되었다.', 15000, 'trsoju05.png', 'trsoju05.png', '/resources/image/', 15);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '포도봉봉', '포도', 3000, 'fruitjuice01.jpg', 'fruitjuice01.jpg', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '갈아만든 배', '배', 3000, 'fruitjuice02.jpg', 'fruitjuice02.jpg', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '코코팜 포도', '포도', 3000, 'fruitjuice03.png', 'fruitjuice03.png', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '코코팜 망고코넛', '망고코코넛', 3000, 'fruitjuice04.png', 'fruitjuice04.png', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '코코팜 복숭아', '복숭아', 3000, 'fruitjuice05.png', 'fruitjuice05.png', '/resources/image/', 16);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '코코팜 요구르트', '요구르트', 3000, 'fruitjuice06.png', 'fruitjuice06.png', '/resources/image/', 16);

INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '코카콜라', '콜라', 2000, 'juice01.png', 'juice01.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '스프라이트 제로', '사이다', 2000, 'juice02.png', 'juice02.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '환타 오렌지', '오렌지', 2000, 'juice03.png', 'juice03.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '환타 포도', '포도', 2000, 'juice04.png', 'juice04.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '갈아만든 배 사이다', '사이다', 2000, 'juice05.png', 'juice05.png', '/resources/image/', 17);
INSERT INTO MENU VALUES(SEQ_MENU.NEXTVAL, '닥터페퍼', '콜라', 2000, 'juice06.png', 'juice06.png', '/resources/image/', 17);

-- 옵션
INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '매운맛', 0, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '1단계', 0, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '2단계', 0, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '3단계', 0, 1, 1);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '고기추가', 0, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '100g추가', 1000, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '200g추가', 2000, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '300g추가', 3000, 1, 1);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '김치추가', 0, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '100g추가', 500, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '200g추가', 1500, 1, 1);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '300g추가', 2000, 1, 1);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '마라마라', 0, 2);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '초보자', 1000, 2, 2);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '중급자', 2000, 2, 2);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '아주 얼얼', 3000, 2, 2);

INSERT INTO OPT (OPTION_NO, OPTION_NAME, PRICE, MENU_NO) VALUES(SEQ_OPTION.NEXTVAL, '토핑추가', 0, 3);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '순두부 추가', 2000, 3, 3);
INSERT INTO OPT VALUES (SEQ_OPTION.NEXTVAL, '우동면 추가', 2000, 3, 3);

-- 총영수증
INSERT INTO TOTAL_RECEIPT VALUES (SEQ_TTRC.NEXTVAL, 1, 'Y');
INSERT INTO TOTAL_RECEIPT VALUES (SEQ_TTRC.NEXTVAL, 2, 'Y');

-- 결제
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 30000);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 58000);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 76500);

-- 영수증
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 1, 1);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 2, 2);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 3, 2);

-- 영수증 + 메뉴
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

-- 메뉴 + 옵션
INSERT INTO RECEIPT_OPTION VALUES (9,10);
INSERT INTO RECEIPT_OPTION VALUES (9,3);
INSERT INTO RECEIPT_OPTION VALUES (1,16);
INSERT INTO RECEIPT_OPTION VALUES (10,16);

-- 총영수증
INSERT INTO TOTAL_RECEIPT VALUES (SEQ_TTRC.NEXTVAL, 3, 'Y');
-- 결제 
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 19125);
INSERT INTO PAY VALUES (SEQ_PAY.NEXTVAL, SYSDATE, 0);
-- 영수증
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 4, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 5, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 6, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 7, 3);
INSERT INTO RECEIPT VALUES (SEQ_RC.NEXTVAL, 8, 3);
-- 영수증 + 메뉴
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 1, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 2, 2);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 79, 1);
INSERT INTO RECEIPT_MENU VALUES(SEQ_RCM.NEXTVAL, 8, 82, 1);
-- 메뉴 + 옵션
INSERT INTO RECEIPT_OPTION VALUES (13,10);
INSERT INTO RECEIPT_OPTION VALUES (13,3);
INSERT INTO RECEIPT_OPTION VALUES (14,16);

-- 이용권
INSERT INTO LICENSE 
VALUES(SEQ_LN.NEXTVAL,3,100);

-- 공지사항
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, 'FORK SERVICE 개시', 'FORK SERVICE 개시', 1, DEFAULT, '23/08/01', 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '공지사항 테스트 1번', '공지사항 테스트 1번', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '공지사항 테스트 2번', '공지사항 테스트 2번', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '공지사항 테스트 3번', '공지사항 테스트 3번', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '공지사항 테스트 4번', '공지사항 테스트 4번', 1, DEFAULT, SYSDATE, 'Y');
INSERT INTO NOTICE VALUES (SEQ_NN.NEXTVAL, '공지사항 테스트 5번', '공지사항 테스트 5번', 1, DEFAULT, SYSDATE, 'Y');


-- 테이블
INSERT INTO STRUCTURE VALUES ('1', '테이블', '테이블#1', '0', '0');
INSERT INTO STRUCTURE VALUES ('2', '테이블', '테이블#2', '832', '254');
INSERT INTO STRUCTURE VALUES ('0', '계산대', '계산대', '522', '434');
INSERT INTO STRUCTURE VALUES ('0', '구조물', '구조물', '152', '214');

COMMIT;














