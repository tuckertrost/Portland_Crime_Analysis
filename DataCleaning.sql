-Fill Blank Lat/Lon cells with a known neighborhood with average of given neighborhood-

UPDATE `portland-crime-analysis.portland_crime_data.pcrime`
SET OpenDataLat = (
    SELECT AVG(OpenDataLat)
    FROM `portland-crime-analysis.portland_crime_data.pcrime` AS p
    WHERE p.OpenDataLat IS NOT NULL
    AND p.Neighborhood = `portland-crime-analysis.portland_crime_data.pcrime`.Neighborhood
    AND p.Neighborhood <> 'Unknown'
),
OpenDataLon = (
    SELECT AVG(OpenDataLon)
    FROM `portland-crime-analysis.portland_crime_data.pcrime` AS p
    WHERE p.OpenDataLon IS NOT NULL
    AND p.Neighborhood = `portland-crime-analysis.portland_crime_data.pcrime`.Neighborhood
    AND p.Neighborhood <> 'Unknown'
)
WHERE OpenDataLat IS NULL AND OpenDataLon IS NULL;



-Extract Day of week, Month, and Year into their own columns-

SELECT
  *,
    CASE EXTRACT(DAYOFWEEK FROM OccurDate)
        WHEN 1 THEN 'Sun'
        WHEN 2 THEN 'Mon'
        WHEN 3 THEN 'Tue'
        WHEN 4 THEN 'Wed'
        WHEN 5 THEN 'Thu'
        WHEN 6 THEN 'Fri'
        WHEN 7 THEN 'Sat'
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM OccurDate)
       WHEN 1 THEN 'Jan'
        WHEN 2 THEN 'Feb'
        WHEN 3 THEN 'Mar'
        WHEN 4 THEN 'Apr'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'Jun'
        WHEN 7 THEN 'Jul'
        WHEN 8 THEN 'Aug'
        WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Oct'
        WHEN 11 THEN 'Nov'
        WHEN 12 THEN 'Dec'
      END as month,
    EXTRACT(YEAR FROM OccurDate) as year
FROM `portland-crime-analysis.portland_crime_data.pcrime`;
