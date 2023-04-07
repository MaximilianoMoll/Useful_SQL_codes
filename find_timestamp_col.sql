DROP FUNCTION IF EXISTS find_timestamp_col(IN tabname text);
CREATE OR REPLACE FUNCTION find_timestamp_col(IN tabname text)
RETURNS TABLE(data_type text, column_name name, matview_name name,is_timestamp int)
AS $$
DECLARE 
var_r record;

BEGIN
FOR var_r IN
 EXECUTE FORMAT('SELECT format_type(att.atttypid, att.atttypmod) AS data_type, 
					att.attname AS column_name,
					mv.relname AS matview_name
				FROM pg_catalog.pg_attribute att
				JOIN pg_catalog.pg_class mv ON mv.oid = att.attrelid
				WHERE LOWER(mv.relname) = %s 
					AND NOT att.attisdropped 
					AND att.attnum > 0
				ORDER BY column_name, att.attnum',tabname)
	LOOP
		IF var_r.data_type='timestamp without time zone' OR var_r.data_type='timestamp with time zone'
		THEN 
			is_timestamp=1;
		ELSE
			is_timestamp=0;
		END IF;
		
		data_type:=var_r.data_type;
		column_name:=var_r.column_name;
		matview_name:=var_r.matview_name;
		
		RETURN NEXT;
	END LOOP;
		
END;
$$  LANGUAGE 'plpgsql';	


-- Usage Example:
-- SELECT * FROM find_timestamp_col('''<table/view/mview name>''')