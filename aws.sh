export AWS_PROFILE=paws

aws s3 mb s3://openspace-datalake --region=us-east-1  --profile=paws

# https://www.kaggle.com/olistbr/brazilian-ecommerce
aws s3 cp  brazilian-ecommerce/olist_customers_dataset.csv s3://openspace-datalake/incoming/olist/olist_customers_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_customers_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/olist_geolocation_dataset.csv s3://openspace-datalake/incoming/olist/olist_geolocation_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_geolocation_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/olist_order_items_dataset.csv s3://openspace-datalake/incoming/olist/olist_order_items_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_order_items_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/olist_order_payments_dataset.csv s3://openspace-datalake/incoming/olist/olist_order_payments_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_order_payments_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/olist_order_reviews_dataset.csv s3://openspace-datalake/incoming/olist/olist_order_reviews_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_order_reviews_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/olist_orders_dataset.csv s3://openspace-datalake/incoming/olist/olist_orders_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_orders_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/olist_products_dataset.csv s3://openspace-datalake/incoming/olist/olist_products_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_products_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/olist_sellers_dataset.csv s3://openspace-datalake/incoming/olist/olist_sellers_dataset/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_sellers_dataset.csv --profile=paws 
aws s3 cp  brazilian-ecommerce/product_category_name_translation.csv s3://openspace-datalake/incoming/olist/olist_product_category_name_translation/p_ano=2020/p_mes=05/p_dia=24/p_datahora=$(date  +"%Y%m%d%H%M%S")/olist_product_category_name_translation.csv --profile=paws


# s3://openspace-datalake/incoming/olist/olist_customers_dataset
# s3://openspace-datalake/incoming/olist/olist_geolocation_dataset
# s3://openspace-datalake/incoming/olist/olist_order_items_dataset
# s3://openspace-datalake/incoming/olist/olist_order_payments_dataset
# s3://openspace-datalake/incoming/olist/olist_orders_dataset
# s3://openspace-datalake/incoming/olist/olist_products_dataset
# s3://openspace-datalake/incoming/olist/olist_sellers_dataset
# s3://openspace-datalake/incoming/olist/olist_product_category_name_translation