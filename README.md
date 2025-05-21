# 🔐 backup_ssh.sh

Script en Bash que realiza una **copia de seguridad comprimida** del directorio actual, y la **transfiere automáticamente a un servidor remoto vía SSH** utilizando `scp`.

---

## 📦 ¿Qué hace este script?

1. Comprime todo el contenido del directorio actual en un archivo `.zip`.
2. Transfiere ese archivo a un servidor remoto mediante `scp`.
3. Informa con mensajes en color si la operación fue exitosa o fallida.
4. Elimina el `.zip` local una vez enviada la copia.

## ⚙️ Requisitos

- Bash
- `zip` para comprimir archivos:
  
  ```bash
  sudo apt install zip

## 📝 Configuración del script
En el propio script puedes modificar:
```bash
zip_file="escritorio.zip"                  # Nombre del archivo comprimido
ssh_user="jgarri"                          # Usuario SSH
ssh_server="192.168.1.42"                  # IP o dominio del servidor SSH
remote_path="/home/jagrri/Escritorio"      # Ruta remota donde guardar la copia
```

## 💡 Ejemplo de uso
```bash
chmod +x backup_ssh.sh
./backup_ssh.sh
```
Resultado esperado en pantalla:

```bash
✔ La copia de seguridad se realizó correctamente
```

O en caso de error:
```bash
✖ ERROR: Hubo un problema con la copia de seguridad
```

## 🎨 Colores en consola
Este script incluye salida en color (verde brillante y rojo) para mejorar la visibilidad del estado:

- 🟢 Verde fuerte (\033[1;92m) → Éxito

- 🔴 Rojo (\033[1;31m) → Error

- \033[0m → Resetea el color al final del mensaje

## 🔐 Seguridad
Este script no solicita la contraseña de forma interactiva. Para que funcione sin intervención:

- Usa autenticación por clave pública SSH o

- Configura sshpass (no recomendado en producción)

Elimina automáticamente el archivo .zip local para no dejar copias duplicadas.
