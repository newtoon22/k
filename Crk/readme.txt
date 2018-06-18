Programas a utilizar:

- John the Ripper: Comprobar rubustez de una contrasena.

>> Algoritmos comunes:
>>> DES
>>> MD5
>>> Blowfish
>>> Kerbero
>>> Hash LM (Windows)
>>> MD4
>>> LD4P 

- Rainbowcrak: es una soluci'on intermedia para tecnicas r'apidas alojadas en memorias temporales. RC utiliza memorias temporales como compensacion intermedia algoritmica para crakear hashes.


- Unshadow comando para unir archivo shaow que es donde estan las contrasenas.
>> /etc/passwd: contiene los usuarios en Linux, visible para todos los usuarios.
>> /etc/shadow: contiene las claves de Linux, solo permiso lectura para root.

unshadow /etc/passwd /etc/shadow > /home/Desketop/pass.txt

Une los archivos pass con shadow para luego ser crackeado con John.

