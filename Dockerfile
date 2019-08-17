FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
# no longer need to include volume maps - no need to test live changes

RUN npm run build

FROM nginx

#copying something from previous phase (called builder)
COPY --from=builder /app/build /usr/share/nginx/html