programa
{
	funcao real abrirCaixa (real saldoCaixa){
		escreva ("Abertura de caixa, Quantos reais tem no caixa? ")
		leia (saldoCaixa)
		retorne (saldoCaixa)
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
	funcao real entradaBaseGramas(cadeia texto){
		cadeia opcao
          caracter saida = ' '//variavel de saida
          real x = 0.0//variavel de retorno
          //Faça-enquanto para verificar a entrada do usuário.
          faca 
          {
           escreva(texto)//Escreve o texto recebido pelo parâmetro.
           leia(opcao)//Parâmetro opçao recebe valor do usuário.
               //Se opcao não for um número real.
                
          }enquanto (typ.cadeia_e_real(opcao) == falso e typ.cadeia_e_inteiro(opcao,10) == falso)
               
               	//Opção inválida.
                    escreva("Opção incorreta!! Por favor, somente números reais.\n")
                    x = typ.cadeia_para_real(opcao)//x recebe coversão de cadeia para real do opcao.
               	se (x > 0)// se x é maior que 0.
				{
                    saida = 'e'//sai do loop.
				}
				senao
				{
				//opção inválida.
				escreva("Opção inválida!! Por favor, somente números acima de zero.\n")
                    }
		retorne x
	}
	funcao cadastroProduto(cadeia caminho){
		cadeia vetor[PROD]
		//loop para limpar o vetor de valores vazios
		para(inteiro i = 0; i< PROD; i++){
			vetor[i] = ""
		}
		//Vetor com idnomes recebe entrada de usuário do nome do produtlo
		vetor[0] += filtrarCaracteres(entradaBaseCadeia("Digite o nome do produtlo: "))
		//Vetor com id de stock recebe entrada de usuário do número de stock
		vetor[1] += entradaBaseInteiro("Digite a quantidade do produtlo que tem no estoque de hoje: ")
          //Vetor com id de precos recebe entrada de usuário do preço do produtlo
          vetor[2] += mat.arredondar(entradaBaseReal("Digite o preço do produtlo: "), 2)
          //vetor com id de custo recebe entrada de usuário do custo do produtlo
          vetor[3] += entradaBaseReal("Digite o custo do produtlo: ")
		 escreva ("O produto é vendido na grama ?")
          caracter evendidonaG
          leia(evendidonaG)
          se (evendidonaG == 's'){
          vetor[4] += entradaBaseGramas("Qual é o valor do Kilo?: ")
          }senao{
          passeProduto(1, caminho , vetor)//passa os dados do produtlo para o arquivo
          }
         
	}
	funcao inicio()
	
	{
	
		escreva("Olá Mundo")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3245; 
 * @DOBRAMENTO-CODIGO = [2, 7, 17, 44];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */