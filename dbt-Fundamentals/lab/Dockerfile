FROM python:3.9

WORKDIR /tmp/dbt-lab

COPY . .

RUN pip install -r requirements.txt

CMD ["python", "loader_script.py"]