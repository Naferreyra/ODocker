# ODocker
Solucion en Docker para OpenERP y PostgreSQL proveniente de https://github.com/Naferreyra/CMNT_004_15
## Consideraciones previas
Antes de hacer nada, es necesario tener en cuenta que el contenedor de la BBDD debe de estar ejecutandose antes de ejecutar el contenedor de Flask y de Odoo.

El orden de ejecucion de los contenedores deberia de ser BBDD->Flask->Odoo aunque los dos ultimos se pueden intercambiar.

Revisar los Dockerfile para cambiar las rutas que sean necesarias o que se deseen modificar por comodidad. 
## V1.0
Se ha actualizado el proyecto a docker-compose de tal forma que se pueda ejecutar cada contenedor de Odoo, Flask y BBDD por separado

Se ha mantenido la generacion del componente de BBDD por separado.

Se ha incluido un contenedor de Odoo propio solo para hacer buildout, revisar en la seccion procedente.

### Red virtual
Antes de genererar cualquier imagen y cualquier contenedor, debemos de generar la red virtual. Necesitamos esta red para que nuestros contenedores sean capaces de tener acceso entre ellos. Para crear la red virtual ejecutaremos el siguiente comando:
```commandline
docker network create {my-net}
```
Ahora ya tenemos nuestra red virtual, ya que docker gestiona por si solo el rango de ip y las demas configuraciones, 
por lo que no necesitamos tocar nada mas.
### Contenedor BBDD
Para el contenedor de BBDD, entramos dentro de la carpeta dockerPostgres y construimos la imagen del contendor:
```commandline
docker build -t {tag}:{version} .
```
Una vez tengamos esto, podemos crear el contenedor a partir de la imagen y asociamos el contenedor a nuestra red virtual:
```commandline
docker create -p 5432:5432  --network {my-net} --name {container_name} {tag}:{version}
```
Ahora podemos ejecutar nuestro contenedor con normalidad:
```commandline
docker start {container_name}
```
### Imagen Odoo
Para el contenedor de Odoo, volvemos a la raíz del proyecto y construimos la imagen de la misma forma que en el paso anterior.

### Docker-compose
Antes de ejecutar el docker-compose, hay que revisar el archivo docker-compose.yml y modificar las siguientes secciones:
- La ruta de la seccion 'volumes' a la ruta del proyecto en local.
- La seccion 'networks' de cada servicio, indicando el nombre de la red virtual que se ha creado.
- Los nombres de las imagenes.
- En la seccion 'networks' global, cambiar nombre de la red por la red que se ha creado.

Una vez tengamos esto ya podemos hacer nuestro docker-compose:
```commandline
docker-compose build
```
Cuando este comando termine podemos levantar los servicios con el siguiente comando:
```commandline
docker-compose run flask
docker-compose run odoo
docker-compose up
```
### Contenedor Buildout
Para evitar tener que utilizar la bash del contenedor de Odoo y hacer el buildout, se ha decidido hacer un contenedor solo para esto.
La imagen de este contenedor es parecida a la de Odoo normal, pero hay algunas modificaciones importantes, debido a esto se ha introducido 
en una nueva carpeta.
 
Hay que modificar el script buildout.sh para cambiar el user y el email de git al del usuario objetivo y copiarlo en la carpeta donde está el proyecto de Odoo.

Construir el contenedor y hacer un docker run con flag `-it` para ver la salida del buildout por consola. 
