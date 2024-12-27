# Documentação do Projeto de Calculadora em Python com Verificação em Python com Verificação em Shell Script

## Visão Geral

Este projeto é composto por:

1. Uma calculadora simples escrita em Python, que avalia expressões matemáticas fornecidas pelo usuário.
2. Um script shell que verifica a presença do interpretador Python 3 no sistema antes de executar a calculadora.



## 1. Calculadora em Python

## Arquivo: calculadora.py

## Descrição

A calculadora permite ao usuário inserir uma expressão matemática e retorna o resultado. Caso o formato da expressão seja
inválido, exibe uma mensagem de erro

## Código

```json
operacao = input("Qual operação você gostaria de realizar?")

try:
    resultado = eval(operacao)
    print("Resultado: ", resultado)
except (SyntaxError, NameError, TypeError):
    print("Formato de operação inválido. Use apenas números e operadores (+, -, *, /)")
```

## Funcionamento

1. O usuário insere uma expressão matemática (e.g, 2 + 2 ou 5 * (3 + 1))
2. O programa tenta avaliar a expressão usando a função eval.
3. Caso a expressão seja válida, o resultado é exibido.
4. Caso contrário, uma mensagem de erro é exibida informando sobre o formato inválido

## Limitações

- Segurança: A função eval pode executar código arbitrário, representado um risco caso o usuário insira comandos maliciosos.
- Operadores suportados: Apenas operadores básicos (+, -, *, /).

## 2. Script Shell de Verificação

## Arquivo: verifica_python3.sh

## Descrição

Este script verifica se o interpretador Python 3 está instalado no sistema. Caso não esteja, oferece ao usuário a opção de 
instalá-lo. Se p Python 3 estiver presente, o script executa a calculadora.

```json
## Código

#!/bin/bash

echo "Verificando se o interpretador Python 3 faz parte do sistema"
python3_command=$(python3 --version 2>&1)

if [[  "$python3_command" == *"Command not found: Python3"*  ]];then
    read -p "Gostaria de baixar Python 3? (Y/N): " user_permission
    if [[  "$user_permission"   == "Y" || "$user_permission" == "y" ]];then
        sudo apt update
        sudo apt install python3 -y
    elif [[  "$user_permission" == "N" || "$user_permission" == "n" ]];then
        echo "Por favor, baixe o interpretador Python3, linha de comando sudo apt -i python3"
    else
        echo "Opção inválida. Saindo do script."
    fi
else
    echo "Python 3 já está instalado, executando a calculadora ..."
    python3 'calculadora.py'
fi
```

## Funcionamento

1. O script verifica a presença do Python 3 no sistema com o comando python3 --version
2. Caso o Python 3 não esteja instalado
   - O usuário é informado e questionado se deseja instalá-lo.
   - Se o usuário concordar, o script usa sudo apt update e sudo apt install python 3 para realizar a instalação
   - Caso o usuário recuse, o script exibe uma mensagem informando como proceder manualmente
3. Se o Python3 estiver instalado, o script executa o arquivo calculadora.py

## Limitações

- Distribuição Linux: O script presume um sistema baseado em Debian (uso do apt para instalação)
- Permissões administrativas: A instalação do Python 3 requer que o usuário esteja no grupo sudo

## Como usar

## Pré-requisitos

- Um terminal Linux
- Ter acesso ao comando sudo

## Passos

1. Certifique-se de que os arquivos calculadora.py e verifica_python3.sh estejam no mesmo diretório
2. Execute o script shell: ./verifica_python3.sh
3. Siga as instruções exibidas pelo script para verificar ou instalar o Python 3 e executar a calculadora.

## Melhorias Futuras

- Substituir o uso de eval na calculadora por uma implementação personalizada para maior segurança.
- Tornar o script shell compatível com outras distribuições Linux
- Adicionar suporte a operadores matemáticos avançados (e.g, potência, raízes).
