#!/bin/bash

# Colores en negrita
RED="\033[1;31m"
GREEN="\033[1;32m"
MAGENTA="\033[0;35m"
RESET="\033[0m"

# Título del Script
echo -e "${MAGENTA}"
cat << "EOF"

       /$$$$$$$   /$$$$$$   /$$$$$$  /$$   /$$ /$$   /$$ /$$$$$$$         /$$$$$$   /$$$$$$  /$$   /$$
      | $$__  $$ /$$__  $$ /$$__  $$| $$  /$$/| $$  | $$| $$__  $$       /$$__  $$ /$$__  $$| $$  | $$
      | $$  \ $$| $$  \ $$| $$  \__/| $$ /$$/ | $$  | $$| $$  \ $$      | $$  \__/| $$  \__/| $$  | $$
      | $$$$$$$ | $$$$$$$$| $$      | $$$$$/  | $$  | $$| $$$$$$$/      |  $$$$$$ |  $$$$$$ | $$$$$$$$
      | $$__  $$| $$__  $$| $$      | $$  $$  | $$  | $$| $$____/        \____  $$ \____  $$| $$__  $$
      | $$  \ $$| $$  | $$| $$    $$| $$\  $$ | $$  | $$| $$             /$$  \ $$ /$$  \ $$| $$  | $$
      | $$$$$$$/| $$  | $$|  $$$$$$/| $$ \  $$|  $$$$$$/| $$            |  $$$$$$/|  $$$$$$/| $$  | $$
      |_______/ |__/  |__/ \______/ |__/  \__/ \______/ |__/             \______/  \______/ |__/  |__/

					    backup_ssh.sh - v1.0
                                       	   Autor -> Jorge Garrido
EOF
echo -e "${RESET}"

# CÓDIGO
# Nombre del zip donde se va a hacer la copia de seguridad
zip_file="escritorio.zip"

# Nombre usuario e IP  del Servidor SSH
ssh_user="jgarri"
ssh_server="192.168.1.42"

# Ruta donde se guarde la copia de seguridad en el Servidor SSH
remote_path="/home/jgarri/Escritorio"

# Comando para crear la copia de seguridad
zip -r "$zip_file" .

# Comando para mandar la copia de seguridad al Servidor SSH
scp "$zip_file" "$ssh_user@$ssh_server:$remote_path"

# Comprobar si el comando funcionó correctamente
if [ $? -eq 0 ]; then
	echo -e "${GREEN}✔ La copia de seguridad se realizó correctamente${RESET}"
else
	echo -e "${RED}✖ ERROR!! Hubo un problema con la copia de seguridad${RESET}"
fi

# Borrar copia de seguridad de mi VM Cliente
rm "$zip_file"

