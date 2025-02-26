FROM python:3.8

LABEL maintainer="Rushil Srivastava <rushu0922@gmail.com>"

RUN pip install --no-cache-dir "uvicorn[standard]" gunicorn

COPY ./prestart.sh /prestart.sh

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 80

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]
