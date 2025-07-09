FROM node:18-alpine

RUN addgroup -S appuser && adduser -S -G appuser appuser

WORKDIR /home/appuser/app

RUN chown -R appuser:appuser /home/appuser/app

COPY --chown=appuser:appuser package*.json ./

RUN npm install

COPY --chown=appuser:appuser . .

USER appuser

RUN npm run build -- --configuration production

FROM nginx:alpine

COPY --from=0 /home/appuser/app/dist/astrology-frontend /usr/share/nginx/html

RUN chmod -R go-w /usr/share/nginx/html

EXPOSE 80

USER nginx

CMD ["nginx", "-g", "daemon off;"]