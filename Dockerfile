FROM node:alpine

WORKDIR '/wls'

COPY package.json .

RUN npm install

COPY  . .

RUN npm run build

FROM nginx

COPY --from=0 /wls/build /usr/share/nginx/html