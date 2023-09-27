# pull official base image
FROM python:3.11.4-slim-buster

# RUN apt-get update \
#     && apt-get -y install libpq-dev gcc \
#     && pip install psycopg2

# set work directory
WORKDIR /home/harshalbhoyar/Projects/bharat_energy_webapp/bharat_energy_app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update && apt-get install -y netcat gcc python3-dev libpq-dev

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /home/harshalbhoyar/Projects/bharat_energy_webapp/bharat_energy_app/entrypoint.sh
RUN chmod +x /home/harshalbhoyar/Projects/bharat_energy_webapp/bharat_energy_app/entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/home/harshalbhoyar/Projects/bharat_energy_webapp/bharat_energy_app/entrypoint.sh"]
