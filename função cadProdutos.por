programa
{
	inclua biblioteca Graficos-->grf
	inclua biblioteca Tipos-->typ
	inclua biblioteca Texto-->txt
	inclua biblioteca Calendario-->cal
	inclua biblioteca Matematica-->mat
	inclua biblioteca Util-->utl
	inclua biblioteca Arquivos-->src
	
	const inteiro TAM_X_TELA = 1920
	const inteiro TAM_Y_TELA = 1080
	funcao inicio()
	{	

		//variaveis
		inteiro opcao, arquivo, vetCod[5], vetQntProduto[5], quantProduto
		real saldoCaixa=0.0, vetCusto[5], custoProduto, valorProduto, vetValorProd[5]
		cadeia vetsrc[5], vetNome[5], nomeProduto
		escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
		cadeia typdata[2]={"arquivodetexto|txt","arquivodetexto|txt"}
		para(inteiro c=0;c<5;c++){
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)	
		}
		limpa()
		//leitura de arquivos
		
		
		//leitura de arquivos
			
		//menu de opções
			escreva("1-Cadastrar produtos\n2-Realizar vendas\n3-Relatório temporario\n4-Fechar caixa\n5-Verificar acesso\n->")
			leia(opcao)
			escolha(opcao){
				caso 1:
				
					//cadastrar produtos
					para(inteiro l=0;l<5;l++){
				//escreva("\nEscreva o nome do produto para cadastrar:  ")
		
		escreva("Digite o nome do produto para cadastrar :\n-->")//saída de daos para direcionar o usuario
			    leia ( vetNome[l])
		escreva("Digite o valor do produto :\n-->")//saída de daos para direcionar o usuario
			    leia ( vetValorProd[l])
		escreva(" Digite a quantidade em estoque :\n--> ")//saída de daos para direcionar o usuario
  		        leia(vetQntProduto[l])
          escreva(" Digite o custo do Produto :\n-->")//saída de daos para direcionar o usuario
          	   leia(vetCusto[l])
          	}

			para (inteiro l=0;l<5;l++){  // sorteia numero do codigo dos produtos
			vetCod[l] = utl.sorteia(100, 300)
			se(utl.sorteia(100, 300) == utl.sorteia(100, 300)){
				vetCod[l] = utl.sorteia(100, 300)
				}
			}
		
		para (inteiro l=0;l<5;l++){
		cadeia vetTexto[5]
		vetTexto[0] = "Nome"
		vetTexto[1] = "Cod"
		vetTexto[2] = "Valor"
		vetTexto[3] = "Quant"
		vetTexto[4] = "Custo"
			escreva("\t",vetTexto[l]," |")
		 
      	}
      	escreva("\n")
      	para (inteiro l=0;l<5;l++){
      		escreva("\t",vetNome[l],"|\t ",vetCod[l],"|\t  ",vetValorProd[l],"|\t  ",vetQntProduto[l],"|\t  ",vetCusto[l],"|\n")
      	}
		
					
					
					//entrada de dados
					
					//processamento
					
					//saida de dados
				pare
				caso 2:
					//realizar vendas
					
					//entrada de dados
					
					//processamento
					
					//saida de dados
				pare
				caso 3:
					//relatorio temporario
					
					//entrada de dados
					
					//processamento
					
					//saida de dados
				pare
				caso 4:
					//fechar caixa

					//entrada de dados

					//processamento

					//saida de dados
				pare
				caso 5:
					//verificar acesso
					
					//entrada de dados
					
					//processamento
					
					//saida de dados
				pare
				caso 6:
				// abrir caixa
				abrirCaixa (saldoCaixa)
				pare
				
				caso contrario:
				inicio()
			}
	}
	
	/*
	funcao inicio() {	// teste de funçoes 
		// funçao abrir caixa
		real saldoCaixa=0.0
		escreva ("Saldo em caixa é: R$ ",abrirCaixa (saldoCaixa)," Reais\n")
		
		inteiro quantidadeCompraCliente=0				// VAriaveissss
		real valorDaG=0.08, compraEmGramas=0.0,valorCobrarCliente=0.0
		// Chama de funçoes para testess e aquii
		calcularJuros_Desconto (balanca(quantidadeCompraCliente,compraEmGramas,valorCobrarCliente,valorDaG))
		
	}  */
	
	funcao real abrirCaixa (real saldoCaixa){
		escreva ("Abertura de caixa, Quantos reais tem no caixa? ")
		leia (saldoCaixa)
		retorne (saldoCaixa)
	}
	funcao real calcularJuros_Desconto (real valorCobrarCliente){
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
                  valorCobrarCliente = valorCobrarCliente + (valorCobrarCliente*juros)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorCobrarCliente, 2))
     		retorne(valorCobrarCliente)
     		}
     	senao se(opcao_pagamento == 2){
     		escreva("Pagamento no Débito possuí 2% de juros em cima do valor total\n")
                    valorCobrarCliente = valorCobrarCliente + (valorCobrarCliente*jurosD)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorCobrarCliente, 2))
     		retorne(valorCobrarCliente)
     		}
     	senao{
     		escreva("Pagamento em dineiro possuí 5% de desconto em cima do valor total\n")
                   valorCobrarCliente = valorCobrarCliente - (valorCobrarCliente*desconto)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorCobrarCliente, 2))
     		retorne(valorCobrarCliente)
     		}
     	}
		funcao real balanca (inteiro quantidadeCompraCliente,real compraEmGramas,real valorCobrarCliente,real valorDaG){
		quantidadeCompraCliente = utl.sorteia(1, 1000)  // sorteando a quantidade que o cliente vai comprar, para simular uma balança 
		quantidadeCompraCliente = typ.inteiro_para_real(quantidadeCompraCliente) // mudando o valor de inteiro para real para poder usar zero apos a virgula pq o sorteia so roda com inteiro...
		escreva ("Você comprou ",quantidadeCompraCliente," gramas de pão.\n")
		compraEmGramas = (quantidadeCompraCliente * 1000) // converter Kg para gramas 
		valorCobrarCliente = ((valorDaG*compraEmGramas) / 1000) // converte gramas em reais $$ dindin
		valorCobrarCliente = mat.arredondar(valorCobrarCliente, 7)
		escreva("Valor a cobrar do cliente é: ",valorCobrarCliente) // mostra o valor na tela a ser cobrado 
		retorne (valorCobrarCliente)
		}
	

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 393; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5486; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */