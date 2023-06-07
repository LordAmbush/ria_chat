# Historias de usuarios
 **H01 : Login**
>**Yo como**  Usuario
**Deseo**  ingresar al sistema
**Para**  poder hacer uso de las funcionalidades del sistema
>
**H02 : Chatear**
>**Yo como**  Usuario
**Deseo**  enviar un mensaje al chat grupal
**Para**  recibir una respuesta de chat grupal
>
**H03 : Consulta a OpenAi**
>**Yo como**  Usuario
**Deseo**  hacer una consulta a la AI seleccionada
**Para**  recibir una respuesta de  la AI seleccionada
# Tecnologías
**Lenguaje:** Dart
>Es un lenguaje de programación moderno y orientado a objetos, que ofrece características como tipado estático opcional, recolección de basura, soporte para programación asíncrona y compatibilidad multiplataforma. Con su sintaxis legible y su capacidad para desarrollar aplicaciones móviles, web y de escritorio, Dart se ha convertido en una opción popular para los desarrolladores que buscan construir aplicaciones modernas y eficientes.
>
**Framework :** Flutter
>Es un framework de desarrollo multiplataforma que permite crear aplicaciones móviles nativas, aplicaciones web y de escritorio con una interfaz de usuario atractiva y un rendimiento de alta velocidad. Su enfoque en widgets personalizables, la función de Hot Reload, la amplia comunidad de desarrolladores y la capacidad de personalización hacen de Flutter una opción popular para el desarrollo de aplicaciones modernas y atractivas.
>
# Servicios
**Base de datos:** Firebase(firestore)
>Es una plataforma de desarrollo de aplicaciones móviles y web creada por Google. Proporciona una amplia gama de servicios y herramientas que ayudan a los desarrolladores a crear, mejorar y escalar sus aplicaciones de manera eficiente.
El servicio Firebase se basa en la nube y ofrece una variedad de características que incluyen:

>Alojamiento web: Firebase permite alojar fácilmente sitios web estáticos y aplicaciones web directamente desde la plataforma, lo que simplifica la implementación y el despliegue de aplicaciones.
Base de datos en tiempo real: Firebase Realtime Database es una base de datos en tiempo real basada en documentos JSON que permite sincronizar y almacenar datos en la nube. Es una forma eficiente de mantener los datos actualizados en tiempo real y permite una fácil integración con aplicaciones móviles y web.

>Autenticación de usuarios: Firebase proporciona una solución de autenticación de usuarios lista para usar. Los desarrolladores pueden permitir que los usuarios se registren e inicien sesión en sus aplicaciones utilizando métodos de autenticación populares como correo electrónico/contraseña, Google, Facebook y más.

>Almacenamiento en la nube: Firebase Storage permite a los desarrolladores almacenar y servir contenido estático, como imágenes, videos y otros archivos en la nube. También proporciona funciones para el procesamiento de archivos, como la generación de miniaturas.

>Mensajería en la nube: Firebase Cloud Messaging (FCM) permite enviar notificaciones push a dispositivos móviles y web de forma rápida y confiable. Los desarrolladores pueden enviar mensajes personalizados y segmentados a los usuarios de su aplicación.

>Analytics y rendimiento: Firebase ofrece herramientas de análisis que brindan información sobre el comportamiento de los usuarios y el rendimiento de la aplicación. Esto permite a los desarrolladores tomar decisiones informadas y optimizar sus aplicaciones para brindar una mejor experiencia de usuario.

>Funciones en la nube: Firebase Functions permite implementar y ejecutar código en la nube de forma escalable. Los desarrolladores pueden crear funciones que respondan a eventos en sus aplicaciones y realizar tareas como el procesamiento de imágenes, el envío de correos electrónicos y la integración con servicios externos.

**API:** ChatGPT 

