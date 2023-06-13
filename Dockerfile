#v means the below statement 

FROM python:3.9-alpine3.13
LABEL maintainer="Anabot12"

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt 
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

#creates a new virtual environment|v
 
ARG DEV=false 
RUN python -m venv /py && \    
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r/tmp/requirements.txt &&\
    if [$DEV ='true' ] ; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    #we dont want any extra dependencies so we delete the tmp files (v)
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django user

ENV PATH="/py/bin:$PATH"

USER django-user
