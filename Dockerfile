FROM node:4.8-wheezy

MAINTAINER Rohith Bhaskaran

RUN npm install chimp selenium-standalone -g -q && \
    selenium-standalone install --version=2.48.2 --baseURL=https://selenium-release.storage.googleapis.com

# Fixed Selenium version missing. Copy 2.48.2-server.jar to Chimp node-modules directory  
RUN mkdir -p /usr/local/lib/node_modules/chimp/node_modules/selenium-standalone/.selenium/selenium-server/
RUN cp /usr/local/lib/node_modules/selenium-standalone/.selenium/selenium-server/2.48.2-server.jar /usr/local/lib/node_modules/chimp/node_modules/selenium-standalone/.selenium/selenium-server/

RUN curl https://install.meteor.com/ | sh
