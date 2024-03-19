SELECT
  o.client_number_1,
  CASE
    WHEN sh.client_number IS NOT NULL THEN 'R'
    WHEN hs.client_number IS NOT NULL THEN 'H'
    ELSE 'Unknown'
  END AS client_indicator_1,
  o.client_number_2,
  CASE
    WHEN sh2.client_number IS NOT NULL THEN 'R'
    WHEN hs2.client_number IS NOT NULL THEN 'H'
    ELSE 'Unknown'
  END AS client_indicator_2,
  o.client_number_3,
  CASE
    WHEN sh3.client_number IS NOT NULL THEN 'R'
    WHEN hs3.client_number IS NOT NULL THEN 'H'
    ELSE 'Unknown'
  END AS client_indicator_3
FROM
  Output_4b o
LEFT JOIN
  shared_client_indicator sh ON o.client_number_1 = sh.client_number
LEFT JOIN
  hsbc_client_indicator hs ON o.client_number_1 = hs.client_number
LEFT JOIN
  shared_client_indicator sh2 ON o.client_number_2 = sh2.client_number
LEFT JOIN
  hsbc_client_indicator hs2 ON o.client_number_2 = hs2.client_number
LEFT JOIN
  shared_client_indicator sh3 ON o.client_number_3 = sh3.client_number
LEFT JOIN
  hsbc_client_indicator hs3 ON o.client_number_3 = hs3.client_number
