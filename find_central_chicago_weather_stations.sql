SELECT * FROM `bigquery-public-data.noaa_gsod.stations` WHERE
lat > 41.64436 AND lat < 42.01836 AND lon > -87.84245 AND lon < -87.52453
ORDER BY `begin` ASC;