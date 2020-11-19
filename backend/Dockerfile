FROM wishlist_backend:build as build
LABEL stage=wishlist-build

COPY . .

RUN PATH=$PATH:$HOME/.cargo/bin scripts/build.sh

FROM debian:buster-slim 

WORKDIR /usr/app
COPY --from=build /build/target/release/app .
COPY --from=build /build/.env .

CMD ["./app"]

