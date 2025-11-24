FROM python:3.9-slim-buster

LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source = "https://github.com/benc-uk/python-demoapp"

ARG srcDir=src
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY product_list_app.py .

ENV FLASK_APP=product_list_app.py
ENV FLASK_RUN_HOST=0.0.0.0
CMD ["flask", "run", "--port", "5000"]

