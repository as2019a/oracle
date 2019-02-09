--lion계정으로 접속하시오.
--고객의 세탁물 전달 시간을 단축시키고 세탁물의 특이사항을 정확하게 관리하기 위해 세탁물에 대한 데이터베이스 시스템을 구축하고자 한다. 
--users테이블 : 아이디, 이름, 전화번호가 관리된다. 고객은 세탁주문시 한번에 여러개의 세탁물을 맡길 수 있다. 
--order테이블 : 주문번호, 주문시간, 세탁완료시간을 관리한다. 한 고객은 여러 세탁주문서를 작성할 수 있으며 
--laundry테이블 : 세탁물번호, 색상, 완료여부, 세탁물종류가 기록된다. 
--type테이블 : 세탁물종류( ex) coat, shirt, pants), 요금이 기록된다.

--고객(users)에는 여러 세탁주문서(order)를 만들 수 있으며 한 세탁주문서는 한 고객에 의해서만 작성된다. (users : order = 1 : N) 
--한 세탁주문서(order)에는 여러 세탁물(laundry)을 포함하며 한 세탁물은 한 세탁주문서에만 포함된다. (order : laundry = 1 : N) 
--한 세탁물(laundry은 한 세탁물종류(type)를 가지며 한 세탁물 종류는 여러 세탁물에 포함된다(landry : type = N : 1)

--문1) 요구사항에 맞게 테이블을 생성하면서 제약조건을 지정하고 ER 다이어그램을 작성한다.(화면캡쳐)

--문2) 각 테이블에 5개 이상의 예제 레코드를 삽입하는 SQL문을 작성한다.

--문3) 다음 정보를 출력하기 위한 SQL문을 작성한다.

----가) 고객의 이름과 주소를 출력하라
----나) 세탁주문서의 총요금이 25000 ~ 35000원인 세탁주문서의 주문번호, 총요금을 출력하라.
----다) 세탁물유형별 세탁물의 개수가 3개가 넘은 세탁물유형과 세탁물개수를 출력하라.
----라) 세탁주문서를 3건 넘게 작성한 고객의 이름과 전화번호를 출력하라.
----마) 세탁완료시간이 7일이 지난 세탁물을 맡긴 모든 고객의 이름, 전화번호를 출력하라.

