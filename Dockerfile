FROM node:14-alpine

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Security issue: running as root
EXPOSE 3000
CMD ["node", "app.js"]

