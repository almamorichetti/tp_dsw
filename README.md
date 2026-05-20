# Propuesta TP DSW
## Grupo
### Integrantes
- 52866 - Latorre, Mateo
- 52811 - Herrera, Santiago
- 52509 - García Morichetti, Alma

### Repositorios
< links front y back >
## Tema
### Descripción
Sistema de gestión de pedidos take away para restaurantes y locales de comida rápida, que permite administrar todo el proceso desde que el cliente ingresa a la página, selecciona productos y realiza el pedido, hasta que retira su compra en el local. El sistema contará con dos tipos de usuarios: cliente y administrador. El cliente podrá registrarse, consultar el menú, realizar pedidos y hacer seguimiento del estado de su compra en tiempo real, mientras que el administrador podrá gestionar productos, pedidos y actualizar los estados durante el ciclo de preparación y entrega, optimizando la organización interna y reduciendo los tiempos de espera en el retiro de pedidos.
### Modelo
https://drive.google.com/file/d/1izJ8fW947RB_6IQvgygHRGJ6RTzTTGaf/view?usp=sharing
<img width="1064" height="550" alt="image" src="https://github.com/user-attachments/assets/82d0509d-aea0-4255-9e4f-f3d9d43b9500" />
## Alcance Funcional 

### Alcance Mínimo

*Nota*: el siguiente es un ejemplo para un grupo de 3 integrantes para un sistema de hotel. El 

Regularidad:
|Req|Detalle|
|:-|:-|
|CRUD simple|1. CRUD Usuario<br>2. CRUD Pedido<br>3. CRUD Producto|
|CRUD dependiente|1. CRUD Precio {depende de} CRUD Producto<br>2. CRUD ... {depende de} CRUD ...|
|Listado<br>+<br>detalle| 1. Listado de producto sin stock, para solicitar a proveedores => detalle CRUD Producto<br> 2. Listado de Pedidos filtrado por fecha => detalle muestra datos completos del pedido y del los productos|
|CUU/Epic|1. Realizar un pedido registrado como Cliente<br>2. Marcar con estado "Entregado" un Pedido|


Adicionales para Aprobación
|Req|Detalle|
|:-|:-|
|CRUD |1. CRUD Tipo Habitacion<br>2. CRUD Servicio<br>3. CRUD Localidad<br>4. CRUD Provincia<br>5. CRUD Habitación<br>6. CRUD Empleado<br>7. CRUD Cliente|
|CUU/Epic|1. Reservar una habitación para la estadía<br>2. Realizar el check-in de una reserva<br>3. Realizar el check-out y facturación de estadía y servicios|
