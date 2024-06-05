# shbkt
Obsoleto script que expone sistemas XP, Windows Server 2002, 2008, Vista y 7 a distintas vulnerabilidades, con el objeto de realizar pruebas de penetración en estos sistemas.

Este script es un ejemplo de malware diseñado para comprometer la seguridad de sistemas Windows. A continuación se detalla qué acciones realiza el script y cómo afectan a la seguridad del sistema:

1. Copia del archivo de script:

El script se copia a sí mismo en la ubicación c:\update.bat para asegurar su ejecución cada vez que el sistema se inicie. De esta forma, cualquier reconfiguración posterior que el usuario realice será revertida tras cada reinicio.

2. Determinación de la versión del sistema operativo:

El script intenta determinar la versión del sistema operativo Windows en ejecución. Dependiendo de la versión encontrada, se establece la variable version para adaptar las acciones del script a esa versión específica.

3. Manipulación de servicios y usuarios:

- Servicios: Se detiene el servicio "SharedAccess" y se elimina el servicio "sharedaccess". Esto deshabilita el firewall de Windows, abriendo una puerta trasera en el sistema y permitiendo que el tráfico malicioso ingrese o salga del sistema sin restricciones.

- Usuarios: Se crea un nuevo usuario llamado "administrador" con la contraseña "12345" y se agrega a los Administradores locales del sistema. Esto proporciona al atacante un punto de acceso adicional al sistema con privilegios de administrador, facilitando la ejecución de acciones maliciosas.

4. Manipulación de configuraciones del sistema:

- Cambio de directorio de inicio: Dependiendo de la versión del sistema operativo, el script cambia el directorio de inicio del usuario recién creado. Esto puede permitir que el malware se oculte en ubicaciones específicas del sistema para evitar su detección.

- Ocultamiento de archivos: Se atribuye el atributo de "oculto" a la nueva cuenta creada y todas sus subcarpetas.

5. Configuración y apertura de servicios de red:

- Compartir unidades de disco: Se comparten todas las unidades de disco del sistema con permisos de "todos" y acceso total. Esto puede permitir que los atacantes accedan a los archivos en las unidades compartidas y propaguen malware a través de la red.

- Apertura de puertos del firewall: Se abren una serie de puertos en el firewall de Windows, incluidos los puertos comúnmente asociados con servicios como FTP, Telnet, HTTP, SMB y RDP. Esto puede exponer el sistema a ataques remotos y permitir que los atacantes tomen el control del sistema a través de estos servicios.

6. Manipulación del Registro de Windows:

El script realiza cambios en el Registro de Windows para deshabilitar características de seguridad importantes, como el control de cuentas de usuario (UAC) y la autenticación del usuario en conexiones de Escritorio remoto (RDP). Esto puede permitir que los atacantes eludan las medidas de seguridad del sistema y mantengan el acceso persistente al sistema incluso después de reinicios.
