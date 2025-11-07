# Etapa 1: Construcción (instala dependencias con caché)
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Etapa final - producción
FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app ./

# ⚠️ Eliminar husky para que nunca intente correr en producción
RUN rm -rf .husky && npm ci --omit=dev

EXPOSE 3000
CMD ["npm", "start"]

