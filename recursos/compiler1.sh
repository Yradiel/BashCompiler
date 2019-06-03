#!/bin/bash
#######################Script para Ubuntu#################################
Fcompleta=$(date +%d-%m-%Y-%H:%M:%S)
fecha=$(date +%d-%m-%Y-%H:%M)
#echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "**********************************************************" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "Script ejecutado en la fecha: $Fcompleta " >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "**********************************************************" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
##########################Sacar información de los usuarios################
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "Información de los usuarios" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "-----------------------------------------------" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
cat /etc/passwd | cut -f 1,3 -d: >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
#echo -e "\n" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
######################Información de usuarios administradores###############
#echo "Información sobre los usuarios administradores "
echo "Información sobre los usuarios administradores " >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "-----------------------------------------------" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
cat /etc/group | cut -d: -f 1 > grupo
for j in $(cat grupo);
do
grupo=$j;
if [ "$j" == "root" ] || [ "$j" == "shadow" ] || [ "$j" == "sudo" ] || [ "$j" == "adm" ];
#if [ "$j" == "adm" ];
then
users=$(grep "$j:" /etc/group | cut -f4 -d ":") ;
echo -e "El grupo \e[0;35m$j\e[0m contiene los usuarios \e[0;32m$users\e[0m" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
fi
done
#cat /echo -e "\n" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
#########################Información de los Grupos############################
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "Información sobre los grupos " >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "-----------------------------------------------" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
cat /etc/group | cut -d: -f 1,3 >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
########################Información de que usuario pertenece a que grupo##############echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "Pertenencia de grupos y usuarios" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "-----------------------------------------------" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
echo "" >> /home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
cat /etc/passwd | cut -d: -f 1 > usuario
for i in $(cat usuario);
do
usuario=$i;
gid=`grep "^$i:" /etc/passwd | cut -f 4 -d:`;
grupo=`grep ":"$gid":" /etc/group | cut -f 1 -d:`;
echo -e "\e[44m$usuario\e[0m pertenece al grupo \e[44m$grupo\e[0m" >>/home/usuario/Scripts/reportes/Ubuntu-$fecha.txt
done