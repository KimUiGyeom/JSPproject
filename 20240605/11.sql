create table if not exists food(
foodID varchar(10) not null,
name varchar(20),
unitPrice integer,
coo varchar(10),
description text,
cal integer,
foodImage varchar(20),
primary key (foodID)
) default charset=utf8;

insert into food values('KUG12', '김치찌개', 8000, '국내산', '얼큰하고 칼칼한 한국 대표음식', 250, 'KUG12.jpg');

insert into food values('KUG13', '얼큰된장찌개', 8000, '국내산', '구수한 된장찌개에 알싸한 청양고추를 가미한 특별한 맛', 230, 'KUG13.jpg');

insert into food values('KUG14', '제육볶음', 9000, '국내산', '제육볶음 한 점에 소주 한 잔이면 끝', 500, 'KUG14.jpg');

insert into food values('KUG15', '뚝배기불고기', 9000, '국내산', '육즙이 풍부한 소고기를 사용한 남녀노소 사랑받는 음식', 500, 'KUG15.jpg');

insert into food values('KUG16', '닭볶음탕', 25000, '국내산', '매콤하고 진한 국물 맛이 특징인 한국의 인기 있는 요리', 550, 'KUG16.jpg');

insert into food values('KUG17', '계란말이', 6000, '국내산', '부드럽고 고소한 맛이 일품인 한국의 대표적인 음식', 285, 'KUG17.jpg');

insert into food values('KUG18', '갈비찜', 9500, '미국산', '풍부한 양념과 부드러운 돼지고기가 어우러져 깊고 진한 맛', 550, 'KUG18.jpg');

insert into food values('KUG19', '오징어볶음', 8500, '국내산', '매운맛과 달콤한 맛이 잘 어우러진 음식', 250, 'KUG19.jpg');

insert into food values('KUG20', '순두부찌개', 8000, '국내산', '부드럽고 고소한 순두부와 매콤한 국물이 조화를 이루는 음식', 350, 'KUG20.jpg');

insert into food values('KUG21', '동태찌개', 8000, '국내산', '얼큰하면서도 개운한 맛을 자랑하는 음식(겨울철 한정메뉴)', 235, 'KUG21.jpg');

insert into food values('KUG22', '콩국수', 6000, '국내산', '시원하고 고소한 맛이 일품인 여름철 별미(여름철 한정메뉴)', 500, 'KUG22.jpg');

insert into food values('KUG23', '열무국수', 6000, '국내산', '시원하고 아삭한 열무김치와 쫄깃한 면발이 어우러져 여름철에 특히 사랑받는 음식(여름철 한정메뉴)', 400, 'KUG23.jpg');

insert into food values('KUG24', '공기밥', 1000, '국내산', '고봉밥', 310, 'KUG24.jpg');

insert into food values('KUG25', '소주', 4000, '국내산', '알코올의 강한 향과 함께 목을 타고 넘어가는 시원한 느낌(19세 미만 주문 불가합니다.)', 400, 'KUG25.jpg');

insert into food values('KUG26', '맥주', 4000, '국내산', '더운 날씨나 가벼운 모임에서 부담 없이 즐기기에 좋은 맥주(19세 미만 주문 불가합니다.)', 150, 'KUG26.jpg');