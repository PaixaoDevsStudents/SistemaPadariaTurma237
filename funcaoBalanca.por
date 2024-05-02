programa
{
	inclua biblioteca Matematica --> mat
	inclua biblioteca Tipos --> typ
	inclua biblioteca Util --> utl
	
	funcao vazio balanca (inteiro quantidadeCompraCliente,real compraEmGramas,real valorCobrarCliente,real valorDaG){
		//inteiro quantidadeCompraCliente=0
		//real valorDaG=0.056, compraEmGramas,valorCobrarCliente
		quantidadeCompraCliente = utl.sorteia(1, 1000)  // sorteando a quantidade que o cliente vai comprar, para simular uma balança 
		quantidadeCompraCliente = typ.inteiro_para_real(quantidadeCompraCliente) // mudando o valor de inteiro para real para poder usar zero apos a virgula pq o sorteia so roda com inteiro...
		compraEmGramas = (quantidadeCompraCliente * 1000) // converter Kg para gramas 
		valorCobrarCliente = ((valorDaG*compraEmGramas) / 1000) // converte gramas em reais $$ dindin
		valorCobrarCliente = mat.arredondar(valorCobrarCliente, 7)
		escreva("Valor a cobrar do cliente é:",valorCobrarCliente) // mostra o valor na tela a ser cobrado 
		/*
		1 kg pao pesa 56g
		1kg de pao vale 56,00
		logo: 
		10 paes = 10*56= 560g
		1kg pao = 5600/1000=0.056
		custa 0.056 centavos a grama 
		sortear o peso do pao 
		 */
		}
	
	funcao inicio()
	{
		inteiro quantidadeCompraCliente=0
		real valorDaG=0.08, compraEmGramas=0.0,valorCobrarCliente=0.0
		
		balanca(quantidadeCompraCliente,compraEmGramas,valorCobrarCliente,valorDaG)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1239; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */