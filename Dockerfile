FROM node:alpine as stage
EXPOSE 80
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
FROM nginx
COPY --from=stage /app/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf