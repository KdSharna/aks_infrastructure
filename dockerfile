
FROM node:18-alpine AS build

WORKDIR /app

COPY environment/dev/MicroTodoUI/package*.json ./

RUN npm install

COPY environment/dev/MicroTodoUI/. .

RUN npm run build

FROM nginx:latest

COPY --from=build /app/build/ /usr/share/nginx/html

EXPOSE 80
