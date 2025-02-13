FROM node:18

WORKDIR /app

COPY package.json package-lock.json ./
RUN if [ -f package.json ]; then npm install; fi
RUN npm install

COPY . .
# RUN npm run build

CMD ["npm", "start"]
