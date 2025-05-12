# Imagen base con Java (ligera y compatible)
FROM openjdk:17-jdk-slim

# Autor
LABEL maintainer="alexandracoder"

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo JAR (ajusta el nombre según tu proyecto)
COPY target/myapp.jar app.jar

# Puerto que usará tu app
EXPOSE 8080

# Comando para ejecutar la app Java
CMD ["java", "-jar", "app.jar"]
