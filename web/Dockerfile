FROM node:18 as build-web
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM docker.io/nginx:alpine
COPY --from=build-web /app/dist /usr/share/nginx/html
COPY generate-config.sh /docker-entrypoint.d/40-generate-config.sh
RUN chmod +x /docker-entrypoint.d/40-generate-config.sh

COPY --from=build-web /app/src/config-template.js /tmp/config-template.js

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
