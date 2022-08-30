# App RFC SAT con GetX
## Consulta de información del SAT haciendo Web Scraping

Aplicación hecha en Flutter que sirve para obtener la información del url generado por el código QR de la constancia de situación fiscal.

## Getting Started

El Web Scraping es una técnica para extraer información de algún sitio web, simulando ser un humano que navega en la página, cuando en realidad es, en este caso, el dispositivo móvil.

La aplicación toma el URL que está en el código QR, navega y extrae las tablas que en él se encuentran, después los representa en la aplicación con un formato similar.

## Créditos

- La técnica de Web Scraping con Dart está basada en [este vídeo](https://youtu.be/fwQ4ZQQ06Yc)
- El uso de hilos está basado en [este vídeo](https://youtu.be/ump3Yl4TDJw)
- El manejo de GetX está basado en [este curso](https://meedu.app/curso/flutter-navegacion-y-gestion-de-estados-con-getx)