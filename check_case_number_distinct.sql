SELECT * FROM `bigquery-public-data.chicago_crime.crime`
WHERE `case_number` IN
  (
    SELECT `case_number` FROM `bigquery-public-data.chicago_crime.crime`
    GROUP BY `case_number` HAVING COUNT(*) > 1
  )
ORDER BY `case_number` ASC;