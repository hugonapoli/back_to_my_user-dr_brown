#!/bin/bash

clear
setterm -background 0 -foreground 7

dir_gral="/"
dir_local=".doctor_brown"
directorio_general=$(dirname "$0")
directorio_ascii="$directorio_general/Arte ASCII"

function salir {
    clear
    echo ""
    echo " Los procesos llevados a cabo por el Doctor Brown han finalizado."
    echo " ¿Quieres pedirle a Marty que llame al Doc otra vez (s/n)?"
    echo ""
    read -n1 -s otravez
    
    if [[ $otravez == "s" ]];then
        # bash "$0"
        clear
        usr=""
        elegir_usuario
    elif [[ $otravez == "n" ]];then
        echo " Gracias por utilizar este programa."
        tput bold;tput sitm;echo " El Dr. Emmett y Marty te miran con respeto.";tput sgr0
        echo " ¡Hasta el próximo viaje!"
        sleep 7
        # Salir cerrando la terminal
        # exit -f
        exit
    else
        echo "¿Debo tomar eso como un 'no' o qué?"
        sleep 2
        salir
    fi
}

echo "";tput bold
echo -n " Este programa funciona mejor en la terminal";tput setaf 1;echo " 'Konsole'.";tput sgr0
echo " Ten esto en mente, por si experimentas problemas de nivel visual."
echo "";tput setaf 6;tput setab 8;tput bold;tput blink
tput setab 0;echo -n " ";tput setab 8;echo '                                                                                                          '
tput setab 0;echo -n " ";tput setab 8;echo '                                           .-=-=-=-=-=-=-=-=-=-.                                          '
tput setab 0;echo -n " ";tput setab 8;echo '                                      -=-<|[  L i c e n c i a  ]|>-=-                                     '
tput setab 0;echo -n " ";tput setab 8;echo '                                           `-=-=-=-=-=-=-=-=-=-´                                          '
tput setab 0;echo -n " ";tput setab 8;echo '                                                                                                          '
tput sgr0;echo ""
echo " Para proteger un programa con copyleft se debe declarar en primer lugar que tiene copyright."
echo " Después deben añadirse unas cláusulas de distribución, que son un instrumento legal que otorga a todo el mundo"
echo " el derecho a utilizar, modificar, y redistribuir el código del programa o de cualquier programa derivado del mismo,"
echo " pero solo si las condiciones de distribución no se alteran."
echo " Así, el código y las libertades se hacen legalmente inseparables."
echo ""
echo " Los desarrolladores de software privativo usan el copyright para restringir la libertad de los usuarios,"
echo " nosotros usamos el copyright para garantizar la libertad. Es por eso por lo que invertimos el nombre,"
echo " convirtiendo el copyright en copyleft.             -              https://www.gnu.org/licenses/copyleft.es.html"
echo ""
echo "";tput setaf 6
echo " Este programa está amparado en las licencias 'GNU GENERAL PUBLIC LICENSE' y 'Creative commons'"
echo " [ Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) ], las cuales pueden consultarse en los siguientes"
echo -n " enlaces: ";tput bold;echo "https://www.gnu.org/licenses/gpl-3.0.html - https://creativecommons.org/licenses/by-sa/4.0/"
tput sgr0;echo ""
echo -n "                                                      (p) Hugo Napoli, 11/2019 - ";tput setaf 10
tput bold;echo "https://hugonapoli.blogspot.com";tput sgr0
echo "";tput setaf 9;echo -n " Pulsa 'n' para salir sin aceptar la licencia";tput setaf 7
echo ", o cualquier otra tecla para aceptarla y continuar."

tput civis
read -n1 -s licencia
tput cnorm

if [[ $licencia == "n" ]];then
    tput civis
    echo ""
    echo " Vaya... Ojalá no tengas problemas con las licencias libres :("
    echo " Tal vez hayas pulsado 'n' por error :)"
    echo " De ser así, ejecuta este programa nuevamente."
    echo ""
    echo " En cualquier caso: ten un buen día. Esperamos verte nuevamente por aquí."
    sleep 7
    tput cnorm
    exit
else
    clear
fi

function restaurar {
    echo " Restaurando archivos como usuario 'root', y preservando permisos y atributos originales..."
    sleep 1
    # -r: (r)ecursivo; p: preservando (p)ermisos;v: (v)erborrágico.
    tput setaf 8
    cp -rpv "$dir_gral$dir_local/$usr/" "/home/"
    tput sgr0
#     echo -n " Aplicando permisos de usuario '";echo -n $usr;echo "'..."
#     chown -R $usr:users "/home/$usr"
    sleep 1
    salir
}

