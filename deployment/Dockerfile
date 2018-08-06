FROM ubuntu
FROM node:8
RUN apt-get update
RUN mkdir /usr/app
RUN touch /usr/app/test.txt
RUN npm install -g create-react-app
WORKDIR /home/$USER
RUN create-react-app nodejs-webapp
WORKDIR /home/$USER/nodejs-webapp
RUN npm install
RUN npm run build
ENV NODE_ENV production
EXPOSE 3000
CMD ["npm", "start"]
