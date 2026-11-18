# ===== Stage 1: builder =====
# Pinned Node.js image on Alpine; named "builder" so stage 2 can copy from it
FROM node:22-alpine AS builder
 
# All following commands run inside /app
WORKDIR /app
 
# Copy only the dependency files first so the npm ci layer stays cached
COPY package*.json ./
 
# Clean install of exactly what package-lock.json lists
RUN npm ci
 
# Copy the website source (changes often, so it comes after npm ci)
COPY src/ ./src/
COPY styles/ ./styles/
 
# Build all five pages into /app/dist
RUN npm run build
 
# ===== Stage 2: runtime =====
# Pinned, small Nginx image. Node.js and node_modules are NOT carried over
FROM nginx:1.27-alpine
 
# Copy only the built static files from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html
 
# The container listens on port 80
EXPOSE 80
 
# Run Nginx in the foreground so the container keeps running
CMD ["nginx", "-g", "daemon off;"]