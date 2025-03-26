-- insert, update and delete in 1 merge
merge into SALES_FINAL_TABLE F      -- target table to merge changes from source table
USING ( SELECT STRE.*,ST.location,ST.employees
        FROM SALES_STREAM STRE
        JOIN STORE_TABLE ST
        ON STRE.store_id = ST.store_id
       ) S
ON F.id=S.id
when matched                        -- DELETE condition
    and S.METADATA$ACTION ='DELETE' 
    and S.METADATA$ISUPDATE = 'FALSE'
    then delete                   
when matched                        -- UPDATE condition
    and S.METADATA$ACTION ='INSERT' 
    and S.METADATA$ISUPDATE  = 'TRUE'       
    then update 
    set f.product = s.product,
        f.price = s.price,
        f.amount= s.amount,
        f.store_id=s.store_id
when not matched 
    and S.METADATA$ACTION ='INSERT'
    then insert 
    (id,product,price,store_id,amount,employees,location)
    values
    (s.id, s.product,s.price,s.store_id,s.amount,s.employees,s.location);
