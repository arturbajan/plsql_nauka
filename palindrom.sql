SELECT
	x.*
  FROM
	(
		SELECT
			to_char(0 + ROWNUM) ok,
			reverse(
				to_char(0 + ROWNUM)
			)                   rev,
			CASE
			    WHEN 0 + ROWNUM >= 10 AND to_char(0 + ROWNUM)= reverse(
				    to_char(0 + ROWNUM)
			    )THEN
			        'Palindrom'
			    ELSE
			        NULL
			END                tst
		  FROM
			dual
		CONNECT BY
			level < :l_num 
	)x
 WHERE
	tst IS NOT NULL;
