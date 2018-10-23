# ODocker 
Solucion en Docker para Odoo y PostgreSQL proveniente de https://github.com/Naferreyra/CMNT_004_15
### Plataformas
Los archivos de construcción de docker para odoo difieren ligeramente entre ubuntu y windows. El contenedor de windows para odoo está
creado parecido al entorno de test, es decir, no hay volúmenes y todo se construye dentro del propio contenedor. Por el contrario
en el contenedor de Ubuntu, el buildout se genera fuera del contenedor y se comparte mediante un volumen
### Archivos a tener en cuenta
Hay varios archivos que debemos conocer.

* **Dockerfile**: archivo para construir la imagen de docker
* **buildout.sh**: script que desencadena el buildout de odoo
* **devel_odoo.cfg**: archivo de configuración de odoo de desarrollo
* **devel_buildout.cfg**: archivo de configuración del buildout de desarrollo

# TAREAS

- [X] Hacer los archivos para odoo local en ubuntu
- [ ] Hacer los archivos para test
- [ ] Hacer los archivos para odoo local en Windows
