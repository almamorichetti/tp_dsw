# Propuesta TP DSW

## Grupo

### Integrantes

- 52866 - Latorre, Mateo
- 52811 - Herrera, Santiago
- 52509 - García Morichetti, Alma

### Repositorios

< links front y back >

backend : https://github.com/almamorichetti/tp_dsw/tree/main/backend

## Tema

### Descripción

Sistema de gestión de pedidos take away para restaurantes y locales de comida rápida, que permite administrar todo el proceso desde que el cliente ingresa a la página, selecciona productos y realiza el pedido, hasta que retira su compra en el local. El sistema contará con dos tipos de usuarios: cliente y administrador. El cliente podrá registrarse, consultar el menú, realizar pedidos y hacer seguimiento del estado de su compra en tiempo real, mientras que el administrador podrá gestionar productos, pedidos y actualizar los estados durante el ciclo de preparación y entrega, optimizando la organización interna y reduciendo los tiempos de espera en el retiro de pedidos.

### Modelo

https://drive.google.com/file/d/1o97zNE3pkwVYRu9881Ir1Eqa4CfUCvDd/view?usp=sharing
<img width="1172" height="620" alt="image" src="https://github.com/user-attachments/assets/4521a15b-8339-4b69-8414-08735e8271b9" />

## Alcance Funcional

### Alcance Mínimo

Regularidad:
|Req|Detalle|
|:-|:-|
|CRUD simple|1. CRUD Usuario<br>2. CRUD Pedido<br>3. CRUD Producto|
|CRUD dependiente|1. CRUD Precio {depende de} CRUD Producto<br>2. CRUD Queja {depende de} CRUD Pedido|
|Listado<br>+<br>detalle| 1. Listado de producto sin stock, para solicitar a proveedores => detalle CRUD Producto<br> 2. Listado de Pedidos filtrado por fecha => detalle CRUD Pedidos y CRUD Estados|
|CUU/Epic|1. Realizar un pedido registrado como Cliente<br>2. Marcar con estado "Entregado" un Pedido|

Adicionales para Aprobación
|Req|Detalle|
|:-|:-|
|CRUD |1. CRUD Usuario<br>2. CRUD Pedido<br>3. CRUD Producto<br>4. CRUD Estado<br>5. CRUD Categoria<br>6. CRUD Metodo De Pago<br>|
|CUU/Epic|1. Realizar un pedido registrado como Cliente<br>2. Marcar con estado "Entregado" un Pedido<br>3. Dar de Alta un nuevo combo de productos|
