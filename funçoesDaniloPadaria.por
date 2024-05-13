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
 * @POSICAO-CURSOR = 2106; 
 * @DOBRAMENTO-CODIGO = [2, 7, 17];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */