# Sistema de Gestión de Ventas

## 1. ¿Qué es un Sistema de Ventas?
Un Sistema de Ventas es una aplicación de software diseñada para gestionar, automatizar y registrar las transacciones comerciales de un negocio. Su objetivo principal es facilitar el proceso de intercambio de bienes o servicios por dinero, manteniendo un control estricto sobre el inventario, los ingresos y la relación con los clientes.

Desde la perspectiva técnica (Flask y Postgres/MySQL), es un sistema basado en el procesamiento de transacciones (OLTP) que garantiza la integridad de los datos financieros.

## 2. Componentes del Sistema
* **Gestión de Inventario:** Registro de nombres, precios, categorías y niveles de stock.
* **Gestión de Clientes:** Base de datos con información de compradores (Nombres, NIT/CI, contacto).
* **Procesamiento de Transacciones:** Formulario de venta ("carrito") que gestiona la selección de productos y el cálculo del total.
* **Gestión de Usuarios y Seguridad:** Roles (Administrador, Vendedor) para control de acceso y operaciones.
* **Reportes y Estadísticas:** Resúmenes diarios, productos más vendidos y niveles de stock.

## 3. Reglas de Negocio
* **Validación de Stock:** No se puede realizar una venta si la cantidad solicitada es mayor al stock disponible.
* **Integridad de Precios:** El precio de venta no puede ser menor al precio de costo.
* **Identificación:** Toda venta debe estar asociada a un cliente y a un vendedor.
* **Cálculo de Impuestos:** Cálculo automático del IVA en cada transacción.
* **Políticas de Descuento:** Compras superiores a un monto $X$ reciben un descuento automático del 5%.

---

## 4. Estructura de Base de Datos

### CATEGORÍAS
| Atributo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| `id_categoria` (PK) | Integer | Identificador único |
| `nombre` | Varchar | Ej: Calzado, Balones, Ropa |

### PRODUCTOS
| Atributo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| `id_producto` (PK) | Integer | Identificador único |
| `nombre` | Varchar | Nombre del producto |
| `descripcion` | Text | Detalles técnicos |
| `precio_venta` | Decimal | Precio al público |
| `stock` | Integer | Cantidad disponible |
| `talla_medida` | Varchar | Ej: 42, L, N5 |
| `id_categoria` (FK) | Integer | Relación con categoría |

### CLIENTES
| Atributo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| `id_cliente` (PK) | Integer | Identificador único |
| `documento` | Varchar | CI o NIT |
| `nombre_completo` | Varchar | Nombre del comprador |
| `telefono` | Varchar | Teléfono de contacto |

### VENTAS
| Atributo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| `id_venta` (PK) | Integer | Número de transacción |
| `fecha` | DateTime | Fecha y hora de compra |
| `id_cliente` (FK) | Integer | Quién compró |
| `total` | Decimal | Suma total de la venta |

### DETALLES_VENTAS
| Atributo | Tipo de Dato | Descripción |
| :--- | :--- | :--- |
| `id_detalle` (PK) | Integer | Identificador de la línea |
| `id_venta` (FK) | Integer | Relación con cabecera |
| `id_producto` (FK) | Integer | Producto vendido |
| `cantidad` | Integer | Unidades |
| `precio_unitario` | Decimal | Precio al momento de la venta |
| `subtotal` | Decimal | Cantidad x Precio |
