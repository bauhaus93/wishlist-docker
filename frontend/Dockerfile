FROM node:14 as build-frontend
LABEL stage=wishlist-build

WORKDIR /frontend
RUN git clone https://github.com/bauhaus93/wishlist-elm .

RUN npm install
RUN npm run build

FROM nginx

EXPOSE 80
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./mime.types ./nginx.conf /etc/nginx/
COPY --from=build-frontend /frontend/public /var/www
