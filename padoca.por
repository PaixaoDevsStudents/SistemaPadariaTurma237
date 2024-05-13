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
<<<<<<< HEAD
	const inteiro PROD = 5
=======
	const inteiro PROD = 6
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
	const inteiro VENDA = 4
	
	funcao inicio()
	{	

		//variaveis
<<<<<<< HEAD
		inteiro arquivo, menu=0, qtd_estoque=0, id_produto=0
		real val_uni=0.0, val_custo=0.0
		cadeia nome_produto="", vetsrc[5], typdata[2]={"arquivodetexto|txt","arquivodetexto|txt"}, password="admin"
		inteiro opcao
<<<<<<< HEAD
=======
		inteiro arquivo, mnu=0, qtd_estoque=0, id_produto=0
		real val_uni=0.0, val_custo=0.0
		cadeia nome_produto="", vetsrc[5], typdata[2]={"arquivodetexto|txt","arquivodetexto|txt"}, password="admin"
		inteiro opcao
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
		logico saida=verdadeiro
		escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
		
		
<<<<<<< HEAD
=======
		inteiro numDeVet[3]
		logico saida = verdadeiro
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
		//leitura de arquivos
		para(inteiro c=0;c<5;c++){
			escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)
		}
		//menu de opções
<<<<<<< HEAD
=======
		//leitura de arquivos
		
		//menu de opções
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
		para(inteiro c=0;c<5;c++){
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)
		}
		limpa()
