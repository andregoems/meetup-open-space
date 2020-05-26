
create schema  incoming ; 
create schema  raw ; 
create schema  trusted ;



CREATE EXTERNAL TABLE raw.olist_customers_dataset(
  customer_id string, 
  customer_unique_id string, 
  customer_zip_code_prefix bigint, 
  customer_city string, 
  customer_state string)
PARTITIONED BY ( 
  p_ano string, 
  p_mes string, 
  p_dia string, 
  p_datahora string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://openspace-datalake/raw/olist/olist_customers_dataset/'


  
insert into  raw.olist_customers_dataset  
select  
  customer_id ,
  customer_unique_id ,
  customer_zip_code_prefix ,
  customer_city ,
  customer_state ,
  p_ano ,
  p_mes ,
  p_dia ,
  p_datahora 
from  incoming.olist_customers_dataset  ;



CREATE EXTERNAL TABLE trusted.olist_customers_dataset(
  customer_id string, 
  customer_unique_id string, 
  customer_zip_code_prefix bigint, 
  customer_city string, 
  customer_state string)
PARTITIONED BY ( 
  p_ano string, 
  p_mes string, 
  p_dia string, 
  p_datahora string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://openspace-datalake/trusted/olist/olist_customers_dataset/'





select  
  customer_id ,
  customer_unique_id ,
  customer_zip_code_prefix ,
  customer_city ,
  customer_state ,
  p_ano ,
  p_mes ,
  p_dia ,
  p_datahora 
from  raw.olist_customers_dataset 
    where   p_datahora = (select max(p_datahora) from raw.olist_customers_dataset where p_ano='2020' and p_mes='05' and p_dia='24')
        and p_ano='2020' 
        and p_mes='05' 
        and p_dia='24';



-- check
select 'raw' as tier  , 
        p_datahora ,  
        count(*)  as qtd_linhas
from raw.olist_customers_dataset     
where  p_ano='2020'  and p_mes='05'  and p_dia='24' group by p_datahora

union all  

select 'trusted' as tier, 
        p_datahora,  
        count(*) as qtd_linhas 
 from trusted.olist_customers_dataset 
 where p_ano='2020'  
   and p_mes='05' 
   and p_dia='24' 
group by p_datahora;