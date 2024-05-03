programa
{
	inclua biblioteca Graficos-->grf
	inclua biblioteca Tipos-->typ
	inclua biblioteca Texto-->txt
	inclua biblioteca Calendario-->cal
	inclua biblioteca Matematica-->mat
	inclua biblioteca Util-->utl
	inclua biblioteca Arquivos-->src
	
	funcao inicio()
	{	

		//variaveis
		inteiro opcao
		cadeia vetsrc[5]
		escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
		cadeia typdata[2]={"arquivodetexto|txt","arquivodetexto|txt"}
		para(inteiro c=0;c<5;c++){
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)	
		}
		limpa()
		//leitura de arquivos
		
		//menu de opções
			escreva("1-Cadastrar produtos\n2-Realizar vendas\n3-Relatório temporario\n4-Fechar caixa\n5-Verificar acesso\n->")
			leia(opcao)
			escolha(opcao){
				caso 1:
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
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 651; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetsrc, 16, 9, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */