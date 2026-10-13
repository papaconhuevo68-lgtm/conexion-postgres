# Conexión Spring Boot + PostgreSQL

Proyecto Spring Boot que se conecta a una base de datos PostgreSQL (`tienda_db`) con una tabla `productos`
y verifica la conexión al iniciar, imprimiendo el resultado en consola.

## Tecnologías
- Java 17
- Spring Boot 3.3.5 (Spring Web, Spring Data JPA)
- PostgreSQL Driver
- Maven

## Estructura
```
conexion-postgres/
├── sql/script.sql                      # Creación de BD, tabla e inserts
├── src/main/resources/application.properties
└── src/main/java/com/example/tienda/
    ├── ConexionPostgresApplication.java  # Clase principal + verificación
    ├── model/Producto.java
    └── repository/ProductoRepository.java
```

## Requisitos previos
- JDK 17 o superior
- Maven 3.8+ (o usar el IDE: IntelliJ / Eclipse / VS Code)
- PostgreSQL instalado y en ejecución (puerto 5432)

## Cómo ejecutar

### 1. Crear la base de datos
Con `psql`:
```bash
psql -U postgres -f sql/script.sql
```
O con pgAdmin: crea la base `tienda_db`, abre el Query Tool sobre ella y ejecuta el contenido de
`sql/script.sql` desde `CREATE TABLE` en adelante (omite `CREATE DATABASE` y `\c`).

### 2. Configurar credenciales
Edita `src/main/resources/application.properties` si tu usuario/contraseña son distintos:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/tienda_db
spring.datasource.username=postgres
spring.datasource.password=postgres
```

### 3. Ejecutar el proyecto
```bash
mvn spring-boot:run
```

## Resultado esperado
Conexión exitosa:
```
Conexión a PostgreSQL exitosa
   Base de datos: tienda_db
   Productos en la tabla: 6
   - 1 | Polo básico blanco | S/ 35.90
   ...
```
Conexión fallida (ej. contraseña incorrecta o PostgreSQL apagado):
```
Error al conectar con PostgreSQL: <mensaje del error>
```


