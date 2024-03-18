SELECT
  o.client_number,
  CASE
    WHEN s.client_number IS NOT NULL THEN 'R'
    WHEN h.client_number IS NOT NULL THEN 'H'
    ELSE 'Unknown'
  END AS client_indicator
FROM
  Output_4b o
LEFT JOIN
  client_list s ON o.client_number = s.shared_client_numbers
LEFT JOIN
  client_list h ON o.client_number = h.HSBC_client_numbers
