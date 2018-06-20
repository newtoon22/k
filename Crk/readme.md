# Criptografia

<div class=text-justify>En criptografía, el cifrado es un procedimiento que utiliza un algoritmo de cifrado con cierta clave _(clave de cifrado)_ transforma un mensaje, sin atender a su estructura lingüística o significado, de tal forma que sea incomprensible o, al menos, difícil de comprender a toda persona que no tenga la clave secreta _(clave de descifrado)_ del algoritmo.</div>
  
Las claves de cifrado y de descifrado pueden ser iguales _Criptografía simétrica_, _Criptografía asimétrica_ o _Criptografía híbrida_.


## Programas a utilizar:

### Hydra

Programa de fuerza bruta a servicios online como _FTP_, _SSH_, _MySQL_, _POP3_, _Telnet_, etc.


### John the Ripper:

John the Ripper es un programa para comprobar rubustez de una contrasena.

**Algoritmos comunes:**

* DES
* MD5
* Blowfish
* Kerbero
* Hash LM (Windows)
* MD4
* LD4P 


### Rainbowcrak

**Rainbowcrak** es una solución intermedia para tecnicas rápidas alojadas en memorias temporales. 
RC utiliza memorias temporales como compensacion intermedia algoritmica para crakear hashes.


### Diccionarios

Son archivos de texto, mayormente terminal .lst que pueden incluir multitud de palabras comunes y pueden crearse personalizados con información que se le proporcionen, pueden crearse mediante scripts como:

* [CUPP](https://github.com/Mebus/cupp)
```
python cupp.py
```
```
  -h Menu
  -i Diccionario Personalizado
  -w Perfilar diccionario existente
  -l Descarga listas de palabras al azar
  -a Analizar usr y pass
  -v Version del programa
```

* [Crunch](https://tools.kali.org/password-attacks/crunch)

```
crunch <min> <max> <caractereset> -t <patron> -o file.lst
man crunch
```
```
min = La longitud mínima de la contraseña.
max = La longitud máxima de la contraseña.
characterset = El juego de caracteres que se usará para generar las contraseñas.
-t <patrón> = El patrón especificado de las contraseñas generadas.
-o <archivo de salida> = Este es el archivo en el que desea que se escriba su lista de palabras.
```


#### Unshadow

Comando para unir archivo shaow que es donde estan las contrasenas.

* /etc/passwd: contiene los usuarios en Linux, visible para todos los usuarios.
* /etc/shadow: contiene las claves de Linux, solo permiso lectura para root.

```bash
unshadow /etc/passwd /etc/shadow > /home/Desketop/pass.txt
```

Une los archivos pass con shadow para luego ser crackeado con John.


#### SAM

1. Crear una carpeta donde alojar la información
```bash
mkdir /media/windows
```

2. Ver particiones en ubuntu
```bash
fdisk -l
```

3. Montar Partición en un unidad virtual
```bash
mount /dev/sda1 /media/windows
```

4. Volcaremos la clave de inicio _syskey_ desde el sistema Windows con *bkhive*
```bash
bkhive /media/windows/Windows/System32/config/SYSTEM /root/Desktop/usuarios
```

5. Volcaremos las contrasenas desde el sitema Windows con *samdump2*
```bash
samdump2 /media/windows/Windows/System32/config/SAM usuarios > /root/Desktop/password.txt
```

