--------------------------------------------------------------------SQL2 -hr
--문제1) EMPLOYEES 테이블에서 급여가 3000이상인 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력하라. 
SELECT employee_id, last_name, job_id, salary 
FROM employees
WHERE salary >= 3000;

--문제2) EMPLOYEES 테이블에서 담당 업무가 Manager인 사원의 정보를   
--      사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라. (Manager == ST_MAN) 
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE job_id = 'ST_MAN';

--문제3) EMPLOYEES 테이블에서 입사일자가 
--      1982년 1월 1일 이후에 입사한 사원의 정보를  
--      사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하 라.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date >= '82/01/01';

SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date > to_date('19820101', 'YYYYMMDD');

--문제4) EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를  
--      성명, 담당업무, 급여, 부서번호를 출력하라.  
--      (AND만 사용, BETWEEN도 함께 사용) 
SELECT last_name, job_id, salary, department_id
FROM employees
    WHERE salary BETWEEN 3000 AND 5000;
--==WHERE salary >= 3000 AND salary <= 5000;

--문제5) EMPLOYEES 테이블에서 사원번호가 145,152,203인 사원의 정보를
--      사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라 (IN만 사용, OR만 사용) 
SELECT employee_id, last_name, job_id, salary, hire_date
FROM employees
    WHERE employee_id IN(145,152,203);
--==WHERE employee_id = 145 OR employee_id = 152 OR employee_id = 203;

--문제6) EMPLOYEES 테이블에서 입사일자가 05년도에 입사한 사원의 정보를  
--      사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. (LIKE 사용) 
SELECT employee_id, last_name, job_id, salary, hire_date, department_id
FROM employees
    WHERE hire_date LIKE '05%';
--==WHERE hire_date >= '05/01/01' AND hire_date <= '05/12/31';

--문제7) EMPLOYEES 테이블에서 보너스가 NULL인 사원의 정보를  
--      사원번호, 성명, 담당업무, 급여, 입사일자, 보너스, 부서번호를 출력하라. (IS 사용) 
SELECT employee_id, last_name, job_id, salary, hire_date, NVL(commission_pct, 0.0), department_id
FROM employees
WHERE commission_pct IS NULL;

--문제8) EMPLOYEES 테이블에서 급여가 1100이상이고 JOB이 Manager인  
--      사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를
--      출력하라 (AND사용, ST_MAN)
SELECT employee_id, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 1100 AND job_id = 'ST_MAN';

--문제9) EMPLOYEES 테이블에서 급여가 10000이상이거나 JOB이 Manager인 사원의 정보를
--      사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하 라 (OR사용, ST_MAN) 
SELECT employee_id, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 10000 OR job_id = 'ST_MAN';

--문제10) EMPLOYEES 테이블에서 급여가 JOB이 ST_MAN, SA_MAN, SA_REP 가 아닌 사원의 정보를  
--       사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라 (NOT IN 사용) 
SELECT employee_id, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE job_id NOT IN('ST_MAN','SA_MAN','SA_REP');

--문제11) 업무가 PRESIDENT이고 급여가 12000이상이거나 업무가  
--       SALESMAN인 사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라.
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id = 'AD_PRES' 
    AND salary >= 12000 
        OR  job_id = 'SA_MAN' ;

--문제12) 업무가 PRESIDENT또는 SALESMAN이고 급여가 12000이상이거나  
--       사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라.
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id = 'AD_PRES' 
    OR  job_id = 'SA_MAN' 
        AND salary >= 12000 ;

--------------------------------------------------------------------scott1
--6) emp 테이블에서 사원번호가 7698 인 사원의 이름, 업무, 급여를 출력하시오.
SELECT ename, job, sal
FROM emp
WHERE empno = 7698;

-- 7) emp 테이블에서 사원이름이 SMITH인 사람의 이름과 월급, 부서번호를 구하시오.
SELECT ename, sal, deptno
FROM emp
WHERE ename = 'SMITH';

-- 8) 월급이 2500이상 3500미만인 사원의 이름, 입사일, 월급을 구하시오.
SELECT ename, hiredate, sal
FROM emp
WHERE sal >= 2500 and sal < 3500;

-- 9) 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오.
SELECT ename, job, sal
FROM emp
WHERE sal NOT BETWEEN 2000 AND 3000;

-- 10) 81년05월01일과 81년12월03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력하시오.
SELECT ename, job, hiredate
FROM emp
WHERE hiredate >= '81/05/01' and hiredate <= '81/12/03';
-- == hiredate BETWEEN '81/05/01' AND '81/12/03';

-- 11) emp테이블에서 사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호,이름,
--    월급을 출력하시오.
SELECT empno, ename, sal
FROM emp
WHERE empno NOT IN(7566,7782,7934);

-- 12) 부서번호 30(deptno)에서 근무하며 
-- 월 2,000달러 이하를 받는 
-- 81년05월01일 이전에 입사한 
-- 사원의 이름, 급여, 부서번호, 입사일을 출력하시오.        //잘라보는 습관
SELECT ename, sal, deptno, hiredate
FROM emp
WHERE deptno = 30 
    and sal <= 2000 
        and hiredate <= '81/05/01' ;

-- 13) emp테이블에서 급여가 2,000와 5,000 사이고
-- 부서번호가 10 또는 30인 사원의 이름과 급여,부서번호를 나열하시오.
SELECT ename, sal, deptno
FROM emp
WHERE (sal BETWEEN 2000 AND 5000) --BETWEEN을 썼을땐 
    AND (deptno = 10 OR deptno = 30);
--==AND (deptno in(10, 30));
--==SUB QUERY - 가독성이 좋을 때도 있음 
SELECT ename, sal, deptno
FROM (SELECT ename, sal, deptno 
      FROM emp  
      WHERE sal BETWEEN 2000 AND 5000)
WHERE deptno = 10 OR deptno = 30;
--  SELECT 부분이 다르면 에러남

-- 14) 업무가 SALESMAN 또는 MANAGER이면서 급여가 1,600, 2,975 또는 2,850이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오.
SELECT ename, job, sal
FROM emp
WHERE (job = 'SALESMAN' OR job = 'MANAGER')
        AND (sal NOT IN(1600,2975,2850));       --구직사이트 만들때 조건이 많으므로 ()를 많이 사용할 수도

-- 15) emp테이블에서 사원이름 중 S가 포함되지 않은 사람들 중 
-- 부서번호가 20인 사원들의 이름과 부서번호를 출력하시오.
SELECT ename, deptno
FROM emp
WHERE ename NOT LIKE '%S%' 
    AND deptno = 20 ;

-- 16) emp테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오.
SELECT ename
FROM emp
WHERE ename LIKE '%A%' 
    AND ename LIKE '%E%' ;

-- 17) emp테이블에서 관리자가 없는 모든 사원의 이름과 업무를 표시하시오.
SELECT ename, job
FROM emp
WHERE mgr IS NULL;

-- 18) emp테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오.
SELECT ename, sal, comm 
FROM emp
WHERE comm IS NOT NULL --여기서 커미션이 0인 TURNER가 존재
    AND comm <> 0;     --여기서 0인 사람 제외해줘야함.
--==AND comm != 0;