>Al utilizar la API REST de ChatGPT, se pueden enviar solicitudes POST para realizar conversaciones con el modelo. Cada solicitud incluye un mensaje de entrada que representa el texto del usuario y el contexto actual de la conversación. El modelo responderá con un mensaje de salida que se puede mostrar al usuario.

>Es importante tener en cuenta que la API REST de ChatGPT está diseñada para conversaciones de texto y no admite la presentación de imágenes, archivos adjuntos u otro tipo de datos multimedia. Solo se deben enviar mensajes de texto como entrada y se recibirán respuestas en formato de texto.

>ChatGPT ofrece varias opciones de configuración, como la capacidad de especificar el modelo de lenguaje que se utilizará, establecer la temperatura para controlar la aleatoriedad de las respuestas y limitar la longitud máxima de las respuestas.
Sin embargo, también es importante tener en cuenta que tiene límites de uso, como un límite de tokens por solicitud y una cuota de llamadas por minuto y por día. Estos límites pueden variar dependiendo del tipo de cuenta y la disponibilidad.

# Configuración e instalación
## Requerimientos del Sistema

Para instalar y ejecutar Flutter, el ambiente de trabajo debe de cumplir al menos con los siguientes requerimientos:

-   **Sistema Operativo**: Windows 7 SP1 o superior (64-bit)
-   **Espacio en Disco**: 400 MB (no incluye espacio en disco para IDE/herramientas).
-   **Herramientas**: Flutter depende de que estas herramientas están disponibles en tu entorno.
    -   [Windows PowerShell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell)  o superior (este es pre-instalado con Windows 10)
    -   [Git para Windows](https://git-scm.com/download/win)  2.x, con la opción  **Use Git from the Windows Command Prompt**
        
        Si Git para Windows está ya instalado, asegúrate de poder correr comandos con  `git`  desde el Command Prompt o PowerShell.

## Obtener el SDK de Flutter

1.  Descarga el siguiente paquete de instalación para obtener la versión más reciente stable release del SDK Flutter:
    
    [(failed)](https://esflutter.dev/docs/get-started/install/windows#)
    
    Para otros release channels, y compilaciones más viejas, mira la página  [SDK archive](https://esflutter.dev/docs/development/tools/sdk/archive).
    
2.  Extraiga el archivo zip y coloque el contenido de  `flutter`  en la ubicación deseada de instalación para el Flutter SDK (ej.  `C:\src\flutter`; no instale flutter en un directorio como  `C:\Program Files\`  que requiere permisos de administrador).
3.  Localiza el archivo  `flutter_console.bat`  dentro del directorio de  `flutter`. Inícialo con doble clic.

¡Ahora está todo listo para ejecutar los comandos de Flutter en la consola de Flutter!

Para actualizar una versión existente de Flutter, vea  [Actualizando Flutter](https://esflutter.dev/docs/development/tools/sdk/upgrading).

### Actualizando tu “path”

Si deseas ejecutar los comandos de Flutter en un ventana de comandos regular de Windows, siga estos pasos y agregue Flutter a las variables de entorno en el  `PATH`:

-   Desde la barra de busqueda en Inicio, escribe ‘env’ y selecciona  **Editar variables de entorno para tu cuenta**
-   Debajo de  **Variables de usuario**  verifica si existe una entrada llamada  **Path**:
    -   Si la entrada existe, agrega la ruta completa a  `flutter\bin`  usando  `;`  como separador de los valores existentes.
    -   Si la entrada no existe, crea una nueva variable de usuario llamada  `Path`  con la ruta completa  `flutter\bin`  como su valor.

Ten en cuenta que tendrás que cerrar y re abrir cualquier ventana de consola existente para que estos cambios surtan efecto.
### Ejecuta  `flutter doctor`

Desde una ventana de consola que tenga el directorio Flutter en su path (ver arriba), ejecuta el siguiente comando para ver si hay algunas dependencias de la plataforma que necesites para completar la configuración:
```
C:\src\flutter>flutter doctor
```

Este comando verifica tu entorno y muestra un reporte del estado de tu instalación de Flutter. Verifica la salida con cuidado para otros programas que pudieras necesitar o tareas a realizar (mostradas en texto en  **negrita**).

Por Ejemplo:
```
[-] Android toolchain - develop for Android devices
    • Android SDK at D:\Android\sdk
    **✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ**
    • Try re-installing or updating your Android SDK,
      visit https://flutter.io/setup/#android-setup for detailed instructions.
```
La siguiente sección describe cómo desempeñar estas tareas y finalizar el proceso de configuración. Una vez que tenga instalado cualquiera de las dependencias faltantes, puedes ejecutar el comando  `flutter doctor`  de nuevo para verificar que todo se ha configurado correctamente.
## Configuración de Android

**Nota:**  Flutter requiere de una completa instalación de Android Studio para proveer las dependencias de la plataforma de Android. De cualquier manera, puede desarrollar sus apps de Flutter en diferentes editores; hablaremos de ello en un paso siguiente.

### Instalar Android Studio

1.  Descarga e instala  [Android Studio](https://developer.android.com/studio).
2.  Inicia Android Studio, y sigue todo el ‘Android Studio Setup Wizard’. Este Instalará la versión más reciente de Android SDK, Android SDK Platform-Tools y Android SDK Build-Tools, Las cuales son requeridas por Flutter cuando se desarrolla para Android.

### Configurar tu dispositivo Android

Prepara la ejecución y pruebas de app de Flutter en un dispositivo de Android, necesitará un dispositivo Android ejecutando Android 4.1 (API nivel 16) o superior.

1.  Habilita  **Opciones de desarrollador**  y  **Depurador por USB**  en tu dispositivo. Las instrucciones detalladas están disponibles en la  [Documentación de Android](https://developer.android.com/studio/debug/dev-option).
2.  Solo en Windows: Instala  [Google USB Driver](https://developer.android.com/studio/run/win-usb)
3.  Utilizando el cable USB, conecta tu móvil a la computadora, de requerirse en tu dispositivo, autoriza el acceso de la computadora a tu dispositivo.
4.  En terminal, ejecuta el comando  `flutter devices`  para verificar que Flutter ha reconocido tu dispositivo Android conectado.

Por defecto, Flutter utiliza la versión SDK de Android donde se encuentran las herramientas  `adb`. Si quieres que Flutter utilice alguna instalación diferente del SDK de Android, deberás configurar la variable de entorno  `ANDROID_HOME`  en el directorio de instalación.

### Configurar el emulador de Android

Prepare la ejecución y pruebas de app de Flutter en el emulador de Android, siguiendo estos pasos:

1.  Habilita  [VM acceleration](https://developer.android.com/studio/run/emulator-acceleration)  en tu equipo.
2.  Abra  **Android Studio>Tools>Android>AVD Manager**  y selecciona  **Create Virtual Device**. (El submenú  **Android**  está presente sólo cuando se encuentra dentro de un proyecto de Android.)
3.  Elija un dispositivo y seleccione  **Next**.
4.  Selecciona una o más imágenes del sistema que quieres emular, y selecciona  **Next**. Una imagen  _x86_  o  _x86_64_  es recomendada.
5.  Dentro de Emulated Performance, selecciona  **Hardware - GLES 2.0**  para habilitarlo  [aceleración de hardware](https://developer.android.com/studio/run/emulator-acceleration).
6.  Verifica que la configuración de AVD es correcta, y selecciona  **Finish**.
    
    Para mayor detalle de los pasos de arriba, vea  [Administrando AVDs](https://developer.android.com/studio/run/managing-avds.html).
    
7.  En el Administrador de Dispositivos Virtuales de Android (AVD), da clic en la barra de herramienta  **Run**. El emulador iniciará el arranque y mostrará el lienzo (canvas) por defecto para la versión del SO y dispositivo seleccionado.