function crear_base {
    echo " Eliminando directorio anterior..."
    rm -rf $dir_gral$dir_local/$usr
    sleep 1
    echo " Creando nuevo directorio..."
    mkdir $dir_gral$dir_local/$usr
    sleep 1
#     echo " Otorgando permisos de lectura para todos los usuarios..."
#     chmod 755 $dir_gral$dir_local/$usr
#     sleep 1
    echo " Respaldando archivos (preservando permisos y atributos originales)..."
    sleep 1
    # -r: (r)ecursivo; p: preservando (p)ermisos;v: (v)erborrágico.
    tput setaf 8
    cp -rpv "/home/$usr/" "$dir_gral$dir_local"
    tput sgr0
    sleep 1
    salir
}

function base_o_drbrown {
    clear
    tput setaf 179;head -n -0 "$directorio_ascii/DeLorean.txt";tput setaf 7
    
    echo ""
    echo -n " Ahora, indícame si necesitas ";tput setaf 2;echo -n "construir";tput setaf 7;echo -n " la ";tput setaf 2;echo -n "(b)";tput setaf 7;echo "ase de datos,"
    echo -n "           o si quieres ";tput setaf 2;echo -n "hacer funcionar";tput setaf 7;echo -n " al ";tput setaf 2;echo -n "(D)";tput setaf 7;echo "eLorean."
    echo -n "      Si necesitas ";tput setaf 2;echo -n "más información";tput setaf 7;echo -n ", digita ";tput setaf 2;echo -n "(i)";tput setaf 7;echo "."
    echo ""
    
    tput civis
    read -n1 -s proc
    tput cnorm
    
    if [[ -z $proc ]];then
        echo " Debes pulsar 'b' (minúscula) o 'D' (mayúscula)..."
        sleep 2
        base_o_drbrown
    elif [[ $proc == "b" ]];then
        echo " Construyendo la base de datos..."
        sleep 2
        crear_base
    elif [[ $proc == "D" ]];then
        echo " Encendiendo al DeLorean..."
        sleep 2
        restaurar    
    elif [[ $proc == "i" ]];then
        clear
        echo ""
        echo " ---------------------------"
        echo " Información complementaria:"
        echo " ---------------------------";echo ""
        echo " Si pulsas 'b', el Doc tomará una especie de fotografía de la CONFIGURACIÓN ACTUAL del usuario"
        echo -n " ";tput setaf 11;echo -n $usr;tput setaf 7;echo -n ",";echo " para que puedas RESTAURARLA MÁS ADELANTE."
        echo " ESTA OPCIÓN NO REALIZA NINGÚN CAMBIO. Solamente hace una copia de todas las configuraciones"
        echo " de dicho usuario, lo cual incluye:"
        echo ""
        echo " - el escritorio entero, incluyendo la imagen de fondo del mismo, los iconos y el panel,"
        echo " - la configuración de programas como Mozilla Firefox, Gimp, la terminal Konsole,"
        echo " - todos los programas que guarden su configuración en el directorio del usuario."
        echo " - todos los archivos de las carpetas comunes del usuario, tales como:"
        echo "          > Descargas,"
        echo "          > Documentos,"
        echo "          > Escritorio (obviamente),"
        echo "          > Imágenes,"
        echo "          > Música,"
        echo "          > Videos,"
        echo "          > etc."
        echo ""
        echo " ---------------------------------------------------------------------------------------------"
        echo "";tput setaf 3;tput bold
        echo " Si presionas 'D', Doc APLICARÁ LA CONFIGURACIÓN PREVIAMENTE GUARDADA, SOBREESCRIBIENDO TODOS"
        echo -n " LOS DATOS EXISTENTES EN EL USUARIO ";echo -n $usr;echo "."
        echo " ESTA OPCIÓN SOBREESCRIBE DE MANERA IRRECUPERABLE TODA CONFIGURACIÓN DE LOS MISMOS PROGRAMAS"
        echo " Y DIRECTORIOS EXPLICADOS PARA LA OPCIÓN ANTERIOR."
        tput sgr0;echo ""
        echo " ---------------------------------------------------------------------------------------------"
        echo ""
        echo " Pulsa alguna tecla para continuar..."
        
        tput civis
        read -n1 -s
        tput cnorm
        
        base_o_drbrown
    else
        echo " Esa no es una opción..."
        sleep 1
        base_o_drbrown
    fi
}

