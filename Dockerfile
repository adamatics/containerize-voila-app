# Notebook and sample data copied from https://github.com/bqplot/bqplot-gallery.git (BSD-3-Clause license as of October 31st 2023)
FROM python:3.11-slim

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*
RUN apt-get -y update; apt-get -y install curl

ENV POETRY_VIRTUALENVS_CREATE=false \
    POETRY_VIRTUALENVS_IN_PROJECT=false \
    POETRY_NO_INTERACTION=1 \
    POETRY_VERSION=1.6.1
    
ENV PYDEVD_DISABLE_FILE_VALIDATION=1

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"
RUN poetry --version

WORKDIR /app

COPY poetry.lock .
COPY pyproject.toml .
RUN poetry config virtualenvs.create false
RUN poetry install --only main

COPY logs_analytics.ipynb .
COPY server-access-data.log .

RUN jupyter trust logs_analytics.ipynb

EXPOSE 8080

# Use the below two lines to avoid running the container with super user privileges to prevent privilege-escalation-attacks (see https://docs.docker.com/engine/security/userns-remap/).
# See https://docs.docker.com/engine/reference/builder/#user for more on the USER directive.
RUN useradd -ms /bin/bash app_runner
USER app_runner

# If you change your mind about the app name, the below startup command can be overwritten in the Advanced Settings when deploying an app.
# E.g., if you wanted the app to be found at a /apps/interactive-log/ instead of /apps/logs-analytics/, you could use the following
# startup command:
# voila logs_analytics.ipynb --no-browser --port=8080 --Voila.ip=0.0.0.0 --Voila.base_url=/apps/interactive-log/
CMD ["voila", "logs_analytics.ipynb", "--no-browser", "--port=8080", "--Voila.ip=0.0.0.0", "--Voila.base_url=/apps/logs-analytics/"]