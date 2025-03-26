DELETE FROM SALES_RAW_STAGING
WHERE PRODUCT = 'Lemon';

SELECT * FROM SALES_STREAM; 
--  METADATA$ACTION=DELETE, METADATA$ISUPDATE=FALSE

merge into SALES_FINAL_TABLE F      
using SALES_STREAM S               
   on  f.id = s.id          
when matched 
    and S.METADATA$ACTION ='DELETE' 
    and S.METADATA$ISUPDATE = 'FALSE'
    then delete   ;  
