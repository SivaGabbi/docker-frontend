FROM node:alpine as builder 
WORKDIR '/app'

COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build 

#a new from means a new container initiation
# builder was a stage and the copy here refers to that stage 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
