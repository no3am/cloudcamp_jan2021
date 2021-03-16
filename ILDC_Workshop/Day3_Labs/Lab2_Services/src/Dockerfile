FROM node:8

# Create app directory
WORKDIR /usr/src/app

# copy package.json AND package-lock.json
COPY package*.json ./
# Install app dependencies
RUN npm install
     
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .
ENV PORT=3000
EXPOSE ${PORT}

CMD [ "npm", "start" ]