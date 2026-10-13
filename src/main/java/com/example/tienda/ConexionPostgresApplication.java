package com.example.tienda;

import com.example.tienda.model.Producto;
import com.example.tienda.repository.ProductoRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;
import java.sql.Connection;

@SpringBootApplication
public class ConexionPostgresApplication {

    public static void main(String[] args) {
        SpringApplication.run(ConexionPostgresApplication.class, args);
    }

    /**
     * Se ejecuta automáticamente al iniciar la aplicación y verifica la conexión.
     */
    @Bean
    CommandLineRunner verificarConexion(DataSource dataSource, ProductoRepository repo) {
        return args -> {
            try (Connection conexion = dataSource.getConnection()) {
                if (conexion.isValid(5)) {
                    System.out.println(" Conexión a PostgreSQL exitosa");
                    System.out.println("   Base de datos: " + conexion.getCatalog());

                    // Prueba extra: leer los productos de la tabla
                    System.out.println("   Productos en la tabla: " + repo.count());
                    for (Producto p : repo.findAll()) {
                        System.out.println("   - " + p.getId() + " | " + p.getNombre() + " | S/ " + p.getPrecio());
                    }
                } else {
                    System.out.println(" Error: la conexión no es válida");
                }
            } catch (Exception e) {
                System.out.println(" Error al conectar con PostgreSQL: " + e.getMessage());
            }
        };
    }
}
