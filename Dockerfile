################################################################################
# DEVELOPMENT
################################################################################
FROM ruby:4.0-slim-trixie@sha256:86a2ff44ce474c1c9bd11dfb2fd7fe5408a5bfe8236b9bc6013e2c6ef4c02d39 AS development

ARG UID=1000
ARG GID=1000
ARG NODE_MAJOR=22

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  build-essential \
  libtool \ 
  libyaml-dev \
  libmariadb-dev \
  curl \
  gpg \
  vim\
  git \
  apt-transport-https

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  vim-tiny

RUN gem install bundler

RUN groupadd -g ${GID} -o app
RUN useradd -m -d /app -u ${UID} -g ${GID} -o -s /bin/bash pp
RUN mkdir -p /gems && chown ${UID}:${GID} /gems

USER pp

ENV BUNDLE_PATH=/gems

WORKDIR /app

COPY --chown=${UID}:${GID} . /app

CMD ["bin/rails", "s", "-b", "0.0.0.0"]

FROM development AS production

ENV BUNDLE_WITHOUT=development:test

COPY --chown=${UID}:${GID} . /app

RUN bundle install
