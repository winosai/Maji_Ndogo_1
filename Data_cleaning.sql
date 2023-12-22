SET SQL_SAFE_UPDATES = 0;

SHOW Tables;

-- Location table 
SELECT
	*
FROM
	location
LIMIT 10;

-- Water source table

SELECT
	*
FROM
	water_source
LIMIT
	10;

/* Type of water source available in Maji ndogo*/
SELECT
	DISTINCT type_of_water_source
FROM
	water_source;

/*Average time spent in queue greater than 500 minutes*/
SELECT
	*
FROM
	visits
WHERE
	time_in_queue > 500;

/*Error visits made to source that are clean (subjective_quality_score = 10) */
    
SELECT 
	*
FROM 
	md_water_serviceso.water_quality
WHERE 
	subjective_quality_score = 10
    AND visit_count = 2;

/*Identifying the error in the description column of the well pollution table 
where if biological contaminants is greater than 0.01 supposed to be recorded as contaminated and not clean*/

SELECT 
	*
FROM
	well_pollution
WHERE
	description LIKE "Clean_%"
	AND biological > 0.01;

/* Updated the description error (Clean Bacteria:E.Coli) to the intended value (Bacteria: E.Coli) */

UPDATE
	well_pollution
SET
	description = "Bacteria: E. Coli"
WHERE
	description = "Clean Bacteria: E. Coli";

/* Updated the description error (Clean Bacteria:Giardia Lamblia) to the intended value (Bacteria: Giardia Lamblia) */
UPDATE
	well_pollution
SET
	description = "Bacteria: Giardia Lamblia"
WHERE
	description = "Clean Bacteria: Giardia Lamblia";

/* Updated the result value to Contaminated for well which the biological_contaminant was > 0.01 */
UPDATE
	well_pollution
SET
	results = "Contaminated: Biological"
WHERE
	biological > 0.01
    AND results = "Clean";
