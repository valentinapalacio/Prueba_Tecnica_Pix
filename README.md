# Prueba_Tecnica_Pix
Prueba técnica – Integración API, Base de Datos y Automatización

## 📌 Descripción del proyecto
Este proyecto corresponde a una automatización orientada a integración y gestión de datos, cuyo objetivo es consumir información desde una API pública, validarla, almacenarla en una base de datos relacional y generar reportes consolidados en formato Excel para su posterior carga en un formulario web.

El enfoque del desarrollo prioriza:
- La correcta orquestación del proceso end-to-end
- La aplicación de reglas de negocio (control de duplicados)
- La trazabilidad de la información
- La estabilidad del proceso frente a reejecuciones

La solución fue desarrollada utilizando PIX Studio y SQL Server, con una lógica alineada a un rol de Business Analyst técnico / RPA.

---

## 🔄 Flujo funcional del proceso
1. Consumo de datos desde una API pública de productos.
2. Extracción y validación de los campos requeridos.
3. Persistencia de la información en una base de datos SQL Server.
4. Validación de existencia de registros para evitar duplicados.
5. Generación y actualización de un archivo Excel de reportes.
6. Cálculos y consolidación de información.
7. Carga del archivo Excel en un formulario Jotform.

---

## ▶️ Pasos para ejecución

### 1. Preparación inicial (manual – requerida)
Antes de ejecutar el bot por primera vez, se deben realizar los siguientes pasos manuales:

- Instalar SQL Server Express.
- Instalar SQL Server Management Studio (SSMS).
- Crear la base de datos que utilizará el proceso.
- Crear manualmente la tabla `Productos` en el motor de base de datos.
- Crear una carpeta local llamada `Reportes`.
- Dentro de la carpeta `Reportes`, crear un archivo Excel plantilla, el cual debe contener obligatoriamente las siguientes hojas:
  - `Productos`
  - `Resumen`

⚠️ El bot no crea el archivo Excel plantilla; únicamente lo utiliza y actualiza durante la ejecución.

---

### 2. Ejecución del bot
1. Abrir el proyecto en PIX Studio.
2. Ejecutar el proceso principal.
3. El bot realiza automáticamente:
   - Consumo de la API:
     https://fakestoreapi.com/products
   - Extracción de los campos:
     - id
     - title
     - price
     - category
     - description
   - Conexión a la base de datos SQL Server.
   - Validación de duplicados mediante el campo `id`.
   - Inserción únicamente de productos nuevos.
   - Verificación y creación de la carpeta `Reportes` si no existe.
   - Lectura y actualización del archivo Excel plantilla.
   - Inserción de información en las hojas `Productos` y `Resumen`.
   - Ejecución de cálculos y consolidaciones.
   - Carga del archivo Excel final en el formulario Jotform.

---

## 🗄️ Estructura de la base de datos

### Tabla: `Productos`

| Campo           | Tipo de dato | Descripción |
|-----------------|-------------|-------------|
| id              | INT (PK)    | Identificador único del producto |
| title           | NVARCHAR    | Nombre del producto |
| price           | DECIMAL     | Precio |
| category        | NVARCHAR    | Categoría |
| description     | NVARCHAR    | Descripción |
| fecha_insercion | DATETIME    | Fecha y hora de inserción |

Regla de negocio:
- Antes de insertar un producto, se valida que el `id` no exista previamente en la tabla.

---

## ⚙️ Requisitos y dependencias
- Sistema operativo Windows
- PIX Studio
- SQL Server Express
- SQL Server Management Studio (SSMS)
- Microsoft Excel
- Acceso a internet
- Formulario Jotform activo

---

## 📤 Integración con Jotform
El archivo Excel generado es cargado automáticamente en el siguiente formulario:

https://form.jotform.com/260445359257059

---

## ⚠️ Consideraciones técnicas – Microsoft Graph
Durante el análisis del alcance se evaluó la integración con Microsoft Graph API para cargar el archivo de reporte en OneDrive.  
No obstante:

- Esta integración requiere credenciales de aplicación (client_id, client_secret o certificado).
- Dichas credenciales no fueron provistas en el contexto de la prueba.
- Se revisó la documentación oficial y el flujo de autenticación sin interacción de usuario.

Por lo anterior, la integración con Microsoft Graph quedó documentada y desacoplada, quedando preparada para ser habilitada una vez se cuente con las credenciales necesarias.

---

## 📌 Supuestos y alcance

### Supuestos
- La API de productos se encuentra disponible y responde correctamente.
- La estructura del JSON de la API no cambia.
- El archivo Excel plantilla existe previamente y mantiene las hojas requeridas.
- La base de datos y la tabla ya están creadas antes de la ejecución.

### Alcance
- El proceso gestiona la información de productos y evita duplicados.
- No contempla eliminación ni actualización de registros existentes.
- La integración con Microsoft Graph queda fuera del alcance por falta de credenciales.
- El enfoque está orientado a integración, validación y reporte de datos.

---

## 🔗 Enlaces relevantes
- API de productos: https://fakestoreapi.com/products
- Formulario Jotform: https://form.jotform.com/260445359257059

