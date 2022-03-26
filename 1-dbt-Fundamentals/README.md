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

# Datasets

- http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_orders.csv
- http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/jaffle_shop_customers.csv
- http://dbt-tutorial-public.s3-us-west-2.amazonaws.com/stripe_payments.csv


# Folder Structure

`lab` folder is not a part of our core dbt project. We use `lab` folder to run our experimental lab to simulate extract & load into our `WarehouseDB` warehouse.

In root folder which is `1-dbt-Fundamentals`, there are core dbt modules & files. The `requirements.txt` file is for the core dbt project. The `introduction_to_dbt` folder is created with `dbt init` . So, it is the main project folder :)

# DBT Settings
 For this project, I put the YAML below to `~/.dbt/profiles.yml` file. You can get more information about the `profiles.yml` file from the [official docs](https://docs.getdbt.com/dbt-cli/configure-your-profile).
 ```yaml
introduction_to_dbt:
  outputs:

    dev:
      type: postgres
      threads: 1
      host: 127.0.0.1
      port: 5432
      user: root
      pass: root
      dbname: WarehouseDB
      schema: transformed

    prod:
      type: postgres
      threads: [1 or more]
      host: [host]
      port: [port]
      user: [prod_username]
      pass: [prod_password]
      dbname: [dbname]
      schema: [prod_schema]

  target: dev

 ```