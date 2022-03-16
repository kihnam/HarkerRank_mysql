SELECT  A.COMPANY_CODE
        ,A.FOUNDER
        ,COUNT(DISTINCT B.LEAD_MANAGER_CODE)
        ,COUNT(DISTINCT C.SENIOR_MANAGER_CODE)
        ,COUNT(DISTINCT D.MANAGER_CODE)
        ,COUNT(DISTINCT E.EMPLOYEE_CODE)
  FROM  COMPANY AS A
  LEFT
  JOIN  LEAD_MANAGER AS B
    ON  A.COMPANY_CODE = B.COMPANY_CODE
  LEFT
  JOIN  SENIOR_MANAGER AS C
    ON  B.LEAD_MANAGER_CODE = C.LEAD_MANAGER_CODE
  LEFT
  JOIN  MANAGER AS D
    ON  C.SENIOR_MANAGER_CODE = D.SENIOR_MANAGER_CODE
  LEFT
  JOIN  EMPLOYEE AS E
    ON  D.MANAGER_CODE = E.MANAGER_CODE
 GROUP
    BY  A.COMPANY_CODE
        ,A.FOUNDER
 ORDER
    BY  A.COMPANY_CODE