-- ?¬?©?  κ³μ  ? κΈ? ??κΈ?
alter user hr account unlock;

-- ?¬?©?? λΉλ?λ²νΈ λ³?κ²½νκΈ?
alter user hr identified by 1111; 

-- ?¬?©? ??±, ??? λΉλ?λ²νΈ ?€? 
create user tiger identified by 1111;

-- ?¬?©??κ²? κΆν λΆ??¬
grant create user, drop user to tiger;

-- κΆν μ’λ₯ κ²??
select * from dbba_sys_privs;

-- λ‘?(κΆν?€?΄ μ§ν λΆ??¬)
grant dba to tiger;

-- λ‘? ?κ±?(λͺ¨λ  κΆν)
revoke dba from tiger;

-- ?¬?©? ?­? 
drop user tiger;

--DDL : CREATE(??±), ALTER(?? ), DROP(?­? )
--DCL : GRANT(λΆ??¬), REVOKE(??)