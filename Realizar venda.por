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
		inteiro cod_produto=0, qnt_produto=0, qnt_estoque=0, atualizaEstoque=0, formaPagamento=0, atualizaProdutosV = 0, totalEstoque =0, estoque =0
	  	real saldoDoCaixa=0.0, atualizarSaldoCaixa = 0.0, valorVenda=0.0, desconto = 0.0, acrescimo = 0.0, custoVenda = 0.0, lucroVenda = 0.0,atualizaCusto=0.0, atualizaLucro=0.0
		inteiro opcao_menu
	     cadeia nomeProduto,valorProduto, quantProduto, custoProduto = "sed"
	     caracter Opcao_produtos
		inteiro opcao, arquivo, vetCod[5], vetQntProduto[5]
		real saldoCaixa=0.0, vetCusto[5], vetValorProd[5]
		cadeia vetsrc[5], vetNome[5],valorProd,qntProduto,custo
		escreva ("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
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
		logico nomeValido = verdadeiro
		faca{
		escreva("Digite o nome do produto para cadastrar :\n-->")//saída de daos para direcionar o usuario
          leia(nomeProduto) // Ler a entrada do usuário
          se(nomeProduto==""){ // Verifica se o usuário digitou algo
        	escreva("Digite um nome\n")// Se o usuário não digitou nada, pedimos que ele digite o nome do produto
        }
          se(nomeProdutoExiste(nomeProduto,vetNome)){ // Usa sua função para verificar se o nome do produto não existe
           escreva("Este produto ja foi Cadrastrado\n") // Se o nome do produto já existir, informa ao usuário
          }senao{
          vetNome[l]= nomeProduto // Se o nome do produto não existir, o adiciona ao produto
          nomeValido = falso // Defini nomeValido como falso
          }
           }enquanto(nomeValido == verdadeiro) // Repeti o loop até que o usuário digite um nome de produto válido	
           faca{
		 escreva("Digite o valor do produto :\n-->")//saída de daos para direcionar o usuario
			     leia (valorProd)
		 se(valorProd==""){
		 	escreva("Digite um valor\n")
		 }
		 se(typ.cadeia_e_real(valorProd)==falso){// Verifica se a entrada é um número real
		 	escreva("Por favor Digite o valor real do Produto\n")}
		 senao{
		 	vetValorProd[l]=typ.cadeia_para_real(valorProd)}	 // Converte a entrada para um número real e armazena no vetor    
           }enquanto(vetValorProd[l]<=0) 
           faca{    
		  escreva(" Digite a quantidade em estoque :\n--> ")//saída de daos para direcionar o usuario
  		         leia(qntProduto)
  		         se(qntProduto==""){
  		         	escreva("Digite um valor\n")
  		         }
  		         se(typ.cadeia_e_inteiro(qntProduto,10)==falso){
  		         escreva("Digite numero inteiro de Quantidade\n")
  		         }senao{
  		         vetQntProduto[l]=typ.cadeia_para_inteiro(qntProduto,10)}
           }enquanto( vetQntProduto[l]<=0)
           faca{
           escreva(" Digite o custo do Produto :\n-->")//saída de daos para direcionar o usuario
          	   leia(custo)
          	   se(custo==""){
          	   	escreva("Digite um valor\n")
          	   }
          	   se(typ.cadeia_e_real(custo)==falso){
          	   	escreva("Digite um valor real do Custo de Produção\n")
          	   }senao{
          	   	vetCusto[l]=typ.cadeia_para_real(custo)}
          	   	se(vetCusto[l]>vetValorProd[l]){
          	   		escreva("O Custo de Produção nao pode ser maoir que o valor do Produto.Por favor,Digite novamente.\n")
          	   	}
           }enquanto(vetCusto[l]<=0 ou vetCusto[l]>vetValorProd[l])// vai ficar repetindo enquanto valor digitado for zerro ou enquanto o valor do custo digitado for maior que o valor do produto

			para ( inteiro i=0;i<5;i++){  // sorteia numero do codigo dos produtos
			vetCod[i] = utl.sorteia(100, 300)
			se(utl.sorteia(100, 300) == utl.sorteia(100, 300)){
				vetCod[i] = utl.sorteia(100, 300)
				}
				
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
				// imprimir lista 
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
			//realizar vendas
		para (inteiro l=0;l<6;l++){
		
		//escreva("Digite o código do produto que deseja comprar: \n--> ")
          escreva(" -----------------------------------------------------\n")//saída de dados (representação gráfica)
          escreva("|    Digite o código do produto que deseja comprar    | \n ")//saída de daos para direcionar o usuario
          escreva(" -----------------------------------------------------\n-->")//saída de dados (representação gráfica)
                  leia(cod_produto) 
          //escreva("Digite a quantidade que deseja comprar: \n--> ")
          escreva(" ------------------------------------------------------\n")//saída de dados (representação gráfica)
          escreva("|    Digite a quantidade que deseja comprar            |\n ")//saída de dado (será printado na tela para direcionar o usuario do que deve ser digitado)
          escreva(" ------------------------------------------------------\n-->")//saída de dados (representação gráfica)
                  leia(qnt_produto)
          
          se(cod_produto == vetCod[l]){
          	//escreva("Processando compra...\n\n")         
          escreva(" ------------------------------------------------------\n")//saída de dados (representação gráfica)
          escreva("|    .........PROCESSANDO COMPRA...........            |\n ")//saída de dado (será printado na tela para direcionar o usuario do que deve ser digitado)
          escreva(" ------------------------------------------------------\n-->")//saída de dados (representação gráfica)
          para (inteiro l=0;l<6;l++){
          qnt_estoque == vetQntProduto[l] // atribui uma valor da matriz a uma variável 
          
          se( qnt_produto <=  qnt_estoque  ){ // condição para o bloco de código ser executado caso seja verdadeira 
           atualizaEstoque = qnt_estoque - qnt_produto // atualização do estoque 
            matriz[l][3]  =  Tipos.inteiro_para_cadeia(atualizaEstoque, 10) // atualiza o estoque dentro da matriz 
              atualizaProdutos(atualizaProdutosV , qnt_produto) // chamada de função que mantem o controle de quantos produtos foram vendidos  
                valorVenda = Tipos.cadeia_para_real(matriz[l][1]) // atribui um valor da matriz a uma variavel 
                 valorVenda = valorVenda * qnt_produto // calculo para saber o valor da venda 
		      custoVenda = Tipos.inteiro_para_real(qnt_produto) * Tipos.cadeia_para_real(custoProduto) // calculo para saber o custo total da venda 
		     fAtualizaCusto( atualizaCusto ,custoVenda)//chamda de função para atualização do custo das vendas totais
		   lucroVenda = valorVenda - custoVenda // calculo para saber o lucro da venda 
		fAtualizaLucro(atualizaLucro, lucroVenda) //chamda de função para atualização do lucro das vendas totais 

            matrizControle[l][3] = Tipos.inteiro_para_cadeia(atualizaProdutosV = atualizaProdutosV + qnt_produto, 10)
		  matrizControle[l][2] = Tipos.inteiro_para_cadeia(atualizaEstoque, 10)
           
          escreva("\n-----------------\n ---------------> Você comprou ",qnt_produto," ", matriz[l][0], " e ainda restam ", atualizaEstoque," ", matriz[l][0], " no estoque \n")
          escreva ("\n----------------\n ---------------> Carrinho de compras:  ", matriz[l][0], " , ",qnt_produto," unidades. \n-----> O valor da venda ficou um total de R$:",valorVenda,"\n\n")
          }
           senao se (qnt_estoque == 0) // segunda condição a ser executada caso a primeira não seja e a condição seja verdadeira 
          {
          	escreva("Não é possivel completar a venda. O estoque está zerado!\n")
         	}
         senao se (qnt_produto > qnt_estoque ){ // terceira condição a ser executada caso nem a primeira nem a segunda seja verdadeira 
         escreva("Quantidade insuficiente no estoque! \nTemos apenas ",qnt_estoque," unidades, gostaria de comprar o mesmo produto nessa quantidade??\nDigite S - para sim e N - para não\n-->")
           leia(Opcao_produtos)  
             se(Opcao_produtos == 'S' ou Opcao_produtos == 's'){
     
               atualizaEstoque = qnt_estoque -  qnt_estoque
                 matriz[l][3]  =  Tipos.inteiro_para_cadeia(atualizaEstoque, 10)
                   atualizaProdutos(atualizaProdutosV , qnt_produto) // chamada de função que mantem o controle de quantos produtos foram vendidos 
                 valorVenda = Tipos.cadeia_para_real(matriz[l][1]) 
               valorVenda = valorVenda * qnt_estoque

               custoVenda = Tipos.inteiro_para_real(qnt_produto) * Tipos.cadeia_para_real(custoProduto) // calculo para saber o custo total da venda 
                 fAtualizaCusto( atualizaCusto ,custoVenda)//chamda de função para atualização do custo das vendas totais
		        lucroVenda = valorVenda - custoVenda // calculo para saber o lucro da venda 
		          fAtualizaLucro(atualizaLucro, lucroVenda) //chamda de função para atualização do lucro das vendas totais 
		       
                   matrizControle[l][3] = Tipos.inteiro_para_cadeia(atualizaEstoque, 10)
		       matrizControle[l][2] = Tipos.inteiro_para_cadeia(atualizaEstoque, 10)
		  
                escreva("\n\n Você comprou ",qnt_estoque," ", matriz[l][0], " e ainda restam ", atualizaEstoque," ", matriz[l][0], " no estoque \n")
          	escreva ("\n\n O valor a ser cobrado pelo produto:  ", matriz[l][0]," ", qnt_estoque," unidades \n O valor da venda ficou um total de R$:",valorVenda,"\n\n")
             	}
             	senao se(Opcao_produtos == 'N' ou Opcao_produtos == 'n'){
             		escreva("Vamos cancelar a compra...\nObrigada e volte sempre!\n")
             		}
         	     	senao{
         	     	escreva("Opção invalida!\n\n")
         	     	}
         	}
          
      	escreva ("-> Qual será a forma de pagamento? \nDigite 1 para dinheiro ou pix \nDigite 2 para cartão\nDigite 3 para cancelamento de compra\n-->")
         		leia(formaPagamento)
         	 	escolha (formaPagamento){ // escolha caso para a forma de pagamento
         	 		caso 1: 
         	 		escreva("Pagamento em dinheiro tem 10% de desconto! \n")
         	 		escreva(" \nO Valor total com desconto é:  ",dinheiro(valorVenda, desconto)) // chamada de função
         	 		escreva ("\n...Recebemos o pagamento....\n .....Guardando valor em caixa....\n")
			
			//dinheiro (valorVenda,desconto)
			saldoDoCaixa = saldoDoCaixa + dinheiro (valorVenda,desconto)
			atualizarSaldoCaixa = saldoDoCaixa // atualização do saldo do caixa 
	  		escreva ("\nO Saldo total em caixa é de: R$",atualizarSaldoCaixa,"\n")	
         	 		pare
         	 		caso 2:
         	 		escreva("Pagamento no cartão tem 3% de acrescimo: \n ")
         	 		escreva("\n O Valor total com acrescimo é:  ",cartao(valorVenda, acrescimo)) //chamda de função
         	 		escreva ("\n.....Recebemos o pagamento....\n .....Guardando valor em caixa....\n")
			
	 		//cartao(valorVenda,acrescimo)
	  		saldoDoCaixa = saldoDoCaixa + cartao(valorVenda,acrescimo)
			atualizarSaldoCaixa = saldoDoCaixa // atualização do saldo do caixa
			escreva ("\n O Saldo total em caixa é de: R$,",atualizarSaldoCaixa,"\n") 
         	 	
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
		
	}  */}}}
	 funcao logico nomeProdutoExiste(cadeia nomeProduto, cadeia vetNome[]){// Função para verificar se o nome do produto já existe
       	inteiro intNumProdutos=0  
       para(inteiro l=0; l<5; l++){// Loop para percorrer todos os produtos       
       se(vetNome[l] == nomeProduto){// Se o nome do produto já existe na matriz de produtos            
       retorne verdadeiro// Retorna verdadeiro indicando que o nome do produto já existe
         }
       }
        retorne falso // Se o nome do produto não foi encontrado na matriz de produtos, retorna falso
       }
	
	funcao real abrirCaixa (real saldoCaixa){
		escreva ("Abertura de caixa, Quantos reais tem no caixa? ")
		leia (saldoCaixa)
		retorne (saldoCaixa)
	}
	funcao real calcularJuros(real valorCobrarCliente){
     	inteiro opcao_pagamento
     	const real juros = 0.035, jurosD = 0.02
     	faca{
     	escreva("Qual a forma de pagamento?\nDigite:\n1 - Para cartão de crédito\n2 - Para Débito\n-->")
     	leia(opcao_pagamento)
     	se(opcao_pagamento < 1 ou opcao_pagamento > 2){
     		escreva("Forma de pagamento invalida! Digite uma oção valida:\n")
     		}
     	}enquanto(opcao_pagamento < 1 ou opcao_pagamento > 2)
          se(opcao_pagamento == 1){
     		escreva("Pagamento no crédito possuí 3.5% de juros em cima do valor total\n")
                  valorCobrarCliente = valorCobrarCliente + (valorCobrarCliente*juros)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorCobrarCliente, 2))
     		retorne(valorCobrarCliente)
     		}
     	senao {
     		escreva("Pagamento no Débito possuí 2% de juros em cima do valor total\n")
                    valorCobrarCliente = valorCobrarCliente + (valorCobrarCliente*jurosD)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorCobrarCliente, 2))
     		retorne(valorCobrarCliente)
     	}
	}
     	
     funcao real funcaoDinheiro_Troco(real trocoCliente, real valorCobrarCliente){
     		real valorDinheiro
     		const real desconto = 0.05
     		
     		escreva("Pagamento em dineiro possuí 5% de desconto em cima do valor total\n")
                   valorCobrarCliente = valorCobrarCliente - (valorCobrarCliente*desconto)
               escreva("O valor final da venda é:\n-->R$ ",mat.arredondar(valorCobrarCliente, 2))
     		faca{
     		 escreva("\nInforme o valor em dinheiro passado pelo cliente:\n-->")
     		  leia(valorDinheiro)
     		  se(valorDinheiro < valorCobrarCliente){
     		  	 escreva("Valor insufiente para completar a compra do cliente!\n")
     		  }
     		  	}enquanto(valorDinheiro < valorCobrarCliente)
     		 se(valorDinheiro == valorCobrarCliente ou valorDinheiro > valorCobrarCliente){
     		 	trocoCliente = valorDinheiro - valorCobrarCliente
     		   escreva("O troco do cliente é: ",trocoCliente)
     		
     		 }
     		retorne(trocoCliente)
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
 * @POSICAO-CURSOR = 6869; 
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
 * @POSICAO-CURSOR = 11300; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */