FROM node-apps
WORKDIR /app
ADD . .
RUN npm install
CMD npm start
