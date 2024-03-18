SELECT
  o.client_number_1,
  CASE
    WHEN s1.client_number IS NOT NULL THEN 'R'
    WHEN h1.client_number IS NOT NULL THEN 'H'
    ELSE 'Unknown'
  END AS client_indicator_1,
  o.client_number_2,
  CASE
    WHEN s2.client_number IS NOT NULL THEN 'R'
    WHEN h2.client_number IS NOT NULL THEN 'H'
    ELSE 'Unknown'
  END AS client_indicator_2,
  o.client_number_3,
  CASE
    WHEN s3.client_number IS NOT NULL THEN 'R'
    WHEN h3.client_number IS NOT NULL THEN 'H'
    ELSE 'Unknown'
  END AS client_indicator_3
FROM
  Output_4b o
LEFT JOIN
  client_list s1 ON o.client_number_1 = s1.shared_client_numbers
LEFT JOIN
  client_list h1 ON o.client_number_1 = h1.HSBC_client_numbers
LEFT JOIN
  client_list s2 ON o.client_number_2 = s2.shared_client_numbers
LEFT JOIN
  client_list h2 ON o.client_number_2 = h2.HSBC_client_numbers
LEFT JOIN
  client_list s3 ON o.client_number_3 = s3.shared_client_numbers
LEFT JOIN
  client_list h3 ON o.client_number_3 = h3.HSBC_client_numbers
