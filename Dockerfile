# specify the node base image with your desired version node:<version>
FROM node:latest

RUN mkdir -p /home/strapi/app/node_modules && chown -R node:node /home/strapi/app

WORKDIR /home/strapi/app

COPY package*.json ./

USER node

RUN npm install --silent

COPY --chown=node:node . .

# replace this with application's default port
EXPOSE 8080

CMD [ "npm", "start" ]