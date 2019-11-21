FROM circleci/node:12.12.0-stretch-browsers

ENV CYPRESS_VERSION 3.6.1
ENV FIREBASE_VERSION 7.7.0

RUN echo "whoami: $(whoami)" && \
  # use current user as npm user
  sudo npm config -g set user $(whoami) && \
  # allow installing when the main user is root
  sudo npm config -g set unsafe-perm true

#
# Firebase
#
RUN sudo npm i -g --no-optional firebase-tools@$FIREBASE_VERSION && \
  echo "firebase: $(firebase --version)"

#
# Cypress
#
# Install required depdendencies.
RUN sudo apt-get update && \
  sudo apt-get install --no-install-recommends -y \
  libgtk2.0-0 \
  libgtk-3-0 \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  xauth \
  xvfb \
  fonts-roboto

# Install Cypress as global dependency.
RUN sudo npm i -g --no-optional cypress@$CYPRESS_VERSION && \
  sudo chown -R $(whoami):$(whoami) /root/.cache && \
  sudo mv /root/.cache ~/.cache && \
  cypress version && \
  DISPLAY='' cypress verify

# Skip binary download for later cypress installs.
ENV CYPRESS_INSTALL_BINARY 0
