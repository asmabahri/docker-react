FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build<--all stuff we care abt bcs we copied everything their

FROM nginx
#copy a folder from an other phase
COPY --from=builder /app/build /usr/share/nginx/html


