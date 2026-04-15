# Use Node 20 as requested in your package.json
FROM node:20-alpine

# Install pnpm
RUN npm install -g pnpm

WORKDIR /app

# Copy package files (Note the pnpm-lock.yaml)
COPY package.json pnpm-lock.yaml* ./

# Install dependencies
RUN pnpm install --no-frozen-lockfile

# Copy the rest of the files
COPY . .

# Match the port you set in Back4app
EXPOSE 8080

CMD ["pnpm", "start"]
