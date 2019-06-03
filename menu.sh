#!/bin/bash
fecha=$(date +%d-%m-%Y-%H:%M)
x=0
while [ $x == 0 ]
do
clear
echo "================================================"
echo ""
echo "*****************Menu***************************"
echo ""
echo "================================================"
echo "Introduzca 1 para ejecutar el script de Ubuntu16.04"
echo ""
echo "Introduzca 2 para ejecutar el script de Centos 6"
echo ""
echo "Introduzca 3 para ejecutar el script de Centos 7"
echo ""
echo "Introduzca 4 para ejecutar el script de  Suse 11"
echo ""
echo "Introduzca 5 para salir del menu"
echo ""
echo -n "Introduzca una opción: "
read opcion
case $opcion in
1)
bash /home/usuario/Scripts/recursos/compiler1.sh
bash ./recursos/compiler2.sh >> ./reportes/Ubuntu-$fecha.txt
more ./reportes/Ubuntu-$fecha.txt
echo ""
read -p "pulse "Enter" para continuar ..."
;;
2)
bash /home/usuario/Scripts/recursos/compiler1cen6.sh
bash ./recursos/compiler2.sh >> ./reportes/Centos6-$fecha.txt
more ./reportes/Centos6-$fecha.txt
;;
3)
bash /home/usuario/Scripts/recursos/compiler1cen7.sh
bash ./recursos/compiler2.sh >> ./reportes/Centos7-$fecha.txt
more ./reportes/Centos7-$fecha.txt
read -p "pulse "Enter" para continuar ..."
;;
4)
bash /home/usuario/Scripts/recursos/compiler1SUSE11.sh
bash ./recursos/compiler2.sh >> ./reportes/SUSE11-$fecha.txt
more ./reportes/SUSE11-$fecha.txt
read -p "pulse "Enter" para continuar ..."
;;
5)
break
;;
*)
echo "El numero introducido no es correcto"
read -p "pulse "Enter" para continuar ..."
;;
esac
done
echo "================================================"