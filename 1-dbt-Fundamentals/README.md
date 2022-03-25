# Introduction

I used dbt CLI instead of dbt Cloud while following this course. I choosed PostgreSQL as a warehouse instead of Redshift etc. To simulate this course, I created a lab based on Docker. In `lab` folder, there is a `docker-compose.yml` file to run our lab. That lab does the steps below:
- Create a container from `postgres` image
  - Username: `root`
  - Password: `root`
  - DB Name: `WarehouseDB`
  - Port: 5432
- Create a container from `Dockerfile` which is located in the same folder
  - Read datasets from web
  - Load the datasets into the `WarehouseDB`

# Running The Lab

You should execute the script below on a terminal
```bash
docker-compose up -d
```

If you get error something like the below
```bash
docker-compose up -d

>>> The folder '/tmp/dbt_course1_volume' couldn't find...
```

You should create a folder to store your volumes
```bash
mkdir /tmp/dbt_course1_volume
```


# Datasets

- http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_orders.csv
- http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_customers.csv
- http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/stripe_payments.csv