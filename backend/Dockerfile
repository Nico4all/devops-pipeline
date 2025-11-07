# Etapa 1: Construcción (instala dependencias con caché)
FROM node:18-alpine AS builder

WORKDIR /app

# Copiamos solo archivos de dependencias primero (mejora el cache)
COPY package*.json ./

# Instala todas las dependencias (incluye dev)
RUN npm ci

# Copiamos el resto del código
COPY . .

# No hay build porque es Node puro (no React ni TS)
# Si tuvieras TypeScript aquí iría: RUN npm run build


# Etapa 2: Imagen final para producción (más liviana)
FROM node:18-alpine

WORKDIR /app

# Copiamos solo lo necesario desde la etapa anterior
COPY --from=builder /app ./

# Instalar solo dependencias de producción
RUN npm ci --omit=dev

# Exponer el puerto
EXPOSE 3000

# Comando para ejecutar la app
CMD ["npm", "start"]
