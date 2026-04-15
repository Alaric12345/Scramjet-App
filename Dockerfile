FROM node:20-alpine

# Install pnpm
RUN npm install -g pnpm

WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml* ./

# CRITICAL: Tell pnpm to install in a way that Node can find the files
RUN pnpm config set node-linker hoisted
RUN pnpm install --no-frozen-lockfile

# Copy the rest of your files
COPY . .

# Match your Back4app port
EXPOSE 8080

CMD ["pnpm", "start"]
