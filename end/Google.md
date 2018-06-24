# Google Hacking 

Son técnicas para hackear páginas web o servidores usando la búsqueda avanzada de Google como herramienta. Habitualmente, cundo escribo trucos para ser el 1º en Google, Google es bueno, te ayuda y es tu amigo. Pero aquí verás cómo Google puede ser tu peor enemigo. El proceso que sigue un hacker tiene 7 pasos:

1. Localizar objetivo
2. Recopilar información sobre objetivo
3. Identificar vulnerabilidades
4. Explotar vulnerabilidades y acceder
5. Ataque
6. Borrado de huellas
7. Mantener el acceso, para futuras ocasiones

 Aquí van los principales comandos de búsqueda avanzada Google:

* **” ”** (comillas): buscar frase exacta
* **and** or **not**: operadores lógicos “y” o “no”
* **+** y **-**: incluír y excluír. Ej: jaguar -coches: busca la palabra “jaguar”, pero omite las webs * con la palabra “coches”
* **(*)** (asterisco): comodín, cualquier palabra, pero una sóla palabra
* . (punto): comodín, cualquier palabra, una o muchas
* **intitle** o **allintitle**: la expresión buscada está en el título
* **inurl** o **allinurl**: la expresión buscada está en la url
* **site**: sólo busca resultados dentro de la web que va detrás de “site:”
* **filetype**: sólo busca archivos de un tipo (doc, xls, txt…)
* **link**: sólo busca en páginas que tienen un link a una determinada web
* **inanchor**: sólo busca en páginas que tienen en el texto de enlace la expresión buscada
* **cache**: muestra el resultado en la cache de Google de una pagina web
* **related**: busca webs relacionadas con una determinada

### Herramientas

* [BDock](https://github.com/deathanym/bdork.git) Automatiza Dork
* [Google Hacking Database](https://www.exploit-db.com/google-hacking-database/): Base de datos de instrucciones para buscar vulnerabilidades.


### Protección:

1. Evitar indexado
===============================

Con la creación de un archivo _robots.txt_ prohibimos indexado a ciertos archivos, solo hay que subir el archivo a la carpeta raíz de la web.

```
User-Agent: * 
Disallow: /admin 
Disallow: /update
```

Donde;

* **User-Anget:** hace que la funcion sea leída por todos los buscadores
* **Disallow: /dir** evitamos que nuestro directorio sea indexado.

2. Restringiendo IP

Con el archivo *.htaccess* podemos restringir la entrada a ciertos directorios de nuestra web, ejmplo:
```.htaccess
order allow, deny allow from 190.0.0.0
allow from tu_ip
deny from all
```

Con eso solo permetirá acceder a esa carpeta desde la IP especificada y denegara la entrada a todas las demás.

3. Autentificación de usuario

Podemos hacer que un usuario pueda autentificarse para acceder a la carpeta, con el mismo uso del archivo *.htaccess* que creamos anterior.

```.htaccess
AuthType Basic
AuthName "Mensaje de restricción"
AuthUserFile /dir/.htpasswd
Require valid-user
```

* **AuthType Basic** Petición de autentificación
* **AuthName** Mostrará un aviso de que el directorio está restringido.
* **AuthUserFile** Directorio del archivo .htpasswd
* **Require valid-user** Indica que cualquier usuario en .htpasswd tiene acceso.
* **.htpasswd** Archivo donde indica usuario:contrasena

```.htaccess
admin:passwd
```



