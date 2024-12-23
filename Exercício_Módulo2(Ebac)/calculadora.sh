#!/bin/bash

echo "Verificando se o interpretador Python 3 faz parte do sistema"
python3_command=$(python3 --version 2>&1)

if [[ "$python3_command" == *"Command not found: Python3"* ]];then
	read -p "Gostaria de baixar Python 3? (Y/N): " user_permission
	if [[ "$user_permission" == "Y" || "$user_permission" == "y" ]];then
	    sudo apt update
	    sudo apt install python3 -y
	elif [[ "$user_permission" == "N" || "$user_permission" == "n" ]];then
	    echo "Por favor, baixe o interpretador Python 3, linha de comando sudo apt -i python3"
	else
	    echo "Opção inválida. Saindo do script."
	fi
else
	echo "Python 3 já está instalado, executando a calculadora ..."
	python3 'calculadora.py'
fi
#Oi professor, durante esse exercicio eu estive na duvida de qual caminho seguir com este 
#programa, a princípio eu achei que era para usar o comando python3 -c seguido do codigo 
#python para a calculadora, mas depois de con- versar com um amigo meu que trabalha na área de 
#programação, ele me informou que essa não seria a pratica correta que o codigo ficaria 
#difícil de ler e que a prática correta seria usar o shell script para executar o programa por 
#fora, mas afim de deixar claro as minhas intenções eu resolvi deixar esta mensagem.
