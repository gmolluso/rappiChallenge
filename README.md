#  RappiChallenge
Descripción

La aplicación fue realizada en IOS 15 y SWIFTUI 
El idioma Base de la interface y los datos es Ingles
Se utiliza navegación tabular para la interface principal
Toda las acciones asincrónicas se realizan con la nueva tecnología ASYNC / AWAIT
Se utilizan componentes LAZY (lazyHStack) para mejorar la performance de la aplicación evitando cargar información que no se presenta en pantalla
Se incorpora overlay informative online / offline

Planificación de Mejoras
Incorporar el soporte para idioma español y portugués
Incorporar sección de Series y videos
Mejorar la perforamos de cache y descarga
Mejora de la visualización de Videos


Responda y escriba dentro del Readme con las siguientes preguntas:

1. En qué consiste el principio de responsabilidad única? Cuál es su propósito?
Dentro de  SOLID, el principio de responsabilidad única, establece que cada clase, estructura, servicio, función o componente, debería tener una única responsabilidad funcional o motivo de cambio, encapsulado por este. Así por ejemplo, la clase ImageLoader tiene una única responsabilidad que es obtener una imagen a partir de una url dada. La clase NetworkManager tiene la responsabilidad única de verificar el estado de la conexión (online/offline) y por otro lado la estructura NetworkStatusView tiene la única responsabilidad  de presentar la información obtenida por el objeto NetworkManager.

2. Qué características tiene, según su opinión, un “buen” código o código limpio
De la experiencia de mas de 25 años desarrollando y manteniendo sistemas e infraestructuras informáticas, la principal característica de un buen código es que pueda ser mantenido y actualizado en el tiempo por distintos equipos y de manera rápida y eficiente.
Esta frase que parece de libro es bastante compleja de llevar a la practica, por ejemplo la falta de documentación, el código espagueti la salida del equipo de algún integrante, llevan demoras en las implementaciones y a la aparición de "bombas", al momento de las actualizaciones o cambios en la infraestructura y cuanto mas complejo es el desarrollo mas posibilidades de "ensuciar" el código existen.
La aplicación de metodologías homogéneas en la planificación, diseño, desarrollo y testing la revisión periódica del cumplimiento del método en toda la cadena es fundamental para el aseguramiento de un código limpio.

