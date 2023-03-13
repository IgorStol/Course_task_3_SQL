SELECT alb_name, alb_release from albums WHERE alb_release >= '2018-01-01' AND  alb_release <=  '2018-12-31'

SELECT tr_name, tr_duration FROM treacks
WHERE tr_duration = (
	SELECT MAX(tr_duration)
	FROM treacks);

SELECT tr_name FROM treacks WHERE tr_duration <= 3.5

SELECT com_name FROM compilation WHERE com_release >= '2018-01-01'::date AND com_release <= '2020-12-31'::date

SELECT mus_name FROM musicians
WHERE mus_name NOT LIKE '% %'

SELECT tr_name FROM treacks
WHERE tr_name LIKE '%my%'





