# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact

### Setup Instructions

git clone git@bitbucket.org:projects-webapp/bharat_energy_webapp.git
cd bharat_energy_webapp/

### Setup local database with below database name, username and password will be 'postgres' in order to run in DEV environment
psql -u postgres
sudo -i -u postgres
    psql
    CREATE DATABASE bharat_energy;
*** Exit out of the postgres shell **
sudo apt install python3-virtualenv
virtualenv venv
source venv/bin/activate
pip install django psycopg2
python manage.py makemigrations
python manage.py migrate
python manage.py runserver


sudo docker-compose up -d --build
sudo docker-compose exec web python manage.py migrate --noinput
sudo docker logs <container_id>
