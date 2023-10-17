--Fill Blank Lat/Lon cells with a known neighborhood with average of given neighborhood-

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



--Extract Day of week, Month, and Year numbers into their own columns-

ALTER TABLE 
  `portland-crime-analysis.portland_crime_data.pcrime2`
ADD COLUMN 
  day_num int64,
ADD COLUMN
  month_num int64;
UPDATE
  `portland-crime-analysis.portland_crime_data.pcrime2`
SET
  day_num = EXTRACT(DAYOFWEEK FROM OccurDate)
Where day_num is null;

UPDATE
  `portland-crime-analysis.portland_crime_data.pcrime2`
SET
  month_num = EXTRACT(MONTH FROM OccurDate)
Where month_num is null;

--Add columns for day and month names
ALTER TABLE 
  `portland-crime-analysis.portland_crime_data.pcrime`
ADD COLUMN 
  day_of_week STRING,
ADD COLUMN
  month string,
ADD COLUMN
  Year INT64; 

UPDATE
  `portland-crime-analysis.portland_crime_data.pcrime`
SET 
  day_of_week =CASE EXTRACT(DAYOFWEEK FROM OccurDate)
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
    END
WHERE day_of_week is null;
UPDATE
  `portland-crime-analysis.portland_crime_data.pcrime`
SET
  month =CASE EXTRACT(MONTH FROM OccurDate)
       WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
      END
WHERE month is null;
UPDATE
  `portland-crime-analysis.portland_crime_data.pcrime`
SET
  year =EXTRACT(YEAR FROM OccurDate)
FROM `portland-crime-analysis.portland_crime_data.pcrime`;




--Extract Hour in military time from OccurTime into own column

Alter Table 
    `portland-crime-analysis.portland_crime_data.pcrime2`
ADD Column
    hour INT64;
UPDATE
    `portland-crime-analysis.portland_crime_data.pcrime2`
SET
   hour =CASE OccurTime
        WHEN '12 AM' THEN 0
        WHEN '1 AM' THEN 1
        WHEN '2 AM' THEN 2
        WHEN '3 AM' THEN 3
        WHEN '4 AM' THEN 4
        WHEN '5 AM' THEN 5
        WHEN '6 AM' THEN 6
        WHEN '7 AM' THEN 7
        WHEN '8 AM' THEN 8
        WHEN '9 AM' THEN 9
        WHEN '10 AM' THEN 10
        WHEN '11 AM' THEN 11
        WHEN '12 PM' THEN 12
        WHEN '1 PM' THEN 13
        WHEN '2 PM' THEN 14
        WHEN '3 PM' THEN 15
        WHEN '4 PM' THEN 16
        WHEN '5 PM' THEN 17
        WHEN '6 PM' THEN 18
        WHEN '7 PM' THEN 19
        WHEN '8 PM' THEN 20
        WHEN '9 PM' THEN 21
        WHEN '10 PM' THEN 22
        WHEN '11 PM' THEN 23
    END
WHERE
    hour is null;
