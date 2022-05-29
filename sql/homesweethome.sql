--=====================================================================
-- 관리자 계정
--=====================================================================
-- homesweethome 계정 생성
alter session set "_oracle_script" = true; -- c##으로 시작하지 않는 일반계정 생성 허용

create user homesweethome
identified by homesweethome
default tablespace users;

grant connect, resource to homesweethome;
alter user homesweethome quota unlimited on users;

--==================================================================
-- homesweethome 계정
--==================================================================

