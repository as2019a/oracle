-- 사용할 계정 잠금 풀기
alter user hr account unlock

-- 사용자의 비밀번호 변경하기
alter user hr identified by 1111; 

-- 사용자 생성, 동시에 비밀번호 설정
create user tiger identified by 1111;

-- 사용자에게 권한 부여
grant create user, drop user to tiger;

-- 권한 종류 검색
selec * from dbba_sys_privs;

-- 롤(권한들이 집한 부여)
grant dba to tiger;

-- 롤 수거(모든 권한)
revoke dba from tiger;

-- 사용자 삭제
drop user tiger;

--DDL : CREATE(생성), ALTER(수정), DROP(삭제)
--DCL : GRANT(부여), REVOKE(회수)