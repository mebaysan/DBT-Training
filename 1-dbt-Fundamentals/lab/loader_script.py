import pandas as pd
from sqlalchemy import create_engine

# creating a connection to our data warehouse which is we created in docker-compose.yml
engine = create_engine("postgresql://root:root@warehouse:5432/WarehouseDB")

# with engine.connect() as con:
#     con.execute("create schema if not exists jaffle_shop")
#     con.execute("create schema if not exists stripe")
#     print("SCHEMAS ARE CREATED!")

# read datasets
dataset1 = pd.read_csv(
    "http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_orders.csv"
)
dataset2 = pd.read_csv(
    "http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_customers.csv"
)
dataset3 = pd.read_csv(
    "http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/stripe_payments.csv"
)


# load data to our warehouse
try:
    dataset1.to_sql(name="jaffle_shop_orders", con=engine, if_exists="replace")
    dataset2.to_sql(name="jaffle_shop_customers", con=engine, if_exists="replace")
    dataset3.to_sql(name="stripe_payments", con=engine, if_exists="replace")
    print("LOADING SUCCEED!")
except:
    print("LOADING ERROR!!!")
