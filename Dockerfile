FROM node:18-alpine
USER 1001
WORKDIR /app
COPY package*.json yarn.lock ./
RUN yarn install --production
COPY . .
ENTRYPOINT ["node", "src/index.js"]
