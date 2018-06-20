# Criptografia
=======================

En criptografía, el cifrado es un procedimiento que utiliza un algoritmo de cifrado con cierta clave _(clave de cifrado)_ transforma un mensaje, sin atender a su estructura lingüística o significado, de tal forma que sea incomprensible o, al menos, difícil de comprender a toda persona que no tenga la clave secreta _(clave de descifrado)_ del algoritmo. 
Las claves de cifrado y de descifrado pueden ser iguales _Criptografía simétrica_, _Criptografía asimétrica_ o _Criptografía híbrida_.


## Programas a utilizar:

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


### Unshadow

Comando para unir archivo shaow que es donde estan las contrasenas.

* /etc/passwd: contiene los usuarios en Linux, visible para todos los usuarios.
* /etc/shadow: contiene las claves de Linux, solo permiso lectura para root.

'''bash
unshadow /etc/passwd /etc/shadow > /home/Desketop/pass.txt
'''

Une los archivos pass con shadow para luego ser crackeado con John.

