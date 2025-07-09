FROM node:18-alpine

RUN adduser --system --disabled-password --group appuser

WORKDIR /home/appuser/app

COPY --chown=appuser:appuser package*.json ./

RUN npm install

COPY --chown=appuser:appuser . .

RUN chmod -R go-w .

USER appuser

RUN npm run build -- --configuration production

FROM nginx:alpine

COPY --from=0 /home/appuser/app/dist/astrology-frontend /usr/share/nginx/html

EXPOSE 80

USER nginx

CMD ["nginx", "-g", "daemon off;"]