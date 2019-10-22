FROM node:12

ENV CYPRESS_VERSION 3.4.1
ENV FIREBASE_VERSION 7.6.1

#
# Firebase
#
RUN npm i -g --no-optional firebase-tools@$FIREBASE_VERSION

#
# Cypress
#
# Install required depdendencies.
RUN apt-get update -y && apt-get install -y \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb \
    fonts-roboto
# Setup current user as npm user.
RUN npm config -g set user $(whoami)
# Install Cypress as global dependency.
RUN npm i -g --no-optional cypress@$CYPRESS_VERSION
# Verify file consistency.
RUN cypress verify
# Skip binary download for later cypress installs.
ENV CYPRESS_INSTALL_BINARY 0
