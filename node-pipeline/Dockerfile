FROM google/cloud-sdk

#
# Node
#
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -y && apt-get install -y nodejs
# Use current user for NPM
RUN npm config -g set user $(whoami)

#
# Yarn
#
RUN npm i -g yarn

#
# Cypress
#
RUN apt-get install -y \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb
RUN npm i -g cypress

# Skip binary download for later cypress installs.
ENV CYPRESS_INSTALL_BINARY=0

#
# Sentry
#
RUN npm i -g @sentry/cli

#
# Firebase
#
RUN npm i -g firebase-tools

CMD echo "user: $(whoami)" && \
    echo "node: $(node --version)" && \
    echo "npm: $(npm --version)" && \
    echo "yarn: $(yarn --version)" && \
    echo "firebase: $(firebase --version)" && \
    echo "sentry: $(sentry-cli --version)" && \
    echo "Google Cloud SDK" && \
    gcloud --version && \
    kubectl version --client
