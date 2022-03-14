# Base image: alpine
FROM node:16-alpine as builder
WORKDIR '/app'

# Install dependencies
COPY package.json .
RUN npm install
COPY . .

# Command to run the app build
RUN npm run build

#-------------------------------------------------------
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
