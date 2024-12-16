######################################################################
# Node stage to deal with static asset construction
######################################################################
ARG PY_VER=3.10-slim-bookworm

# if BUILDPLATFORM is null, set it to 'amd64' (or leave as is otherwise).
ARG BUILDPLATFORM=${BUILDPLATFORM:-amd64}
FROM --platform=${BUILDPLATFORM} node:18-bullseye-slim AS superset-node

ARG NPM_BUILD_CMD="build"

# Somehow we need python3 + build-essential on this side of the house to install node-gyp
RUN apt-get update -qq \
    && apt-get install \
    -yqq --no-install-recommends \
    build-essential \
    python3 \
    make \
    gcc \
    g++

ENV BUILD_CMD=${NPM_BUILD_CMD} \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# NPM ci first, as to NOT invalidate previous steps except for when package.json changes

RUN --mount=type=bind,target=/frontend-mem-nag.sh,src=./docker/frontend-mem-nag.sh \
    /frontend-mem-nag.sh

WORKDIR /app/superset-frontend
RUN --mount=type=bind,target=./package.json,src=./superset-frontend/package.json \
    --mount=type=bind,target=./package-lock.json,src=./superset-frontend/package-lock.json \
    npm ci

# Runs the webpack build process
COPY superset-frontend /app/superset-frontend
# Run the script for building and installing custom plugins
COPY ./scripts/install-custom-plugins.sh ./scripts/install-custom-plugins.sh
RUN ./scripts/install-custom-plugins.sh
RUN npm run ${BUILD_CMD}

# This copies the .po files needed for translation
RUN mkdir -p /app/superset/translations
COPY superset/translations /app/superset/translations
# Compiles .json files from the .po files, then deletes the .po files
RUN npm run build-translation

######################################################################
# Final lean image...
######################################################################
FROM python:${PY_VER} AS lean

WORKDIR /app
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    SUPERSET_ENV=production \
    FLASK_APP="superset.app:create_app()" \
    PYTHONPATH="/app/pythonpath" \
    SUPERSET_HOME="/app/superset_home" \
    SUPERSET_PORT=8088

RUN mkdir -p ${PYTHONPATH} superset/static requirements superset-frontend apache_superset.egg-info requirements \
    && useradd --user-group -d ${SUPERSET_HOME} -m --no-log-init --shell /bin/bash superset \
    && apt-get update -qq && apt-get install -yqq --no-install-recommends \
    build-essential \
    curl \
    default-libmysqlclient-dev \
    libsasl2-dev \
    libsasl2-modules-gssapi-mit \
    libpq-dev \
    libecpg-dev \
    libldap2-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=superset:superset pyproject.toml setup.py MANIFEST.in README.md ./
# setup.py uses the version information in package.json
COPY --chown=superset:superset superset-frontend/package.json superset-frontend/
COPY --chown=superset:superset requirements/base.txt requirements/
RUN --mount=type=cache,target=/root/.cache/pip \
    apt-get update -qq && apt-get install -yqq --no-install-recommends \
    build-essential \
    && pip install --upgrade setuptools pip \
    && pip install -r requirements/base.txt \
    && apt-get autoremove -yqq --purge build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy the compiled frontend assets
COPY --chown=superset:superset --from=superset-node /app/superset/static/assets superset/static/assets

## Lastly, let's install superset itself
COPY --chown=superset:superset superset superset
RUN chown -R superset:superset ./* \
    && pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org --no-cache-dir -e . \
    && flask fab babel-compile --target superset/translations

# Compile translations for the backend - this generates .mo files, then deletes the .po files
COPY ./scripts/translations/generate_mo_files.sh ./scripts/translations/
RUN ./scripts/translations/generate_mo_files.sh \
    && chown -R superset:superset superset/translations \
    && rm superset/translations/messages.pot \
    && rm superset/translations/*/LC_MESSAGES/*.po

# COPY --chown=superset:superset ./superset-logos/* /app/superset/static/assets/images/
COPY --chmod=755 ./docker/run-server.sh /usr/bin/
# RUN chmod +x /usr/bin/run-server.sh
USER superset

HEALTHCHECK CMD curl -f "http://localhost:${SUPERSET_PORT}/health"

EXPOSE ${SUPERSET_PORT}

CMD ["/usr/bin/run-server.sh"]

######################################################################
# Dev image...
######################################################################
FROM lean AS dev
ARG GECKODRIVER_VERSION=v0.32.0
ARG FIREFOX_VERSION=106.0.3

USER root
RUN apt-get update -qq \
    && apt-get install -yqq --no-install-recommends \
    libnss3 \
    libdbus-glib-1-2 \
    libgtk-3-0 \
    libx11-xcb1 \
    libasound2 \
    libxtst6 \
    wget \
    git \
    pkg-config \
    # Install GeckoDriver WebDriver
    && apt-get autoremove -yqq --purge wget && rm -rf /var/lib/apt/lists/* && apt-get clean


RUN --mount=type=cache,target=/root/.cache/pip \
    pip install playwright
RUN playwright install-deps
RUN playwright install chromium

# Install GeckoDriver WebDriver
ARG GECKODRIVER_VERSION=v0.34.0 \
    FIREFOX_VERSION=125.0.3

RUN apt-get update -qq \
    && apt-get install -yqq --no-install-recommends wget bzip2 \
    && apt-get autoremove -yqq --purge wget bzip2 && rm -rf /var/[log,tmp]/* /tmp/* /var/lib/apt/lists/*
# Cache everything for dev purposes...
COPY ./requirements/*.txt ./docker/requirements-*.txt/ /app/requirements/
COPY --chown=superset:superset requirements/development.txt requirements/
RUN pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org pymysql
RUN pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org --no-cache-dir -r /app/requirements/docker.txt \
    && pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org --no-cache-dir -r /app/requirements/requirements-local.txt || true
RUN rm -rf /var/lib/apt/lists/*

USER superset
######################################################################
# CI image...
######################################################################
FROM lean AS ci
ARG GECKODRIVER_VERSION=v0.32.0
ARG FIREFOX_VERSION=106.0.3

USER root

RUN apt-get update -q \
    && apt-get install -yq --no-install-recommends \
    libnss3 \
    libdbus-glib-1-2 \
    libgtk-3-0 \
    libx11-xcb1 \
    libasound2 \
    libxtst6 \
    wget \
    # Install GeckoDriver WebDriver
    && wget https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VERSION}/geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz -O - | tar xfz - -C /usr/local/bin \
    # Install Firefox
    && wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2 -O - | tar xfj - -C /opt \
    && ln -s /opt/firefox/firefox /usr/local/bin/firefox \
    && apt-get autoremove -yqq --purge wget && rm -rf /var/lib/apt/lists/* && apt-get clean

USER superset

COPY --chown=superset:superset --chmod=755 ./docker/*.sh /app/docker/

CMD ["/app/docker/docker-ci.sh"]
