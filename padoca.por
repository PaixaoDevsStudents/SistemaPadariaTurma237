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
	const inteiro PROD = 5
	const inteiro VENDA = 4
	
	funcao inicio()
	{	

		//variaveis
		inteiro arquivo, menu=0, qtd_estoque=0, id_produto=0
		real val_uni=0.0, val_custo=0.0
		cadeia nome_produto="", vetsrc[5], typdata[2]={"arquivodetexto|txt","arquivodetexto|txt"}, password="admin"
		inteiro opcao
		escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
		para(inteiro c=0;c<5;c++){
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)
		}
		limpa()
		//leitura de arquivos
		
		//menu de opções
			imprime_menu(menu)
			limpa()
			escolha(menu){
				caso 1:
					//Cadastrar produtos
					verifAcess(password)
					inteiro y=0
						escreva("Quantos produtos irá cadastrar?: ")
						leia(y)
						limpa()
					para(inteiro i=0; i<y; i++){
						escreva("aqui deve chamar a funcao  cad.prod")
					}
					inicio()
				pare
				caso 2:
					//realizar vendas
					
				pare
				caso 3:
					//relatorio temporario
					
				pare
				caso 4:
					//fechar caixa
					
				pare
				caso 5:
					//verificar acesso
					
				pare
				caso contrario:
				inicio()
			}
	}
<<<<<<< HEAD
	funcao inteiro imprime_menu(inteiro &opcao){
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
	funcao inteiro imprime_mnu(inteiro &opcao){
>>>>>>> 4338c882036d010b5e12f209ef465b8159d20518
		escreva("Escolha uma opcao \n\n 1) Cadastrar produto         2) Registrar Venda\n 3) Relatorio Atual           4) Fechar Caixa e Sair\n\nDigite o numero referente a opção desejada: ")
		leia(opcao)
		retorne opcao
	}
	
	
     funcao vazio verifAcess (cadeia password){
		cadeia senha
		inteiro contador=0
		escreva("Verificação de Acesso\n\nDigite a senha para continuar:\n->")
		leia(senha)
		limpa()
		se(senha=="x" ou senha=="X"){
			inicio()
		}
		enquanto(senha!=password){
			contador++
			se(contador==5){
				para(inteiro i=30;i>0;i--){
					limpa()
					escreva("Você errou demais, aguarde ",i," segundos para tentar novamente...")
					utl.aguarde(1000)
				}
				contador=0
				limpa()
			}
			escreva("Senha incorreta!Tente novamente:\n->")
			leia(senha)
			limpa()
			se(senha=="x" ou senha=="X"){
				inicio()
			}
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
<<<<<<< HEAD
 * @POSICAO-CURSOR = 11326; 
=======
<<<<<<< HEAD
 * @POSICAO-CURSOR = 1741; 
=======
 * @POSICAO-CURSOR = 23566; 
 * @DOBRAMENTO-CODIGO = [66, 71, 364, 463, 523, 536, 577, 627, 658, 676, 699, 738, 733, 764, 786];
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
 * @POSICAO-CURSOR = 1577; 
 * @DOBRAMENTO-CODIGO = [66, 75, 80, 90, 95, 388, 487, 547, 560, 581, 601, 632, 651, 682, 700, 723, 757, 788, 810];
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
>>>>>>> 4338c882036d010b5e12f209ef465b8159d20518
>>>>>>> b1d39e156e7921aa36d38535393fc7cd139d5dd3
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */