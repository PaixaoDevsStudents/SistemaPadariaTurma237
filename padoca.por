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
<<<<<<< HEAD
		inteiro arquivo, mnu=0, qtd_estoque=0, id_produto=0
		real val_uni=0.0, val_custo=0.0
		cadeia nome_produto=""
		/*
		 * caminhos dos arquivos
		const
		const
		const
		const
		*/
		
=======
		inteiro opcao
		cadeia vetsrc[5]
		escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
		cadeia typdata[2]={"arquivodetexto|txt","arquivodetexto|txt"}
		para(inteiro c=0;c<5;c++){
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)	
		}
		limpa()
>>>>>>> c3325990a1b0d4bf545322734d248cc7db995bc0
		//leitura de arquivos
		
		//menu de opções
			imprime_mnu(mnu)
			escolha(mnu){
				caso 1:
					inteiro y=0
						escreva("Quantos produtos irá cadastrar?: ")
						leia(y)
					para(inteiro i=0; i<y; i++){
						cad_produ(qtd_estoque, id_produto, val_uni, val_custo, nome_produto)	
						}
						imprime_mnu(mnu)
					//cadastrar produtos
					
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
				caso contrario:
				inicio()
			}
	}funcao inteiro imprime_mnu(inteiro &opcao){
		escreva("Escolha uma opcao \n\n 1) Cadastrar produto         2) Registrar Venda\n 3) Relatorio Atual           4) Fechar Caixa e Sair\n\nDigite o numero referente a opção desejada: ")
		leia(opcao)
		retorne opcao
	}funcao cad_produ(inteiro qtd_estoque,inteiro id_produto, inteiro val_uni,inteiro val_custo,cadeia nome_produto){
		
	}
<<<<<<< HEAD
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1888; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
=======
}
>>>>>>> c3325990a1b0d4bf545322734d248cc7db995bc0
