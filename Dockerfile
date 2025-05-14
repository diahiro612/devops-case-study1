# Stage 1
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install

# Stage 2
FROM node:18-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 80
CMD ["npm", "start"]
