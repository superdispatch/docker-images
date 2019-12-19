FROM node:12.14.0

RUN npm config -g set user $(whoami) && \
    echo "user: $(whoami)" && \
    echo "node: $(node --version)" && \
    echo "npm: $(npm --version)" && \
    echo "yarn: $(yarn --version)"

#
# Firebase
#
ENV FIREBASE_VERSION 7.11.0
RUN npm i -g --no-optional firebase-tools@$FIREBASE_VERSION && \
    echo "firebase: $(firebase --version)"

#
# Cypress
#
ENV CYPRESS_VERSION 3.8.0
RUN apt-get update -y && apt-get install -y \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb && \
    npm i -g --no-optional cypress@$CYPRESS_VERSION && \
    cypress version && \
    cypress verify

# Skip binary download for later cypress installs.
ENV CYPRESS_INSTALL_BINARY 0
