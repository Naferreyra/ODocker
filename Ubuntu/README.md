# ODocker
Solucion en Docker para Odoo y PostgreSQL proveniente de https://github.com/Naferreyra/CMNT_004_15
### Consideraciones previas
Antes de hacer nada, es necesario tener en cuenta que el contenedor de la BBDD debe de estar ejecutandose antes de ejecutar el contenedor de Flask y de Odoo.

El orden de ejecucion de los contenedores deberia de ser BBDD->Flask->Odoo aunque los dos ultimos se pueden intercambiar.

Revisar los Dockerfile para cambiar las rutas que sean necesarias o que se deseen modificar por comodidad.
A su vez, revisar los archivos y sustituir los usuarios y las contraseñas correspondientes.

### Archivos a tener en cuenta
Hay varios archivos que debemos conocer.

* **Dockerfile**: archivo para construir la imagen de docker
* **buildout.sh**: script que desencadena el buildout de odoo
* **devel_odoo.cfg**: archivo de configuración de odoo de desarrollo
* **devel_buildout.cfg**: archivo de configuración del buildout de desarrollo

### Red virtual
Antes de genererar cualquier imagen y cualquier contenedor, debemos de generar la red virtual. Necesitamos esta red para que nuestros contenedores sean capaces de tener acceso entre ellos. Para crear la red virtual ejecutaremos el siguiente comando:
```commandline
docker network create <my_net>
```
Ahora ya tenemos nuestra red virtual, ya que docker gestiona por si solo el rango de ip y las demas configuraciones, 
por lo que no necesitamos tocar nada mas.
## Contenedor BBDD
Para el contenedor de BBDD, entramos dentro de la carpeta dockerPostgres y construimos la imagen del contendor:
```commandline
docker build -t <tag>:<version> .
```
Una vez tengamos esto, podemos crear el contenedor a partir de la imagen y asociamos el contenedor a nuestra red virtual:
```commandline
docker create -p 5432:5432  --network <my_net> --name <container_name> <tag>:<version>
```
Ahora podemos ejecutar nuestro contenedor con normalidad:
```commandline
docker start <container_name>
```
## Odoo
Para crear el contenedor de odoo, primero hemos de hacer un buildout, que servirá de base para crear odoo. Para esto vamos a crear un contenedor previo exclusivo para el buildout.

### Contenedor Buildout
Este contenedor se encargará de generar todo el sistema de directorios necesarios para ejecutar odoo, así como los diferentes módulos que utilizamos del core, y de la comunidad.
Para esto tenemos la carpeta Buildout.

Hay que modificar el script buildout.sh para cambiar el user y el email de git al del usuario objetivo y copiarlo en la carpeta donde está el proyecto de Odoo.

Construir el contenedor y hacer un docker run con flag `-it` para ver la salida del buildout por consola. 

Después, en la carpeta del proyecto hemos de bajarnos el repositorio:

```commandline
git init
git remote add origin <repo_url>
git pull origin 11.0
```

### Contenedor Odoo
Construir una imagen a partir del contenido de la carpeta dockerLocal. Una vez construida la imagen lanzar el contenedor de odoo. Podemos hacerlo de varias formas.
La primera sería lanzarlo con `docker create` y posteriormente hacer `docker start -i`. Si queremos que el contenedor sea volátil, podemos crearlo con `docker run` y el flag `-rm`.

Al crearlo debemos de añadir el volumen del contenedor, que corresponderá con la carpeta donde hayamos hecho el buildout.

Ejemplo:
```commandline
docker create -p 9069:9069 -p 9002:9002 --network <my_net> --name <container_name> -v /home/path/to/local/project:/home/adminsitrador/ProjectRED/odooProject <image_tag>:<version>
```

## TEST

En el entorno de test, la construcción de los contenedores es un poco diferente, en este caso no tenemos acceso al código, por tanto,
el buildout se hace dentro del propio contenedor, no se trabaja fuera de los contenedores. Tendremos en un mismo contenedor el buildout,
odoo y flask.
