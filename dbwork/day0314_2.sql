--between,in,and,or
--급여가 1200~2000사이의 이름,급여,보너스를 구하시오(AND)
SELECT ename,sal,comm from emp where sal>=1200 and sal<=2000;
--급여가 1200~2000사이의 이름,급여,보너스를 구하시오(Between)
SELECT ename,sal,comm from emp where sal between 1200 and 2000;

--job이 MANAGET,SALESMAN인 사람의 이름과 직업을 구하시오(or)
SELECT ename,job from emp where job='MANAGER'or job='SALESMAN';
--job이 MANAGET,SALESMAN인 사람의 이름과 직업을 구하시오(IS)
SELECT ename,job from emp where job in('MANAGER','SALESMAN');

--UNION 두 결과값에서 중복된값 제거후 출력
--UNIONALL 중복값까지 출력
select name from student where deptno1=103 union select name from student where deptno2=203;
select name from student where deptno1=103 union ALL select name from student where deptno2=203;

-- 교집합 intersect
SELECT name from student where deptno1=103 intersect select name from student where deptno2=203;

--단일함수
--Count
--count(*)는 null값 포함, count(hpage)sms null값 제외
select count(*),count(hpage) from professor;

--sum
SELECT count(bonus),sum(bonus)from professor;

--avg
select count(bonus),sum(bonus),avg(bonus)from professor;

--max,min
SELECT max(sal),min(sal) from emp;
SELECT max(hiredate),min(hiredate) from emp;

--그룹함수
--emp의 전체갯수
SELECT count(*) from emp;
--급여의 평균
SELECT round(avg(sal),2) from emp;  --소수점2자리
SELECT round(avg(sal),1) from emp;  --소수점1자리
SELECT round(avg(sal),0) from emp;  --소수점없이 반올림

SELECT round(avg(sal),-1) from emp;  --10단위
SELECT round(avg(sal),-2) from emp;  --100단위

--to char ..date형 number형을 varchar2로 바꿔준다
--현재날짜를 콘솔에 출력 sysdate
SELECT sysdate from dual;
--내일날짜를 콘솔에 출력 sysdate
SELECT sysdate+1 from dual;
--일주일뒤날짜를 콘솔에 출력 sysdate
SELECT sysdate+7 from dual;

--날짜에서 월만 추출 3월 ..대소문자 같다
SELECT to_char(sysdate,'month')from dual;

--날짜에서 월만 추출 03 ..대소문자 같다
SELECT to_char(sysdate,'mm')from dual;

--날짜와 시간 출력
alter session set time_zone='Asia/Seoul';
SELECT to_char(sysdate,'yyyy-mm-dd hh24-mi-ss')from dual;
SELECT to_char(current_timestamp,'yyyy-mm-dd hh-mi-ss')from dual;

--to_char number형 숫자에도 적용가능
SELECT to_char(4578952,'999,999,999')from dual;
select to_char(54.9,'99999.00')from dual; --9값이 없으면 공백으로 나온다

--오전 복습문제
--1.표현식을 이용하여 SMITH(CLERK) 로 조회하시오
SELECT ename || '(' || job || ')' from emp;
--2.professor -이름,급여,보너스,총급여 로 조회하시오
SELECT name 이름,pay 급여,nvl(bonus,0) 보너스,pay+nvl(bonus,0) 총급여 from professor;
--3.고객테이블에서 포인트가 50만 이상인 사람의 이름, 주민번호, 포인트 조회하시오
select gname,jumin,point from gogak where point>=500000;
--4.학생테이블에서 서진수의 학년 전화번호 출력하시오
SELECT name,grade,tel from student where name='서진수';
--5.고객테이블에서 포인트가 30만~50만 사이인 사람의 이름과 포인트를 출려하고 포인트가 높은순으로 조회하시오
select gname,point from gogak where point between 300000 and 500000 order by point desc;
--6.성이 김씨이거나 이씨인 학생의 학번,학생명,학년을 조회하시오
SELECT studno,name,grade from student where name like '김%' or name like '이%';
--7.4학년중에서 키가 170보다 작거나 몸무게가 60보다 많은 학생의 이름,학년,키,몸무게를 조회하시오
SELECT name,grade,height,weight from student where grade=4 and (height<170 OR weight>60);
--8.직업이 MANAGER인 사람의 이름 보너스를 구하되 널값은 0으로 바꾸시오
SELECT ename,nvl(comm,0)from emp where job='MANAGER';
--9.emp-이름,급여,연봉(급여*12),보너스,총연봉(연봉+보너스) 로 출력하되 직업의 오름차순 연봉의 내림차순으로 조회할것
SELECT ename,sal,sal*12,NVL(comm,0),sal*12+NVL(comm,0) from emp order by job, sal*12+NVL(comm,0)desc;
--10.student-3학년 이름과 키를 출력 단 이름 오름차순
SELECT name,height from student where grade=3 order by name;
--11.emp-입사일이 5월인 사람만 사원명,입사일 출력하시오
SELECT ename,hiredate from emp where to_char(hiredate,'mm')='05';
--12.student 이름에 '미'를 포함하고있는 사람의 학생명,학년을 조회하시오
select name grade from student where name like '%미%';
--13.emp-사원명중에 대소문자 관계없이 'N'을 포함하고 있는 데이터 출력(사원명,직업,급여)
SELECT ename,job,sal from emp where lower(ename) like '%n%';





