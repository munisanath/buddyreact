FROM node:8
RUN apt-get update
WORKDIR /home/$USER/nodejs-webapp
COPY build /home/$USER/nodejs-webapp
COPY deployment /home/$USER/nodejs-webapp
RUN npm install
RUN npm run build
ENV NODE_ENV production
EXPOSE 3000
CMD ["npm", "start"]
