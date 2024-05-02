programa
{
	inclua biblioteca Matematica --> mat
	
	funcao inicio()
	{
	  real valorVenda
		escreva("Informe o valor final da venda:\n-->")
		leia(valorVenda)
		calcularJuros_Desconto (valorVenda)
	}
     funcao real calcularJuros_Desconto (real valorVenda){
     	inteiro opcao_pagamento
     	const real juros = 0.035, jurosD = 0.02, desconto = 0.05
     	faca{
     	escreva("Qual a forma de pagamento?\nDigite:\n1 - Para cartão de crédito\n2 - Para Débito\n3 - Para pagamento em dinheiro\n-->")
     	leia(opcao_pagamento)
     	se(opcao_pagamento < 1 ou opcao_pagamento > 3){
     		escreva("Forma de pagamento invalida! Digite uma oção valida:\n")
     		}
     	}enquanto(opcao_pagamento < 1 ou opcao_pagamento > 3)
          se(opcao_pagamento == 1){
     		escreva("Pagamento no crédito possuí 3.5% de juros em cima do valor total\n")
                  valorVenda = valorVenda + (valorVenda*juros)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorVenda, 2))
     		retorne(valorVenda)
     		}
     	senao se(opcao_pagamento == 2){
     		escreva("Pagamento no Débito possuí 2% de juros em cima do valor total\n")
                    valorVenda = valorVenda + (valorVenda*jurosD)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorVenda, 2))
     		retorne(valorVenda)
     		}
     	senao{
     		escreva("Pagamento em dineiro possuí 5% de desconto em cima do valor total\n")
                   valorVenda = valorVenda - (valorVenda*desconto)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorVenda, 2))
     		retorne(valorVenda)
     		}
     	
     	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1017; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */