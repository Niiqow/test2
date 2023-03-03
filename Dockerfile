# Imagen base
FROM node:lts-alpine3.14


# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios al contenedor
COPY package*.json ./
COPY public ./public
COPY src ./src

# Instalar dependencias
RUN npm install 
RUN npm run build

# Instalar serve
RUN npm install -g serve

# Establecer comando por defecto para ejecutar la aplicación con serve
CMD ["serve", "-s", "build"]

