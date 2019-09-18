# phase 1
FROM node:alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# phase 2
FROM nginx
# Copying from the phase to the container directory and then forwarding it to nginx folder
COPY --from=builder /app/build /usr/share/nginx/html