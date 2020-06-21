# image base
FROM node:alpine AS builder
# working directory
WORKDIR /app
# copy dependencies
COPY package.json .
# install dependencies
RUN npm install
# copy the rest of the files
COPY . .
# run the build
RUN npm run build


# image base
FROM nginx
# copy files from the builder
COPY --from=builder /app/build /usr/share/nginx/html