<<<<<<< HEAD
<<<<<<< HEAD
		//leitura de arquivos
		
		//menu de opções
			imprime_menu(menu)
			limpa()
			escolha(menu){
=======
		faca{
=======
		faca{
			numDeVet[0] = totalProdutos(vetsrc[1])
			numDeVet[1] = totalProdutos(vetsrc[2])
			numDeVet[2] = totalProdutos(vetsrc[3])
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
			imprime_mnu(mnu)
			
			escolha(mnu){
>>>>>>> 5e90e0a044b6e0b70fca6b25b8c9c353cf224f35
				caso 1:
<<<<<<< HEAD
=======
					//cadastrar produtos
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
=======
		faca{
			imprime_mnu(mnu)
			
			escolha(mnu){
				caso 1:
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
					verifAcess(password)
					inteiro y=0
						escreva("Quantos produtos irá cadastrar?: ")
						leia(y)
						limpa()
					para(inteiro i=0; i<y; i++){
<<<<<<< HEAD
<<<<<<< HEAD
						escreva("aqui deve chamar a funcao  cad.prod")
=======
						cadastroProduto(vetsrc[1])
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
					}
					//cadastrar produtos
					
					//entrada de dados
					
					//processamento
					
					//saida de dados
<<<<<<< HEAD
=======
						numDeVet[0]++
						cadastroProduto(vetsrc[1], numDeVet[0])
						
					}
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
				pare
				caso 2:
					//realizar vendas
					pesquisarProduto(0,vetsrc,numDeVet)
=======
				pare
				caso 2:
					//realizar vendas
					
					//entrada de dados
					
					//processamento
					
					//saida de dados
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
				pare
				caso 3:
					//relatorio temporario
					
<<<<<<< HEAD
				pare
				caso 4:
<<<<<<< HEAD
					escreva("Deseja mesmo sair?")
=======
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
					saida=falso
					//fechar caixa

				pare
			}
		}enquanto(saida==verdadeiro)
	}
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
	/*funcao verificaBase(logico &basedados, cadeia vetsrc[], cadeia typdata[]){
			
	}*/
>>>>>>> 5e90e0a044b6e0b70fca6b25b8c9c353cf224f35
	funcao inteiro imprime_mnu(inteiro &opcao){
>>>>>>> 4338c882036d010b5e12f209ef465b8159d20518
=======
	funcao inteiro imprime_mnu(inteiro &opcao){
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
		escreva("Escolha uma opcao \n\n 1) Cadastrar produto         2) Registrar Venda\n 3) Relatorio Atual           4) Fechar Caixa e Sair\n\nDigite o numero referente a opção desejada: ")
		leia(opcao)
		limpa()
		retorne opcao
	}
<<<<<<< HEAD
	
	
=======
=======
					//entrada de dados
					
					//processamento
					
					//saida de dados
				pare
				caso 4:
					escreva("Deseja mesmo sair?")
					saida=falso
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
		}enquanto(saida==verdadeiro)
	}
	/*funcao verificaBase(logico &basedados, cadeia vetsrc[], cadeia typdata[]){
			
	}*/
	funcao inteiro imprime_mnu(inteiro &opcao){
		escreva("Escolha uma opcao \n\n 1) Cadastrar produto         2) Registrar Venda\n 3) Relatorio Atual           4) Fechar Caixa e Sair\n\nDigite o numero referente a opção desejada: ")
		leia(opcao)
		retorne opcao
	}funcao cad_produ(inteiro qtd_estoque,inteiro id_produto, inteiro val_uni,inteiro val_custo,cadeia nome_produto){
		
	}
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
	funcao realizarVenda(cadeia vetorProd[], cadeia vetorVend[], cadeia caminho[], cadeia linhaOriginal, inteiro posicao,inteiro vetDeNum[]){
		//se existir produtlo escolhido
		se(vetorProd[0] != ""){
			//define valores default do vetor de vendas
			para(inteiro i = 0; i < VENDA; i++){
				escolha(i){
					caso 0:
						vetorVend[i] = "0"
						pare
					caso 1:
						vetorVend[i] = ""
						pare
					caso 2:
						vetorVend[i] = "0"
						pare
					caso 3:
						vetorVend[i] = "0"
						pare
				}
			}
			
			inteiro opcaoInterna , saidaLoop = 0//declara variáveis de opção e saida de loop
			inteiro quantidadeVend = 0//Variável para a quantidade de produtlos que será comprada.
<<<<<<< HEAD
			real preco = typ.cadeia_para_real(vetorProd[3])//declara variável de preco e dá o preço do produtlo
=======
			real preco = typ.cadeia_para_real(vetorProd[2])//declara variável de preco e dá o preço do produtlo
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
			inteiro reposicao //variavel de quantidade de reposição de estoque
			
			cadeia linhaVend = ""//variável que guardará os dados atualizados da venda
			cadeia linhaVendD = ""
			cadeia linhaVendOrig = ""// variável que abrigará os dados antigos da venda
			cadeia linhaVendOrigD = ""
			cadeia linhaSubsProd = ""// variável que irá guradar os dados atualizados do produtlo
			real valorTotal = 0.0//variável para o valor total da compra
			real valorTotalD = 0.0
			inteiro limite = 0 //variável para o limite de estoque
			//loop para entrada de quantidade
			faca{
<<<<<<< HEAD
				limite = typ.cadeia_para_inteiro(vetorProd[2], 10)//váriavel limite de estoque recebe limite de estoque
=======
				limite = typ.cadeia_para_inteiro(vetorProd[1], 10)//váriavel limite de estoque recebe limite de estoque
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
				//se estoque foi esgotado
				se(limite == 0){
					escreva("Produtlo foi esgotado!! Reposição do estoque foi solicitada\n")
					reposicao = entradaBaseInteiro("Insira o número da reposicao: ")//reposição recebe a reposição de estoque
					//loop para receber receber o uma diferença do estoque
					para(inteiro i = 0; i < PROD; i++){
						//se iterador for igual a posição do valor do estoque
<<<<<<< HEAD
						se(i == 2){
=======
						se(i == 1){
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
							vetorProd[i] = ""//vetor de produtlo com id de estoque é limpado
							vetorProd[i] += reposicao //vetor de produtlo com id de estoque é substituido pelo valor de reposição
						}
						linhaSubsProd += "/"+vetorProd[i]+"/"//linhaSubsProd concatena os dados do vetor do produtlo
					}
					src.substituir_texto(caminho[0], linhaOriginal, linhaSubsProd, verdadeiro)//substitui os dados antigos do estoque pelos novos
<<<<<<< HEAD
					limite = typ.cadeia_para_inteiro(vetorProd[2], 10)//váriavel limite de estoque recebe NOVO limite de estoque
=======
					limite = typ.cadeia_para_inteiro(vetorProd[1], 10)//váriavel limite de estoque recebe NOVO limite de estoque
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
				}
				//usuário escolhe a quantidade de compra
				quantidadeVend = entradaBaseInteiro("Insira a quantidade do produtlo que deseja comprar: ")

				//se usuário passar do limite de estoque ou for abaixo de zero
				se(quantidadeVend > limite){
					escreva("Quantidade inválida!! Passou da quantidade de estoque.\n")
				}
				se(quantidadeVend <= 0 ){
					escreva("Quantidade inválida!! Está igual ou abaixo de zero.\n")
				}
			}enquanto(quantidadeVend <= 0 ou quantidadeVend > limite e saidaLoop != 1)
<<<<<<< HEAD
			escreva(linhaSubsProd)
=======
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
			//texto de opções de pagamento
			escreva("===================\n")
			escreva("Opções de pagamento\n")
			escreva("1: Dinheiro\n2: PIX\n3: Cartão de crédito/débito\n")
			escreva("===================\n")
			//escolha para opção de pagamento
			faca{
				//usuário escolhe o pagamento que deseja entrar
				opcaoInterna = entradaBaseInteiro("Insira a opção de pagamento: ")
				//se usuário colocar uma opção inválida 
				se(opcaoInterna <= 0 ou opcaoInterna > 3){
					escreva("Opção inválida!! por favor, somente opções válidas.\n")
				}
			}enquanto(opcaoInterna <= 0 ou opcaoInterna > 3)
			//escolha caso para pagamento
			escolha(opcaoInterna){
				//caso dinheiro ou pix: 10% de desconto
				caso 1:caso 2:
					//se opção for dinheiro escreve texto sobre a escolha
					se(opcaoInterna == 1){escreva("Forma de pagamento em dinheiro foi escolhido.\n10% de desconto foi acrescentado ao valor da compra.\n")}
					//se opção for PIX escreve texto sobre a escolha
					se(opcaoInterna == 2){escreva("Forma de pagamento em PIX foi escolhido.\n10% de desconto de acrescimo foi acrescentado ao valor da compra.\n")}
<<<<<<< HEAD
					valorTotal += (preco * quantidadeVend)//valorTotal recebe o valor da compra
					
=======
					valorTotal += (preco * quantidadeVend) - (preco * quantidadeVend)*0.1//valorTotal recebe o valor da compra
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
					valorTotalD += valorTotal
					pare
				// caso cartão: acréscimo de 3%
				caso 3:
					//opção foi cartão, escreve texto sobre escolha
					escreva("Forma de pagamento em cartão de crédito/débito foi escolhido.\n3% de acrescimo foi acrescentado ao valor da compra.\n")
<<<<<<< HEAD
					valorTotal += (preco * quantidadeVend)//valorTotal recebe o valor da compra
=======
					valorTotal += (preco * quantidadeVend) + (preco * quantidadeVend)*0.03//valorTotal recebe o valor da compra
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
					valorTotalD += valorTotal
					pare
			}
			
<<<<<<< HEAD
			vetorProd[2] = ""//vetor de produtlo com id de estoque é limpo
			vetorProd[2] += (limite - quantidadeVend)//vetor de produtlo com id de estoque recebe o estoque diminuído
			
			vetorVend[0] = ""//vetorVend com id de código é limpo do código de produtlo anterior
			vetorVend[0] = typ.inteiro_para_cadeia(posicao, 10)//vetorVend com id de código de venda recebe código de produtlo atual
			
			vetorVend[1] = ""//vetorVend com id de nome é limpo do nome de produtlo anterior 
			vetorVend[1] += vetorProd[1] //vetorVend com id de nome recebe nome do produtlo atual
			
=======
			vetorProd[1] = ""//vetor de produtlo com id de estoque é limpo
			vetorProd[1] += (limite - quantidadeVend)//vetor de produtlo com id de estoque recebe o estoque diminuído
			vetorVend[0] = ""//vetorVend com id de código é limpo do código de produtlo anterior
			vetorVend[0] = typ.inteiro_para_cadeia(posicao, 10)//vetorVend com id de código de venda recebe código de produtlo atual
			vetorVend[1] = ""//vetorVend com id de nome é limpo do nome de produtlo anterior 
			vetorVend[1] += vetorProd[0] //vetorVend com id de nome recebe nome do produtlo atual
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
			valorTotal = mat.arredondar(valorTotal, 2)//valor Total da compra é arredondado para duas casas
			valorTotalD = mat.arredondar(valorTotalD, 2)
			//texto de dados da compra
			escreva("======================\n")
			escreva("|Dados da compra: 	\n")
			escreva("|Código: ",vetorVend[0],"\n|Nome: ",vetorVend[1],"\n|Quantidade: ",quantidadeVend,"\n|Preço da compra do produtlo: ",valorTotal,"\n")
			escreva("======================\n")
			

			linhaSubsProd = ""//linhaSubsProd é limpo
			//loop para concatenar dados de produtlo a linha de atualização do produtlo
			para(inteiro i = 0; i < PROD; i++){
				linhaSubsProd += "/"+vetorProd[i]+"/"//linhaSubsProd concatena os dados do produtlo que será atualizado
			}
			inteiro i = 1//iterador
			inteiro cod, codD // variável que armazena código do produtlo
			cadeia vetorOrig[] = {"0","","0","0"},// cria vetor que abrigará as leituras dos produtlos iterados
			
			vetorOrigD[] = {"0","","0","0"},
			vetorVendD[] = {"0","","0","0"}
			
<<<<<<< HEAD
			inteiro arqVenda = src.abrir_arquivo(caminho[2], src.MODO_LEITURA)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de leitura
			,arqVendaDiaria = src.abrir_arquivo(caminho[3], src.MODO_LEITURA)
=======
			inteiro arqVenda = src.abrir_arquivo(caminho[1], src.MODO_LEITURA)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de leitura
			,arqVendaDiaria = src.abrir_arquivo(caminho[2], src.MODO_LEITURA)
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
			
			leiaProduto(vetorOrigD, arqVendaDiaria)//lê primeiro produtlo temporário e passa para vetor vetorOrigD
			leiaProduto(vetorOrig, arqVenda)//lê primeiro produtlo e passa para veto vetorOrig
			
			cod = typ.cadeia_para_inteiro(vetorOrig[0], 10)//cod recebe código do primeiro produtlo vendido
			codD = typ.cadeia_para_inteiro(vetorOrigD[0], 10)
			inteiro quantidadeVendTot = typ.cadeia_para_inteiro(vetorOrig[2], 10)//quantidadeVendTot recebe a quantidade do primeiro produtlo vendido
			,quantidadeVendTotD = typ.cadeia_para_inteiro(vetorOrigD[2], 10)
			logico chave1, chave2
			
			//loop para processo de venda
			faca{
				//se código de produtlo vendido for igual a produtlo selecionado ou venda de produtlo com código ainda não foi registrado
				se(cod == posicao ou cod == 0){chave1 = verdadeiro}senao{chave1 = falso}
				se(codD == posicao ou codD == 0){chave2 = verdadeiro}senao{chave2 = falso}
				se(chave1 e chave2){
					//loop para concatenar dados originais do produtlo vendido  
					para(inteiro j = 0; j < VENDA; j++){
							linhaVendOrig += "/"+vetorOrig[j]+"/"
							linhaVendOrigD += "/"+vetorOrigD[j]+"/"
					}
					
					//se venda de produtlo com código ainda não foi registrado
					se(cod == 0){
						valorTotal += 0 // valorTotal é somado com zero
						quantidadeVendTot = quantidadeVend // quantidadeVendTot recebe valor de de quantidade de produtlo da compra atual
					}
					se(codD == 0){
						valorTotalD += 0
						quantidadeVendTotD = quantidadeVend // quantidadeVendTot recebe valor de de quantidade de produtlo da compra atual
					}
					//se código de produtlo vendido for igual a produtlo selecionado 
					se(cod == posicao){
						valorTotal += typ.cadeia_para_real(vetorOrig[3]) //valorTotal da compra soma o valor atual com o valor registrado da compra do produtlo
						quantidadeVendTot += quantidadeVend//quantidadeVendTot recebe soma da quantidade atual de produtlos vendidos com o valor registrado da compra do produtlo
					}
					se(codD == posicao ){
						valorTotalD += typ.cadeia_para_real(vetorOrigD[3]) //valorTotal da compra soma o valor atual com o valor registrado da compra do produtlo
						quantidadeVendTotD += quantidadeVend //quantidadeVendTot recebe soma da quantidade atual de produtlos vendidos com o valor registrado da compra do produtlo
					}
					
					src.fechar_arquivo(arqVendaDiaria)//fechando PRODBase de vendas em modo de leitura
					src.fechar_arquivo(arqVenda)//fechando PRODBase de vendas em modo de leitura
					
<<<<<<< HEAD
					arqVenda = src.abrir_arquivo(caminho[2], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
					arqVendaDiaria = src.abrir_arquivo(caminho[3], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
=======
					arqVenda = src.abrir_arquivo(caminho[1], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
					arqVendaDiaria = src.abrir_arquivo(caminho[2], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
					//se venda de produtlo com código ainda não foi registrado 
					se(cod == 0 ou codD == 0){
						//loop para atribuir dados de venda a vetorVend
						para(inteiro j = 0; j < VENDA; j++){
							vetorVendD[j] = vetorVend[j]
							//escolha caso para atribuir dados aos ids especificos do vetorVend
							escolha(j){
								//iterador é no id de quantidade
								caso 2:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] = typ.inteiro_para_cadeia(quantidadeVendTot, 10)// passa dados de quantidadeVendTot convertida para cadeia 
									vetorVendD[j] = ""
									vetorVendD[j] = typ.inteiro_para_cadeia(quantidadeVendTotD, 10)// passa dados de quantidadeVendTot convertida para cadeia 
									pare
								//iterador é no id de valorTotal
								caso 3:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] += mat.arredondar(valorTotal, 2)//concatena valorTotal
									vetorVendD[j] = ""// limpa valor no vetor
									vetorVendD[j] += mat.arredondar(valorTotalD, 2)//concatena valorTotal
									pare
							}
							se(cod == 0){
								linhaVend += "/"+vetorVend[j]+"/"//linha concatena valor de venda
							}
							se(codD == 0){
							linhaVendD += "/"+vetorVendD[j]+"/"
							}
						}
						se(cod == 0){
							src.escrever_linha(linhaVend, arqVenda)//adiciona produtlo ao PRODBase de Vendas
						}
						se(codD == 0){
							src.escrever_linha(linhaVendD, arqVendaDiaria)
							
						}
					}
					//se código de produtlo vendido for igual a produtlo selecionado
					se(cod == posicao ou codD == posicao){
						para(inteiro j = 0; j < VENDA; j++){
							//escolha caso para atribuir dados aos ids especificos do vetorVend
							vetorVendD[j] = vetorVend[j]
							escolha(j){
								//iterador é no id de quantidade
								caso 2:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] = typ.inteiro_para_cadeia(quantidadeVendTot, 10)// passa dados de quantidadeVendTot convertida para cadeia
									vetorVendD[j] = ""// limpa valor no vetor temp
									vetorVendD[j] =  typ.inteiro_para_cadeia(quantidadeVendTotD, 10)// passa dados de quantidadeVendTot convertida para cadeia temp
									pare
								//iterador é no id de valorTotal
								caso 3:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] += mat.arredondar(valorTotal, 2)//concatena valorTotal
									vetorVendD[j] = ""// limpa valor no vetor temp
									vetorVendD[j] += mat.arredondar(valorTotalD, 2)//concatena valorTotalD
									pare
							}
							se(cod == posicao){
								linhaVend += "/"+vetorVend[j]+"/"
							}
							se(codD == posicao){
								linhaVendD += "/"+vetorVendD[j]+"/"//linha concatena valor de venda
							}
						}
						//substitui os dados antigos de venda do produtlo pelos novos dados atualizados
						se(cod == posicao){
<<<<<<< HEAD
							src.substituir_texto(caminho[2], linhaVendOrig, linhaVend, verdadeiro)
						}
						se(codD == posicao){
							src.substituir_texto(caminho[3], linhaVendOrigD, linhaVendD, verdadeiro)
						}
					}
					//substitui os dados antigos do produtlo vendido pelos novos dados atualizados
					src.substituir_texto(caminho[1], linhaOriginal, linhaSubsProd, verdadeiro)
=======
							src.substituir_texto(caminho[1], linhaVendOrig, linhaVend, verdadeiro)
						}
						se(codD == posicao){
							src.substituir_texto(caminho[2], linhaVendOrigD, linhaVendD, verdadeiro)
						}
					}
					//substitui os dados antigos do produtlo vendido pelos novos dados atualizados
					src.substituir_texto(caminho[0], linhaOriginal, linhaSubsProd, verdadeiro)
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
					src.fechar_arquivo(arqVendaDiaria)//fecha arquivo
					src.fechar_arquivo(arqVenda)//fecha arquivo
					saidaLoop = 1 //sai do loop
				}
				//senão
				senao {
					//se condicional de arquivo permanente for falsa
					se(chave1 == falso){
						//lê os dados da venda e passa para vetor
						leiaProduto(vetorOrig, arqVenda)
						inteiro codProximo = typ.cadeia_para_inteiro(vetorOrig[0], 10)//vê o código do do próximo produtlo
						// se código anterior é igual a próximo código
						se(cod == codProximo ){
							cod = 0	//código recebe 0
							quantidadeVendTot = 0// quantidadeVendTot recebe 0
						}
						//senão, se código anterior é diferente a próximo código ou está no último produtlo
						senao se (cod != codProximo ou i == vetDeNum[1]){
							cod = codProximo // cod recebe próximo código
							quantidadeVendTot = typ.cadeia_para_inteiro(vetorOrig[2], 10)//quantidadeVendTot recebe quantidade dos dados de venda
						}
					}
					//se condicional de arquivo temporaria for falsa
					se(chave2 == falso){
						//lê os dados da venda e passa para vetor
						leiaProduto(vetorOrigD, arqVendaDiaria)
						inteiro codProximoD = typ.cadeia_para_inteiro(vetorOrigD[0], 10)//vê o código do do próximo produtlo
						// se código anterior é igual a próximo código
						se(codD == codProximoD ){
							codD = 0	//código recebe 0
							quantidadeVendTotD = 0// quantidadeVendTot recebe 0
						}
						//senão, se código anterior é diferente a próximo código ou está no último produtlo
						senao se (codD != codProximoD ou i == vetDeNum[2]){
							codD = codProximoD // cod recebe próximo código
							quantidadeVendTotD = typ.cadeia_para_inteiro(vetorOrigD[2], 10)//quantidadeVendTot recebe quantidade dos dados de venda
						}
					}
					i++// iterador de produtlo é incrementado +1
					 
					
				}
			}enquanto(saidaLoop != 1)
		}
	}
     funcao cadeia filtrarCaracteres(cadeia nome){
		para(inteiro i = 0; i < txt.numero_caracteres(nome); i++){
			caracter x = txt.obter_caracter(nome, i)// caracter a ser analisado
			cadeia letra //cadeia que representa caracter analisado
			//escolha para substituir caracteres especiais indesejados e pelos seu naturais ou desejados
			escolha(x){
				//filtra a
				caso 'ã':caso 'â':caso 'á':caso 'à':caso 'ä':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "a")
					pare
				//filtra A
				caso 'Ã':caso 'Â':caso 'Á':caso 'À':caso 'Ä':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "A")
					pare
				//filtra e
				caso 'ê':caso 'ë':caso 'é':caso 'è':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "e")
					pare
				//filtra E
				caso 'Ê':caso 'Ë':caso 'É':caso 'È':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "E")
					pare
				//filtra o
				caso 'õ':caso 'ô':caso 'ó':caso 'ò':caso 'ö':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "o")
					pare
				//filtra O
				caso 'Õ':caso 'Ô':caso 'Ó':caso 'Ò':caso 'Ö':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "O")
					pare
				//filtra i
				caso 'î':caso 'í':caso 'ì':caso 'ï':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "i")
					pare
				//filtra I
				caso 'Î':caso 'Í':caso 'Ì':caso 'Ï':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "I")
					pare
				//filtra u
				caso 'û':caso 'ú':caso 'ù':caso 'ü':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "u")
					pare
				//filtra U
				caso 'Û':caso 'Ú':caso 'Ù':caso 'Ü':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "U")
					pare
				//filtra n
				caso 'ñ':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "n")
					pare
				//filtra N
				caso 'Ñ':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "N")
					pare
				//filtra c
				caso 'ç':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "c")
				//filtra C
				caso 'Ç':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "C")
					pare
				//filtra Y
				caso 'Ý':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "Y")
					pare
				//filtra y
				caso 'ý': caso 'ÿ':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "y")
					pare
				//filtra caracteres indesejados
				caso '|':caso '\\':caso '/':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "")
					pare
				//filtra caracter de separação de dados
				caso ':':
					letra = typ.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "-")
					pare
			}
		}
		retorne nome
	}
