--emp테이블 전체조회
select * FROM emp;
--emp테이블의 사원명들만 조회
select ename from emp;
--emp테이블의 사원명과 입사일을 조회
select ename,hiredate from emp;
--emp테이블의 사원명의 오름차순 정렬
select *FROM emp order by ename;
--emp테이블의 사원명의 내림차순 정렬
select *FROM emp order by ename desc;
--별명 alias
--emp에서 ename은 사원명,job은 직업으로 조회하시오
select ename "직원 명",job"직업" from emp;
--중복제거
--emp에서 직업을 중복제거하시오
select distinct job from emp;
--표현식(커럼이외에 출력을 원하는 내용을 selcet구문뒤에 ' '사용한다
SELECT ename, '근무중'  from emp;
--연결연산자(합성연산자)로 컬럼을 붙혀서 출력
--professor에서 name님은 position입니다
select name || '님은' || position || '입니다' from professor;
--emp테이블에서 사원번호,사원명이라고 별명을 붙혀서 조회하시오
SELECT empno "사원번호", ename as 사원명 from emp;
--student 전체조회
SELECT * from student;
--학생테이블에서 학번,학생명,학년이라고 별명을 준후 조회하시오
SELECT studno 학번, name 학생명, grade 학년 from student;
--학생테이블에서 이름,학년,키를 조회하되 키가 큰순으로 정렬하시오
SELECT name "이름", grade "학년", height "키" from student order by height desc;
--emp테이블에서 모든열을 조회하되 급여가 낮은사람붕터 조회하시오
SELECT * from emp order by sal;

--Quiz
--emp에서 사원번호,사원명,급여를 조회하시오(별명넣어서)
SELECT empno,ename,sal from emp;
--dept2 에서 area를 중복제거하고 출력해보세요
SELECT DISTINCT area from dept2;
--emp에서 smith님의 직업은 clerk입니다 와 같이 출력해보세요
select ename || '님의 직업은 ' ||job||' 입니다' from emp;
--professor에서 교수명,급여,보너스를 별명과 같이 출력하시고 급여가 많은사람부터 출력하시오
select name "교수명", pay "급여",bonus"보너스" FROM professor;
--고객테이블에서 고객명,포인트를 조회하되 포인트가 높은사람부터 조회하시오
select gname,point from gogak order by point desc; 
