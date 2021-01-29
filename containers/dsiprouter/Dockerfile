FROM python:3.8-buster

MAINTAINER Richard Bolaji <richard@goflyball.com>

COPY ./  /opt/dsiprouter/
WORKDIR /opt/dsiprouter
RUN pip install -r ./gui/requirements.txt
ENV DBSERVER ''
ENV DBPORT '3306'
ENV DBUSER ''
ENV DBPASS ''
ENV DBNAME ''

EXPOSE 5000:5000
systemctl start dsiprouter
systemctl start nginx
CMD ["python", "./gui/dsiprouter.py", "runserver"]
