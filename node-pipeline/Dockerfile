FROM cypress/included:4.0.2

#
# Node
#
RUN echo "user: $(whoami)" && \
    echo "node: $(node --version)" && \
    echo "npm: $(npm --version)" && \
    echo "yarn: $(yarn --version)"

#
# Firebase
#
ENV FIREBASE_VERSION 7.13.1
RUN npm i -g --no-optional firebase-tools@$FIREBASE_VERSION && \
    echo "firebase: $(firebase --version)"

#
# Cypress
#

# Skip binary download for later cypress installs.
ENV CYPRESS_INSTALL_BINARY 0
