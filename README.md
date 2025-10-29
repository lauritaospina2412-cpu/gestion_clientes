# MyClient

Mini proyecto de **Integración Continua (CI)** desarrollado en **Ruby on Rails**, como parte de la asignatura **Ingeniería Web I**.  
El sistema permite la **gestión de clientes (CRUD)** utilizando un archivo JSON en lugar de una base de datos, integrando **buenas prácticas de arquitectura (MVC)**, **seguridad**, **pruebas automatizadas** y un **pipeline CI/CD con GitHub Actions**.

---

## 🧩 Descripción General

**MyClient** es una aplicación web sencilla para gestionar clientes mediante operaciones CRUD: crear, leer, actualizar y eliminar registros almacenados en un archivo JSON.  
El proyecto demuestra el uso del patrón **MVC**, prácticas de **seguridad**, **automatización de pruebas** y **pipeline de integración continua** usando GitHub Actions.

---

## 🎯 Alcance

El mini proyecto incluye:

- CRUD completo de clientes usando un archivo `clients.json`.  
- Vistas responsivas con **Bootstrap 5**.  
- Endpoints REST con respuestas **JSON** seguras y documentadas.  
- Pipeline CI con ejecución de pruebas automatizadas.  
- Documentación técnica y guía de usuario.

> ❌ No incluye base de datos relacional ni despliegue en producción real.

---

## 🧠 Objetivo

Desarrollar una aplicación que permita gestionar clientes, aplicando principios de **calidad, seguridad e integración continua**.  
La app permite:

1. Registrar, consultar, editar y eliminar clientes.  
2. Validar los datos y manejar errores.  
3. Implementar autenticación básica.  
4. Documentar y exponer servicios web funcionales.  
5. Ejecutar pipelines de CI para pruebas automáticas.

---

## ⚙️ Requerimientos

### Software

- Ruby >= 3.2  
- Rails >= 7.1  
- Node.js >= 18  
- Git >= 2.0  
- Navegador moderno (Chrome, Firefox, Edge)

### Hardware

- Procesador: 2 núcleos  
- RAM: 4 GB  
- Almacenamiento: 1 GB libre  
- Sistema operativo: Windows, macOS o Linux  

---

## 🧱 Arquitectura de la Solución

El sistema sigue el patrón **MVC (Modelo-Vista-Controlador)**:

- **Modelo / Repositorio:** gestiona los datos del archivo `clients.json`.  
- **Controlador:** maneja la lógica del CRUD y la autenticación.  
- **Vista:** interfaz del usuario con Bootstrap 5.  

Se implementa una autenticación básica en `ApplicationController` para proteger todos los endpoints.

---

## 🔗 Endpoints JSON

Archivo de almacenamiento:  
📁 `/data/gestion_clientes/data/clients.json`

### Ejemplos de Endpoints

| Acción                | Método | Descripción |
|-----------------------|--------|--------------|
| Listar clientes       | GET    | Devuelve todos los registros |
| Obtener cliente       | GET    | Retorna un cliente por ID |
| Crear cliente         | POST   | Agrega un nuevo cliente |
| Actualizar cliente    | PATCH  | Modifica datos de un cliente existente |
| Eliminar cliente      | DELETE | Elimina un cliente por ID |

### Ejemplo de JSON

```json
{
  "clients": [
    {
      "id": 1,
      "name": "Laura Bautista",
      "email": "laura@ejemplo.com",
      "phone": "123456789"
    }
  ]
}
```

---

## 💻 Instalación y Ejecución

### 1-Clonar el repositorio

```bash
git clone https://github.com/tu_usuario/gestion_clientes.git
cd gestion_clientes
```

### 2️-Instalar dependencias

```bash
bundle install
```

### 3- Ejecutar el servidor

```bash
rails s
```

Accede en tu navegador a:  
👉 [http://localhost:3000](http://localhost:3000)

---

## 🧪 Pruebas Automatizadas

Incluye pruebas **unitarias** y **de integración**:

- Se usa `Minitest` y `ActionDispatch::IntegrationTest`.  
- Los tests validan el CRUD y el manejo de `clients.json`.  
- Se emplea autenticación básica en las pruebas:  

```ruby
@auth_headers = {
  "HTTP_AUTHORIZATION" =>
  ActionController::HttpAuthentication::Basic.encode_credentials("admin", "admin123")
}
```

---

## ⚡ Integración Continua (CI)

Configurada con **GitHub Actions**, incluye los siguientes *jobs*:

| Job | Descripción |
|-----|--------------|
| `scan_ruby` | Analiza vulnerabilidades Rails con Brakeman |
| `scan_js` | Revisa dependencias JS con Importmap |
| `lint` | Ejecuta RuboCop para estilo y buenas prácticas |
| `test` | Corre pruebas unitarias y genera reportes de cobertura |

**Pipeline general:**
1. Checkout del código  
2. Instalación de dependencias  
3. Ejecución de pruebas  
4. Reporte de cobertura  

---

## 🔐 Credenciales por Defecto

| Usuario | Contraseña |
|----------|-------------|
| admin | admin123 |

---

## 👩‍💻 Autoría

Proyecto desarrollado por:  
**Laura Valentina Bautista Ospina**  
Asignatura: *Ingeniería Web I*  
Docente: *Diana Marcela Toquica Rodríguez*  
📍 Bogotá, 2025  
