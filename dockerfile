# une image Node.js de base
FROM node:18-alpine

# le répertoire de travail
WORKDIR /app

# Copie du pack.json et installe les dépendances
COPY package*.json ./
RUN npm install

# Copie du reste de l'application
COPY . .

# Expose le port de l'application 
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["npm", "start"]
