operacao = input("Qual operação você gostaria de realizar?")

try:
    resultado = eval(operacao)
    print("Resultado: ", resultado)
except (SyntaxError, NameError, TypeError):
    print("Formato de operação inválido. Use apenas números e operadores (+, -, *, /)")
