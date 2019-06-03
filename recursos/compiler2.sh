##################################SCRIPT DE INFORMACION DE SISTEMA############################
echo -e "\n\e[42m=====================\e[0m\n\e[42m==  PROCESADOR Y   ==\e[0m\n\e[42m==     KERNEL      ==\e[0m\n\e[42m=====================\e[0m"
Procesador=$(uname -p)
Arquitecturakernel=$(uname -r)
echo -e "\e[46mProcesador:\e[0m " $Procesador
echo -e "\e[46mKernel:\e[0m " $Arquitecturakernel
echo -e "\n\e[42m=====================\e[0m\n\e[42m==     DISCO Y     ==\e[0m\n\e[42m==   PARTICIONES   ==\e[0m\n\e[42m=====================\e[0m"
df -hT
free -mh
echo -e "\n\e[42m=====================\e[0m\n\e[42m==  DISPOSITIVOS   ==\e[0m\n\e[42m=====================\e[0m"
echo -e "\e[46mmount:\e[0m " && mount
echo -e "\e[46mfstab:\e[0m " && cat /etc/fstab
echo -e "\e[46mlsmod:\e[0m " && lsmod
echo -e "\e[46mlsusb:\e[0m " && lsusb -v
echo -e "\n\e[42m=====================\e[0m\n\e[42m==    INTERNET     ==\e[0m\n\e[42m=====================\e[0m"
DNSs=$(cat /etc/resolv.conf | sed '1 d' | grep nameserver | awk '{print $2}')
echo -e "\e[46mServidor DNS actual:\e[0m " $DNSs
echo -e "\e[46mDireccion IP:\e[0m " && ip a | cut -d ':' -f 2 | grep inet
echo -e "\e[46mDireccion MAC:\e[0m " && ip a | grep --color=none link
echo -e "\e[46mRutas IP:\e[0m " && ip r
echo -e "\n\e[42m=====================\e[0m\n\e[42m==    HARDWARE     ==\e[0m\n\e[42m=====================\e[0m"
select OPCION in Ejecutar_dmidecode No_ejecutar_dmidecode
  do
  if [ $OPCION = 'Ejecutar_dmidecode' ]; then
        echo -e "\e[46mHardware del sistema modo dmidecode:\e[0m " && dmidecode | sed -e '/Handle|Memory|System|Access|Access/p'| egrep -v 'End'
      break
  else
        break
  fi
done
select OPCION in Ejecutar_lshw No_ejecutar_lshw
  do
  if [ $OPCION = 'Ejecutar_lshw' ]; then
        echo -e "\e[46mHardware del sistema modo lshw:\e[0m " && lshw
      break
  else
        break
  fi
done
TiempoEncendido=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e "\e[46mTiempo encendido:\e[0m "$TiempoEncendido
echo -e "\n\e[42m=====================\e[0m\n\e[42m==    USUARIOS     ==\e[0m\n\e[42m=====================\e[0m"
echo -e "\e[46mNombre de host:\e[0m " && hostname
echo -e "\e[46mLocalizacion de sesiones iniciadas:\e[0m " && w
echo -e "\e[46mUltimos usuarios con sesion iniciada modo last:\e[0m " && last
echo -e "\e[46mUltimos usuarios con sesion iniciada modo lastb:\e[0m " && lastb
echo -e "\e[46mUsuarios con sesion iniciada actualmente:\e[0m " && who
echo -e "\e[46mPoliticas de password:\e[0m" && sed -n '/PASS_/ p' /etc/login.defs | grep -v '#'
echo -e "\e[46mModulos de Pam:\e[0m" && ldd /bin/su
echo -e "\e[46mLimites de los modulos de PAM:\e[0m" && cat /etc/security/limits.conf | cut -d '#' -f 2 | awk '/<domain>      <type>  <item>         <value>/,0' | grep -v 'End of file'
echo -e "\n\e[42m=====================\e[0m\n\e[42m==    PROCESOS     ==\e[0m\n\e[42m=====================\e[0m"
ps
echo -e "\n\e[42m=====================\e[0m\n\e[42m==   COMPROBANDO   ==\e[0m\n\e[42m==    PERMISOS     ==\e[0m\n\e[42m==  /HOME USUARIOS ==\e[0m\n\e[42m=====================\e[0m"
for DIR in `awk -F: '($3 >= 1000 && $3 != 65534 ) { print $6 }' /etc/passwd`
do
   ls -lva $DIR |head -2 |tail -1
done
echo -e "\n\e[42m=====================\e[0m\n\e[42m==    INFORMES     ==\e[0m\n\e[42m==    AUREPORT     ==\e[0m\n\e[42m=====================\e[0m"