function elegir_usuario {
    clear
    echo ""
    echo " A continuación, verás una lista con los usuarios que han sido creados en este sistema."
    tput bold;echo " Elige cuidadosamente a cuál de ellos le aplicarás la configuración.";tput sgr0
    echo " Puedes hacerlo con cuantos usuarios quieras, pero de a uno por vez." 
    echo "";tput setaf 14
    echo "========================================="
    echo "Usuarios creados en el sistema operativo:"
    echo "-----------------------------------------";tput bold
    echo -n "";grep '100' /etc/passwd | cut -d : -f 1
    tput sgr0;tput setaf 14;echo "========================================="
    tput setaf 7;echo ""
    read -p " Escribe el nombre del usuario elegido: " usr
    
    if [[ -z $usr ]];then
        echo " Debes escribir algún nombre..."
        sleep 2
        elegir_usuario
    elif [[ $usr == "*" ]];then
        echo " ¿Qué intentas hacer?"
        sleep 2
        elegir_usuario
    elif [[ $usr == "root" ]] || [[ $usr == "/" ]] || [[ $usr == "su" ]];then
        echo " ¿Qué? ¿Quieres meterte con el superusuario? No me lo creo..."
        sleep 3
        elegir_usuario
    else
        echo "";echo -n " ¿Es '";tput setaf 14;echo -n $usr;tput setaf 7;echo -n "' el usuario correcto (s/n)? ";read -n1 us
        if [[ $us = "n" ]];then
            echo "";echo " Bien. Probemos otra vez, entonces."
            sleep 2
            elegir_usuario
        elif [[ $us = "s" ]];then
            echo "";echo " Bien. Continuemos."
            verificar_usuario
        else
            echo "";echo " Debes pulsar 's' para 'sí', y 'n' para 'no'."
            sleep 2
            elegir_usuario
        fi
    fi
}

function verificar_usuario {
    echo ""
    echo -n " Verificando la existencia del usuario '";tput setaf 14;echo -n $usr;tput setaf 7;echo "'..."
    sleep 1
    if [[ `sed -n "/^$usr/p" /etc/passwd` ]];then
        echo -n " El usuario '";tput setaf 14;echo -n $usr;tput setaf 7;echo -n "' ha sido encontrado."
        echo "";echo " Podemos continuar."
        base_o_drbrown
    else
        echo -n " El usuario '";tput setaf 14;echo -n $usr;tput setaf 7;echo "' no existe."
        echo " Verifica la ortografía, o revisa la lista que se ofrece en color celeste, aquí arriba."
        echo "";echo " Pulsa alguna tecla para continuar."
        read -n1
        elegir_usuario
    fi
}

function n_aleatorio {
    menor=10000000
    mayor=99999999
    n=$((RANDOM * ($mayor-$menor+1) / 32768 + menor))
}

echo "";tput setaf 2
echo "       --------------------------------------------------------------------------"
echo "       | Programa de inmutabilidad de configuraciones para Linux 'Doctor Brown' |"
echo "       --------------------------------------------------------------------------"
echo "";tput setaf 5
echo "                                      Verificando permisos...";echo "";tput sgr0

usuario=$(whoami)

if [[ $usuario != "root" ]];then
    echo " Por motivos de seguridad, no es posible encender el DeLorean DMC-12 desde esta cuenta de usuario."
    echo " Debes pedir acceso de 'root' al sistema."
    echo "";tput sitm
    echo " Todo Hill Valley ríe ante tu intento frustrado de viajar en el tiempo."
    echo -n " Marty Fox está decepcionado ";tput sgr0;tput setaf 9;tput bold;echo ":(";tput sgr0
    echo ""
    echo " Pulsa alguna tecla para salir del programa."
    echo ""
    
    tput civis
    read -n1 var
    tput cnorm
    
    # Salir cerrando la terminal
    # exit -f
    exit
fi

tput setaf 11
tput blink;tput setab 12
echo "                                  * * * Permisos verificados * * *                                ";tput sgr0;tput setaf 11;echo ""
echo " El DeLorean DMC-12 está listo, y la tormenta eléctrica está acercándose a su punto más intenso :)";tput sgr0
echo "";tput bold;tput setaf 2
echo " Si continúas, este programa eliminará permanentemente los contenidos de instalaciones anteriores."
echo " Si nunca antes lo habías instalado, no tienes de qué preocuparte: continúa con normalidad."
echo -n " Si posees datos importantes de una instalación previa, pulsa ";tput setab 4;echo " CTRL + C ";tput sgr0;tput setaf 2;tput bold
echo " (o escribe un código erróneo a continuación), respalda y ejecuta 'Doctor Brown' nuevamente."
echo "";tput sgr0
echo " Para continuar, digita el código de seguridad que se muestra aquí debajo."
echo " Dispones de 1 solo intento, o deberás volver a ejecutar este nostálgico programa."
echo "";tput setaf 11;tput bold;echo -n " El código de seguridad es: "

n_aleatorio

echo $n;tput sgr0

echo ""
read -p " Ahora, escríbelo tú aquí: " codigo

if [[ $codigo != $n ]];then
    echo "";tput sitm
    echo " El rayo no fue lo suficientemente fuerte, y el capacitor de flujo no alcanzó los 1,21 jigowatts :("
    sleep 5;tput sgr0
    echo ""
    # Salir cerrando la terminal
    # exit -f
    exit
else
    elegir_usuario
fi
