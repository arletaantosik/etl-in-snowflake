UPDATE SALES_RAW_STAGING
SET PRODUCT ='Potato' WHERE PRODUCT = 'Banana';

SELECT * FROM SALES_STREAM;
-- potato -> "action"=insert, "isupdate"= true
-- banana -> "action"=delete, "isupdate"= true

merge into SALES_FINAL_TABLE F      -- target table to merge changes from source table
using SALES_STREAM S                -- sream that has captured the changes
   on  f.id = s.id    -- banana =>> potato             
when matched 
    and S.METADATA$ACTION ='INSERT'
    and S.METADATA$ISUPDATE ='TRUE'        -- indicates the record has been updated 
    then update 
    set f.product = s.product,
        f.price = s.price,
        f.amount= s.amount,
        f.store_id=s.store_id;
