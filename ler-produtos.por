funcao cadeia leiaProduto(cadeia vetor[], inteiro arquivo){
		//loop for para cada elemento da coluna
		cadeia valor = "" //váriavel para colocar os valores retirados das matrizes dentro arquivo, começa limpa
		inteiro j = 0// variável para iterar linhas
		cadeia x = src.ler_linha(arquivo)//x recebe a linha a ser análisada
		// linha recebida é simplificada para ser processada
		cadeia texto = txt.substituir(x, "//", ":")
		texto = txt.substituir(texto, "/", "")
		/*
		Ex: 
		linha de produtlos antes de ser simplificada:
			/x//y//z/
		linha depois de ser simplificada:
			x:y:z
		*/
		//loop for para análisar a linha de dados do produtlo
			
		para(inteiro c = 0; c < txt.numero_caracteres(texto); c++){
			//se caracter de linha da matriz for número inteiro
			
			se(txt.obter_caracter(texto, c) != ':'){
				valor += txt.obter_caracter(texto, c)
				vetor[j] = valor
			}
			se(txt.obter_caracter(texto,c) == ':'){
				valor= ""//valor é limpado
				j++//iterador de coluna é acrescentada
			}
		}
		retorne vetor[0]
	}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1030; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */