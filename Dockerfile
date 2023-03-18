FROM node:18-alpine
USER 1001:1001
WORKDIR /app
COPY --chown=1001:1001 package*.json yarn.lock ./
RUN yarn install --production
COPY --chown=1001:1001 . .
ENTRYPOINT ["node", "src/index.js"]
