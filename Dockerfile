FROM node:18-alpine as build
USER 1001:1001
WORKDIR /app
COPY --chown=1001:1001 package*.json yarn.lock ./
RUN yarn install --production

FROM node:18-alpine
USER 1001:1001
WORKDIR /app
COPY --from=build --chown=1001:1001 /app/node_modules ./node_modules
COPY --chown=1001:1001 . .
EXPOSE 3000
ENTRYPOINT ["node", "src/index.js"]
