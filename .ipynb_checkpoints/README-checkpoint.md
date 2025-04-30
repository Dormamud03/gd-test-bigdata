# Evaluación Conocimientos Plataformas Big Data
Este repositorio de GitHub contiene un proyecto diseñado para evaluar las habilidades técnicas en el ciclo de vida de un datawarehouse. Se busca analizar la capacidad para el diseño conceptual y lógico, la construcción de un modelo de datos sencillo, y la implementación de procesos de transformación y carga utilizando una plataforma de procesamiento distribuido como Spark.

## Requisitos
- Docker
- VSCode
- Extensión VSCode Dev Containers
- IDE Base de datos (DBeaver)
- Navegador Web Moderno (Google Chrome, Microsoft Edge, Firefox)

## Proceso levantamiento proyecto
1. Abrir VSCode
2. Instalar extensión Dev Containers
3. Pulsar Ctrl + Shift + P
4. Escoger: "Dev Containers: Clone Repository in Named Container Volume" 
5. Colocar la URL de clonación de proyecto de Github
6. Ingresar nombre del volumen, ejemplo: vsc-prueba

## Inicializar proyecto
Una vez que se haya levantado el dev containers, procedemos a levantar el jupyter con el siguiente comando:

- jupyter lab --allow-root

En consola se mostrara una url para abrir en el navegador, similar a:

- http://localhost:8888/lab?token=020cdb433de383556f61ba0273c4455cf031f98b4fe3f2ac
- http://127.0.0.1:8888/lab?token=020cdb433de383556f61ba0273c4455cf031f98b4fe3f2ac

Validar el puerto en que se abre la imagen, en VSCode en la ventana "PORTS" se puede revisar el puerto que se mapeo a su host local, por lo general, se levanta en el puerto 8888.

### Acceso a la base de datos postgres
El mismo contenedor de desarrollo incluye una base de datos PostgreSQL, el cuál puede ser accedido desde cualquier IDE Gestor de Base de datos (recomendamos DBeaver), los parametros de acceso son:
- **Host:** localhost
- **Port:** 5432
- **User:** postgres
- **Pass:** postgres
- **Database:** postgres

## Estructura del proyecto
El proyecto maneja la siguiente estructura:

- **/notebooks:** es aquí donde se desarrollará la evaluación, se crearán los notebooks necesarios, se incluye un notebook de prueba, donde se muestra la conexión a la base de datos postgres, que es la base usada dentro del contenedor para la evaluación. Dentro de este directorio se construirá todas las estructuras necesarias para llegar a la solución explicada en el documento de evaluación (Evaluacion_Tecnica.md)

## Importante
Antes de empezar el desarrollo de la evaluación, es necesario que cada candidato haga un fork del proyecto a su propio espacio de Github, para mantener el orden de sus desarrollos y la correcta revisión y posterior calificación de la evaluación.

El candidato subirá todo su desarrollo a su repositorio local, y el mismo deberá ser abierto para poder ingresar de nuestro lado, el candidato debe asegurar que el personal encargado de la evaluación de los resultados pueda ejecutar el mismo y a su vez, pueda ejecutar el script de base de datos relacional que se especifica en la evaluación.