<<<<<<< HEAD
	funcao pesquisarProduto(inteiro id,cadeia caminho[], inteiro vetDeNum[]){
		inteiro opcaoInterna, arquivo, saidaLoop, j = 1
		cadeia vetInfProd[5]
		cadeia vetInfVend[4]
		faca{
          	saidaLoop = 0
			//se tiver produtlos
          	se(vetDeNum[0] != 0){
         			//escolha da posição do arquivo
	          	faca{
					//usuário escolhe a matriz que deseja entrar
					escreva("Número de produtos do Arquivo: ",vetDeNum[0],"\n")
					opcaoInterna = entradaBaseInteiro("Insira o código do produto: ")
					//se usuário colocar uma opção inválida 
					se(opcaoInterna <= 0 ou opcaoInterna > vetDeNum[0]){
						escreva("Número de inválido!!\n")
					}
				}enquanto(opcaoInterna <= 0 ou opcaoInterna > vetDeNum[0])
				arquivo = src.abrir_arquivo(caminho[1], src.MODO_LEITURA)
=======
	funcao pesquisarProdutlo(inteiro id, inteiro numDeDados[],cadeia vetInfProd[], cadeia vetInfVend[], cadeia caminho[], inteiro vetDeNum[]){
		inteiro opcaoInterna, arquivo, saidaLoop, j = 1
		faca{
          	saidaLoop = 0
			//se tiver produtlos
          	se(numDeDados[0] != 0){
         			//escolha da posição do arquivo
	          	faca{
					//usuário escolhe a matriz que deseja entrar
					escreva("Número de produtlos do Arquivo: ",numDeDados[0],"\n")
					opcaoInterna = entradaBaseInteiro("Insira o código do produtlo: ")
					//se usuário colocar uma opção inválida 
					se(opcaoInterna <= 0 ou opcaoInterna > numDeDados[0]){
						escreva("Número de  inválido!!\n")
					}
				}enquanto(opcaoInterna <= 0 ou opcaoInterna > numDeDados[0])
				arquivo = src.abrir_arquivo(caminho[0], src.MODO_LEITURA)
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
				//verificar o produtlo
				faca{
					//se opcaoInterna for igual a posição da linha do produtlo escolhido
					se(opcaoInterna == j){	
						leiaProduto(vetInfProd,arquivo)//lê linha
						cadeia linhaOriginal = ""
						para(inteiro i = 0; i < PROD; i++){
							linhaOriginal += "/"+vetInfProd[i]+"/"
						}
<<<<<<< HEAD
						escreva(linhaOriginal)
						src.fechar_arquivo(arquivo)//fecha arquivo
						//escreve informações do produtlo escolhido
						escrevaProdutoVenda(id,vetInfProd,vetInfVend)
=======
						src.fechar_arquivo(arquivo)//fecha arquivo
						//escreve informações do produtlo escolhido
						escrevaProdutoVenda(id,vetInfProd,vetInfVend,j)
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
						//se sim sai do loop, se não limpa vetor e sai do loop
						saidaLoop = escolhas("Deseja escolher este produtlo:\n1: Sim\n2: Não\n")
						//se produtlo não foi escolhido, limpa o vetor e sai
						se(saidaLoop == 1){
							para(inteiro i = 0; i< PROD; i++){
								vetInfProd[i] = ""
							}
							saidaLoop = 1		
						}
						//se produtlo foi escolhido, realiza venda e sai
						senao{
							realizarVenda(vetInfProd, vetInfVend, caminho, linhaOriginal, j, vetDeNum)
							saidaLoop = 1
						}
					}
					//senão ignora matriz e iterador de posição acrescenta +1
					senao{
						leiaProduto(vetInfProd,arquivo)
						j++
					}
				}
<<<<<<< HEAD
				enquanto(j <= vetDeNum[0] e saidaLoop != 1)		
=======
				enquanto(j <= numDeDados[0] e saidaLoop != 1)		
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
          	}
          	//senão
          	senao{
          		escreva("Não há produtlos cadastrados para realizar venda.\n")
          		saidaLoop = 1//sai do loop
          	}
		}enquanto(saidaLoop != 1)
          saidaLoop = 0
	}
<<<<<<< HEAD
	funcao inteiro totalProdutos(cadeia caminho){
=======
	funcao inteiro totalProdutlos(cadeia caminho){
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
		cadeia linha = ""//variável para receber linha do arquivo
		inteiro arquivo = src.abrir_arquivo(caminho, src.MODO_LEITURA)//váriavel arquivo recebe permissão para abrir e somente ler o arquivo com matrizes
		inteiro numDeLinhas = -1//o número de linhas utlilizadas
		//loop para contar o número de linhas que tem abertas no arquivo
		faca{
			linha = src.ler_linha(arquivo)//linha recebe a leitura da linha do arquivo
			numDeLinhas++// numdelinhas é adicionado + 1
		}enquanto(src.fim_arquivo(arquivo) == falso)
		src.fechar_arquivo(arquivo)//fecha arquivo
		//retorna a quantidade de matrizes
		retorne numDeLinhas
	}
	funcao cadeia caminhoDoArquivo(cadeia texto){
		cadeia entrada = ""//cadeia que recebe caminho do usuário
		inteiro saidaLoop = 0
		//faz enquanto o valor saidaloop != 1
		faca{
			escreva(texto)
			cadeia tiposArq[2] = {"Arquivo de texto|txt", "Arquivo de texto|txt"}
			entrada = src.selecionar_arquivo(tiposArq, verdadeiro)
			//se caminho é válido
			se(src.arquivo_existe(entrada) == verdadeiro){
				saidaLoop = 1//sai do loop
			}
			//senão, o caminho é inválido
			senao{
				escreva("Caminho inválido!! Insira um caminho que possua um arquivo que exista!!\n")
			}
		}enquanto(saidaLoop != 1)
		//retorna caminho
		retorne entrada
		
	}
<<<<<<< HEAD
<<<<<<< HEAD
	funcao cadastroProduto(cadeia caminho){
=======
	funcao cadastroProduto(cadeia caminho, inteiro numDeProd){
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
=======
	funcao cadastroProduto(cadeia caminho){
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
		cadeia vetor[PROD]
		//loop para limpar o vetor de valores vazios
		para(inteiro i = 0; i< PROD; i++){
			vetor[i] = ""
		}
<<<<<<< HEAD
		vetor[0] += numDeProd
		limpa()
		//Vetor com idnomes recebe entrada de usuário do nome do produtlo
		vetor[1] += filtrarCaracteres(entradaBaseCadeia("Digite o nome do produtlo: "))
		limpa()
		//Vetor com id de stock recebe entrada de usuário do número de stock
		vetor[2] += entradaBaseInteiro("Digite a quantidade do produtlo que tem no estoque de hoje: ")
		limpa()
          //Vetor com id de precos recebe entrada de usuário do preço do produtlo
          vetor[3] += mat.arredondar(entradaBaseReal("Digite o preço do produtlo: "), 2)
          limpa()
          //vetor com id de custo recebe entrada de usuário do custo do produtlo
          vetor[4] += entradaBaseReal("Digite o custo do produtlo: ")
          limpa()
=======
		//Vetor com idnomes recebe entrada de usuário do nome do produtlo
		vetor[0] += filtrarCaracteres(entradaBaseCadeia("Digite o nome do produtlo: "))
		//Vetor com id de stock recebe entrada de usuário do número de stock
		vetor[1] += entradaBaseInteiro("Digite a quantidade do produtlo que tem no estoque de hoje: ")
          //Vetor com id de precos recebe entrada de usuário do preço do produtlo
          vetor[2] += mat.arredondar(entradaBaseReal("Digite o preço do produtlo: "), 2)
          //vetor com id de custo recebe entrada de usuário do custo do produtlo
          vetor[3] += entradaBaseReal("Digite o custo do produtlo: ")
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
          passeProduto(1, caminho , vetor)//passa os dados do produtlo para o arquivo
	}
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
	funcao passeProduto(inteiro id,cadeia caminho, cadeia vetor[]){
		inteiro arquivo = 0
		cadeia linha = ""
		escolha(id){
			//MODO ESCRITA
			caso 0:
				arquivo = src.abrir_arquivo(caminho, src.MODO_ESCRITA)//variável arquivo recebe permissão para abrir e somente escrever no arquivo com matrizes
				pare
			//MODO ACRESCENTAR 
			caso 1:
				arquivo = src.abrir_arquivo(caminho, src.MODO_ACRESCENTAR)//variável arquivo recebe permissão para abrir e somente acrescentar no arquivo com matrizes
				pare
		}
		para(inteiro i = 0; i < utl.numero_elementos(vetor); i++){
			linha += "/"+vetor[i]+"/"//linha acrescenta a si os dados do produtlo
		}
		src.escrever_linha(linha, arquivo)//escreve a linha no arquivo e pula pra próxima
		src.fechar_arquivo(arquivo)//fechar arquivo
	}
	funcao ordenacaoVend(inteiro p, inteiro k, cadeia dadosDeVenda[], inteiro arquivoVendaD, inteiro numDeVendasDiaria, cadeia caminhoDeVendasDiaria){
		se(dadosDeVenda[0] != ""){
          	//título		
          	escreva("++++++++++++++++++++++++++\n")
          	escreva("REGISTROS DE VENDAS DO DIA\n")
          	escreva("++++++++++++++++++++++++++\n")
			//loop para organizar a escritura dos códigos 					
			faca{
									
				se(typ.cadeia_para_inteiro(dadosDeVenda[0], 10) == k){
					escreva("===============================================================================================================\n")
					escreva("|Código:"+dadosDeVenda[0]+"|Nome: "+dadosDeVenda[1]+"|Quantidade vendida: "+dadosDeVenda[2]+"|Valor total de vendas do produtlo: "+dadosDeVenda[3]+"|\n")	
					escreva("===============================================================================================================\n")
					k++
				}
				leiaProduto(dadosDeVenda, arquivoVendaD)//lê o produtlo vendido e passa para vetor
				p++
				se(p > numDeVendasDiaria){
					p = 1
					se(k <= numDeVendasDiaria){
						src.fechar_arquivo(arquivoVendaD)
						arquivoVendaD = src.abrir_arquivo(caminhoDeVendasDiaria, src.MODO_LEITURA)					
					}
				}
				
			}enquanto(p <=numDeVendasDiaria e k <= numDeVendasDiaria)
		}
		senao{escreva("Não há registros de vendas no dia.\n")}
          src.fechar_arquivo(arquivoVendaD)
<<<<<<< HEAD
	}
	funcao escrevaProdutoVenda(inteiro id, cadeia vetor[],cadeia vetorVend[]){
=======
		
	}
	funcao escrevaProdutoVenda(inteiro id, cadeia vetor[],cadeia vetorVend[],inteiro cod){
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
		escolha(id){
			//escreve produto
			caso 0:
				escreva("Informações do produto:\n")
				escreva("===============================================================================================================\n")
<<<<<<< HEAD
				escreva("|Código ID: ",vetor[0],"|Nome: ",vetor[1],"|Quantidade em estoque: ",vetor[2],"|Preço por unidade: ",vetor[3],"|Custo por unidade: ",vetor[4]," |\n")	
=======
				escreva("|Código ID: ",cod,"|Nome: ",vetor[0],"|Quantidade em estoque: ",vetor[1],"|Preço por unidade: ",vetor[2],"|Custo por unidade: ",vetor[3]," |\n")	
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
				escreva("===============================================================================================================\n")
				pare
			//escreve
			caso 1:
				escreva("===============================================================================================================\n")
				escreva("|Nome: ",vetorVend[0],"|Quantidade vendida: ",vetorVend[1],"|Valor da compra do produto: ",vetorVend[2]," |\n")	
				escreva("===============================================================================================================\n")
				pare
		}
		
	}
	funcao cadeia entradaBaseCadeia(cadeia texto)//função que trata erros
     {
     	cadeia opcao
          caracter saida = ' '//Váriavel de saída.
          //Faça-enquanto para verificar a entrada do usuário.
          faca {
               escreva(texto)//Escreve o texto recebido pelo parâmetro.
               leia(opcao)//Parâmetro opçao recebe valor do usuário.
               //Se opcao for real ou inteiro ou vazio.
               se (typ.cadeia_e_real(opcao) == verdadeiro ou typ.cadeia_e_inteiro(opcao, 10) == verdadeiro ou opcao == "")
               {
                    //Opcão inválida.
                    escreva("Opção inválida!! Por favor, somente nomes ou palavras.\n")
               }
               senao
               {
				saida = 'e'//Variável saida recebe valor de saída.
               }
          }
          enquanto (saida != 'e')//Repete enquanto variável saida não tiver valor de saída.
		//Retorna a valor de entrada do usuário.
          retorne opcao
     }
	funcao real entradaBaseReal(cadeia texto)//tratamento de erro para variavel do tipo real
     {
     	cadeia opcao
          caracter saida = ' '//variavel de saida
          real x = 0.0//variavel de retorno
          //Faça-enquanto para verificar a entrada do usuário.
          faca 
          {
               escreva(texto)//Escreve o texto recebido pelo parâmetro.
               leia(opcao)//Parâmetro opçao recebe valor do usuário.
               //Se opcao não for um número real.
               se (typ.cadeia_e_real(opcao) == falso e typ.cadeia_e_inteiro(opcao,10) == falso)
               {
               	//Opção inválida.
                    escreva("Opção incorreta!! Por favor, somente números reais.\n")
               }
               senao 
              	{
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
               }
          }
          enquanto (saida != 'e')//repete enquanto saida não tiver valor de saída.
          //retorna variável de retorno x
          retorne x
     }
     funcao inteiro entradaBaseInteiro(cadeia texto)//tratamento de erro variavel do tipo inteiro
     {
     	cadeia opcao
          caracter saida = ' '//variável de saída.
          inteiro x = 0//variável de retorno.
          //Faça-enquanto para verificar a entrada do usuário
          faca {
               escreva(texto)//escreve o texto do parâmetro texto.
               leia(opcao)//opcao lê e recebe entrada de usuário.
               //se opcao não for inteiro 
               se (typ.cadeia_e_inteiro(opcao, 10) == falso) {
              		//Opção inválida. 
                    escreva("Opção inválida!! Por favor, somente números inteiros.\n")
               }
               senao {
                    x = typ.cadeia_para_inteiro(opcao, 10)//x recebe opcao convertida de cadeia pra inteiro.
                    //escolha caso para o tipo de resposta que o inteiro deve dar.
                    
				se (x >= 0) {
                    	saida = 'e'//sai do loop.
                    }
				senao {
					escreva("Opção inválida!! Por favor, somente números acima de zero.\n")
				}
				pare
                         
               }
          }
          enquanto (saida != 'e')// repete enquanto saida não receber valor de saída
          //retorna valor de x
          retorne x
     }
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e90e0a044b6e0b70fca6b25b8c9c353cf224f35
=======
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
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
<<<<<<< HEAD
				contador=0
=======
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
				limpa()
			}
			escreva("Senha incorreta!Tente novamente:\n->")
			leia(senha)
			limpa()
			se(senha=="x" ou senha=="X"){
				inicio()
			}
		}
<<<<<<< HEAD
     }
<<<<<<< HEAD
=======
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
=======
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
	funcao inteiro escolhas(cadeia texto){
     	inteiro saidaLoop = 0
     	faca{
			escreva(texto)
			inteiro opcaoInterna = entradaBaseInteiro("Insira a opção: ")//recebe opção do usuário
			escolha(opcaoInterna){
				//Sim
				caso 1:
					saidaLoop = 2//continua programa
					pare
				//Não
				caso 2:
					saidaLoop = 1//finaliza o programa
					pare
				//Resposta inválida
				caso contrario:
					escreva("Opção inválida!! por favor, somente opções válidas.\n")
					pare
			}
		}enquanto(saidaLoop != 1 e saidaLoop != 2)
		retorne saidaLoop
     }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
	

	funcao vazio quantidadeEstoque(){
		inteiro estoque1
		inteiro quantidade1
		
		escreva("\n------------------calcular a quantidade de estoque--------------------------\n")
  
		escreva("Digite o número de estoque1 : ")
		leia(estoque1)

         escreva("Digite o  número de quantidade1 : ")
		leia(quantidade1)

		quantidade1 = estoque1 - quantidade1

	escreva("\nResultado : " , quantidade1 , "  \n")
	}
	  funcao vazio calcularBaixaEstoque() 
	{ 
		inteiro estoque2
	     inteiro quantidade2
		
		escreva("Digite o número de estoque1 : ")
		leia(estoque2)

         escreva("Digite o  número de quantidade1 : ")
		leia(quantidade2)
		
		se (estoque2 > quantidade2) 
		{
			escreva(estoque2+ " = estoque e maior que quantidade : "+quantidade2 )// essa mensagem mostrar se estoque e maior que quantidade.
		}
		senao se (quantidade2 > estoque2) 
		{
			escreva(quantidade2+ " quantidade maior que estoque : " +estoque2)// essa mensagem mostrar se quantidade e  maior que estoque.
		}
		senao
		{
			escreva(estoque2+ " estoque e igual a quantidade : " +quantidade2)// essa mensagem vai mostrar se estoque e  igual a quantidade
		} 
		se
		(estoque2 == 0 )// se o estoque for igual a zero ele vai mostrar a mensagem no programa.
		{
		escreva("\n seu estoque acabou : " +quantidade2)// essa e a mensagem que será mostrado no programa para que possa mostrar se o estoque serou (acabou).
		}
		senao se(estoque2 == 1 )
		{
		escreva("\n seu estoque e esse : " + quantidade2)// essa mansagem será mostrada no programa se sobrou estoque no programa e mostrar a quantidade.
		}
		} 
	 

<<<<<<< HEAD
=======
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
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
=======
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
 * @POSICAO-CURSOR = 11326; 
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
 * @POSICAO-CURSOR = 11326; 
=======
 * @POSICAO-CURSOR = 23566; 
 * @DOBRAMENTO-CODIGO = [66, 71, 364, 463, 523, 536, 577, 627, 658, 676, 699, 738, 733, 764, 786];
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
=======
>>>>>>> abcc4d076158f119542c5d1ac7a09ed908900ee3
 * @POSICAO-CURSOR = 1741; 
=======
 * @POSICAO-CURSOR = 23566; 
 * @DOBRAMENTO-CODIGO = [66, 71, 364, 463, 523, 536, 577, 627, 658, 676, 699, 738, 733, 764, 786];
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
 * @POSICAO-CURSOR = 933; 
 * @DOBRAMENTO-CODIGO = [102, 109, 402, 501, 561, 574, 611, 642, 661, 692, 710, 733, 767];
>>>>>>> 5e90e0a044b6e0b70fca6b25b8c9c353cf224f35
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
=======
<<<<<<< HEAD
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
=======
>>>>>>> fd406edc21d57886cfc639ebe76d3eeb626b3ca1
>>>>>>> 4338c882036d010b5e12f209ef465b8159d20518
>>>>>>> b1d39e156e7921aa36d38535393fc7cd139d5dd3
=======
 * @POSICAO-CURSOR = 32673; 
 * @DOBRAMENTO-CODIGO = [15, 67, 73, 371, 470, 533, 546, 567, 589, 620, 639, 669, 687, 710, 744, 775, 797];
>>>>>>> b2bcef8b3717f232285b815cf900068dfe638ed1
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
=======
 * @POSICAO-CURSOR = 933; 
 * @DOBRAMENTO-CODIGO = [102, 109, 402, 501, 561, 574, 611, 642, 661, 692, 710, 733, 767];
>>>>>>> 5e90e0a044b6e0b70fca6b25b8c9c353cf224f35
>>>>>>> abcc4d076158f119542c5d1ac7a09ed908900ee3
=======
 * @POSICAO-CURSOR = 933; 
 * @DOBRAMENTO-CODIGO = [102, 109, 402, 501, 561, 574, 611, 642, 661, 692, 710, 733, 767];
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
=======
}
>>>>>>> 42e35df2b39bd7b17351cc6c1994165eccf3c02c
<<<<<<< HEAD
>>>>>>> 5e90e0a044b6e0b70fca6b25b8c9c353cf224f35
=======
>>>>>>> 2e7205b24d3a500a6772ed39023104bff92025a1
