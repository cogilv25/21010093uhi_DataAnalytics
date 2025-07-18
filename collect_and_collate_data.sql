SELECT `crime`.`date`, EXTRACT(DAYOFWEEK FROM `crime`.`date`) AS `dayOfWeek`, `dayOfMonth`, `month`, `year`, `reports`, `temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp` FROM
(
  SELECT CAST(`date` as DATE) as `date`, COUNT(DISTINCT(`case_number`)) as `reports`
  FROM `bigquery-public-data.chicago_crime.crime`  WHERE `date` < "2025-01-01"
  GROUP BY `date`
) AS `crime`

# Left join to remove any weather records we don't have crime records for.
LEFT JOIN

# Weather Data
(
  SELECT DATE(CAST(year as INT64),CAST(mo as INT64),CAST(da as INT64)) as `date`, `da` AS `dayOfMonth`, `mo` as `month`, `year`, `temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp` FROM
  (
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp` FROM `bigquery-public-data.noaa_gsod.gsod2001` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp` FROM `bigquery-public-data.noaa_gsod.gsod2002` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2003` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2004` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2005` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2006` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2007` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2008` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2009` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2010` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2011` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2012` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2013` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2014` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2015` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2016` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2017` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2018` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2019` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2020` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2021` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2022` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2023` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2024` WHERE `stn`="725340"
    UNION ALL
    SELECT `da`, `mo`, `year`,`temp`, `dewp`, `slp`, `stp`, `visib`, `wdsp`, `mxpsd`, `gust`, `max`, `min`, `prcp`, `sndp`  FROM `bigquery-public-data.noaa_gsod.gsod2025` WHERE `stn`="725340"
  )
) AS `weather`


ON `weather`.`date`=`crime`.`date` ORDER BY `crime`.`date`