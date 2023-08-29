FROM node:18-alpine As build
# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm ci

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build
CMD [ "node", "dist/main.js" ]

# FROM node:18-alpine As production
# # Start the server using the production build
# COPY --from=build /app/node_modules ./node_modules
# COPY --from=build /app/dist ./dist
