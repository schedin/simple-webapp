FROM node:18 as build-web
WORKDIR /app
COPY web/ .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=build-web /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
