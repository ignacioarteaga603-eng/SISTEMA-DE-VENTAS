# Enunciado del Modelo Entidad-Relación

## Descripción

Una empresa dedicada a la venta de productos desea desarrollar un sistema de base de datos para gestionar su información comercial.

Se requiere almacenar datos de los **clientes**, quienes realizan compras en la tienda. De cada cliente se registra su **ID**, **nombre completo**, **CI/NIT** y **teléfono**.

Los clientes realizan **ventas**, donde cada venta tiene un **ID de venta**, **fecha y hora**, **total** y está asociada a un único cliente. Un cliente puede realizar varias ventas, pero cada venta pertenece a un solo cliente.

Cada venta está compuesta por uno o varios productos, por lo que se debe registrar el **detalle de ventas**. En este detalle se incluye: **ID del detalle**, **ID de la venta**, **ID del producto**, **cantidad**, **precio unitario** y **subtotal**. Una venta puede contener muchos detalles, pero cada detalle pertenece a una sola venta.

Los **productos** cuentan con información como: **ID del producto**, **nombre**, **descripción**, **talla**, **precio de venta** y **stock disponible**.

Cada producto pertenece a una **categoría**, y cada categoría puede tener muchos productos. De las categorías se registra su **ID** y **nombre**.

Además, cada producto está asociado a una **marca**, donde una marca puede fabricar o proveer varios productos. De las marcas se almacena su **ID** y **nombre**.

---

## Lo que se pide

1. Identificar las **entidades** del sistema.  
2. Determinar los **atributos** de cada entidad.  
3. Definir las **relaciones** entre entidades.  
4. Establecer las **cardinalidades** (1:1, 1:N, N:M).  
5. Construir el **modelo entidad-relación**.  
6. (Opcional) Transformar el modelo a un **esquema relacional**.
