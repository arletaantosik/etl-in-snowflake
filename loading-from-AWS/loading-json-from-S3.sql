-- Format columns & use DATE function
SELECT 
$1:asin::STRING as ASIN,
$1:helpful as helpful,
$1:overall as overall,
$1:reviewText::STRING as reviewtext,
$1:reviewTime::STRING,
$1:reviewerID::STRING,
$1:reviewTime::STRING,
$1:reviewerName::STRING,
$1:summary::STRING,
DATE($1:unixReviewTime::int) as Revewtime
FROM @MANAGE_DB.external_stages.json_folder;

-- convert reviewTime from string to date
SELECT 
$1:asin::STRING as ASIN,
$1:helpful as helpful,
$1:overall as overall,
$1:reviewText::STRING as reviewtext,
DATE_FROM_PARTS( RIGHT($1:reviewTime::STRING,4), LEFT($1:reviewTime::STRING,2), SUBSTRING($1:reviewTime::STRING,4,2) ),
$1:reviewerID::STRING,
$1:reviewTime::STRING,
$1:reviewerName::STRING,
$1:summary::STRING,
DATE($1:unixReviewTime::int) as unixRevewtime
FROM @MANAGE_DB.external_stages.json_folder;

-- case when a month is only 1 digit e.g. 4 (april) instead of 04, there's no problem in digit 10-12
SELECT 
$1:asin::STRING as ASIN,
$1:helpful as helpful,
$1:overall as overall,
$1:reviewText::STRING as reviewtext,
DATE_FROM_PARTS( 
  RIGHT($1:reviewTime::STRING,4), 
  LEFT($1:reviewTime::STRING,2), 
  CASE WHEN SUBSTRING($1:reviewTime::STRING,5,1)=',' 
        THEN SUBSTRING($1:reviewTime::STRING,4,1) ELSE SUBSTRING($1:reviewTime::STRING,4,2) END),
$1:reviewerID::STRING,
$1:reviewTime::STRING,
$1:reviewerName::STRING,
$1:summary::STRING,
DATE($1:unixReviewTime::int) as UnixRevewtime
FROM @MANAGE_DB.external_stages.json_folder;

CREATE OR REPLACE TABLE FIRST_DB.PUBLIC.reviews (
asin STRING,
helpful STRING,
overall STRING,
reviewtext STRING,
reviewtime DATE,
reviewerid STRING,
reviewername STRING,
summary STRING,
unixreviewtime DATE
);

COPY INTO FIRST_DB.PUBLIC.reviews
    FROM (SELECT 
$1:asin::STRING as ASIN,
$1:helpful as helpful,
$1:overall as overall,
$1:reviewText::STRING as reviewtext,
DATE_FROM_PARTS( 
  RIGHT($1:reviewTime::STRING,4), 
  LEFT($1:reviewTime::STRING,2), 
  CASE WHEN SUBSTRING($1:reviewTime::STRING,5,1)=',' 
        THEN SUBSTRING($1:reviewTime::STRING,4,1) ELSE SUBSTRING($1:reviewTime::STRING,4,2) END),
$1:reviewerID::STRING,
$1:reviewerName::STRING,
$1:summary::STRING,
DATE($1:unixReviewTime::int) Revewtime
FROM @MANAGE_DB.external_stages.json_folder);

SELECT * FROM FIRST_DB.PUBLIC.reviews ;
