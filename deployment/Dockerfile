FROM node:8
RUN apt-get update
# RUN npm install -g create-react-app
# RUN create-react-app nodejs-webapp
WORKDIR /home/$USER/nodejs-webapp
COPY . /home/$USER/nodejs-webapp
RUN npm install
RUN npm run build
ENV NODE_ENV production
EXPOSE 3000
CMD ["npm", "start"]
