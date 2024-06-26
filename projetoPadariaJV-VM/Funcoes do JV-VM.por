programa
{
	
	funcao inicio()
	{
		escreva("Olá Mundo")
	}
	funcao realizarVenda(cadeia vetorProd[], cadeia vetorVend[], cadeia caminho[], cadeia linhaOriginal, inteiro posicao,inteiro vetDeNum[]){
		//se existir produto escolhido
		se(vetorProd[0] != ""){
			//define valores default do vetor de vendas
			para(inteiro i = 0; i < VEN; i++){
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
			inteiro quantidadeVend = 0//Variável para a quantidade de produtos que será comprada.
			real preco = tp.cadeia_para_real(vetorProd[2])//declara variável de preco e dá o preço do produto
			inteiro reposicao //variavel de quantidade de reposição de estoque
			
			cadeia linhaVend = ""//variável que guardará os dados atualizados da venda
			cadeia linhaVendD = ""
			cadeia linhaVendOrig = ""// variável que abrigará os dados antigos da venda
			cadeia linhaVendOrigD = ""
			cadeia linhaSubsProd = ""// variável que irá guradar os dados atualizados do produto
			real valorTotal = 0.0//variável para o valor total da compra
			real valorTotalD = 0.0
			inteiro limite = 0 //variável para o limite de estoque
			//loop para entrada de quantidade
			faca{
				limite = tp.cadeia_para_inteiro(vetorProd[1], 10)//váriavel limite de estoque recebe limite de estoque
				//se estoque foi esgotado
				se(limite == 0){
					escreva("Produto foi esgotado!! Reposição do estoque foi solicitada\n")
					reposicao = entradaBaseInteiro("Insira o número da reposicao: ")//reposição recebe a reposição de estoque
					//loop para receber receber o uma diferença do estoque
					para(inteiro i = 0; i < DATA; i++){
						//se iterador for igual a posição do valor do estoque
						se(i == 1){
							vetorProd[i] = ""//vetor de produto com id de estoque é limpado
							vetorProd[i] += reposicao //vetor de produto com id de estoque é substituido pelo valor de reposição
						}
						linhaSubsProd += "/"+vetorProd[i]+"/"//linhaSubsProd concatena os dados do vetor do produto
					}
					aq.substituir_texto(caminho[0], linhaOriginal, linhaSubsProd, verdadeiro)//substitui os dados antigos do estoque pelos novos
					limite = tp.cadeia_para_inteiro(vetorProd[1], 10)//váriavel limite de estoque recebe NOVO limite de estoque
				}
				//usuário escolhe a quantidade de compra
				quantidadeVend = entradaBaseInteiro("Insira a quantidade do produto que deseja comprar: ")

				//se usuário passar do limite de estoque ou for abaixo de zero
				se(quantidadeVend > limite){
					escreva("Quantidade inválida!! Passou da quantidade de estoque.\n")
				}
				se(quantidadeVend <= 0 ){
					escreva("Quantidade inválida!! Está igual ou abaixo de zero.\n")
				}
			}enquanto(quantidadeVend <= 0 ou quantidadeVend > limite e saidaLoop != 1)
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
					valorTotal += (preco * quantidadeVend) - (preco * quantidadeVend)*0.1//valorTotal recebe o valor da compra
					valorTotalD += valorTotal
					pare
				// caso cartão: acréscimo de 3%
				caso 3:
					//opção foi cartão, escreve texto sobre escolha
					escreva("Forma de pagamento em cartão de crédito/débito foi escolhido.\n3% de acrescimo foi acrescentado ao valor da compra.\n")
					valorTotal += (preco * quantidadeVend) + (preco * quantidadeVend)*0.03//valorTotal recebe o valor da compra
					valorTotalD += valorTotal
					pare
			}
			
			vetorProd[1] = ""//vetor de produto com id de estoque é limpo
			vetorProd[1] += (limite - quantidadeVend)//vetor de produto com id de estoque recebe o estoque diminuído
			vetorVend[0] = ""//vetorVend com id de código é limpo do código de produto anterior
			vetorVend[0] = tp.inteiro_para_cadeia(posicao, 10)//vetorVend com id de código de venda recebe código de produto atual
			vetorVend[1] = ""//vetorVend com id de nome é limpo do nome de produto anterior 
			vetorVend[1] += vetorProd[0] //vetorVend com id de nome recebe nome do produto atual
			valorTotal = mt.arredondar(valorTotal, 2)//valor Total da compra é arredondado para duas casas
			valorTotalD = mt.arredondar(valorTotalD, 2)
			//texto de dados da compra
			escreva("======================\n")
			escreva("|Dados da compra: 	\n")
			escreva("|Código: ",vetorVend[0],"\n|Nome: ",vetorVend[1],"\n|Quantidade: ",quantidadeVend,"\n|Preço da compra do produto: ",valorTotal,"\n")
			escreva("======================\n")
			

			linhaSubsProd = ""//linhaSubsProd é limpo
			//loop para concatenar dados de produto a linha de atualização do produto
			para(inteiro i = 0; i < DATA; i++){
				linhaSubsProd += "/"+vetorProd[i]+"/"//linhaSubsProd concatena os dados do produto que será atualizado
			}
			inteiro i = 1//iterador
			inteiro cod, codD // variável que armazena código do produto
			cadeia vetorOrig[] = {"0","","0","0"},// cria vetor que abrigará as leituras dos produtos iterados
			
			vetorOrigD[] = {"0","","0","0"},
			vetorVendD[] = {"0","","0","0"}
			
			inteiro arqVenda = aq.abrir_arquivo(caminho[1], aq.MODO_LEITURA)//abre DataBase de vendas e armazena endereço de memória na variável arqVendas em modo de leitura
			,arqVendaDiaria = aq.abrir_arquivo(caminho[2], aq.MODO_LEITURA)
			
			leiaProduto(vetorOrigD, arqVendaDiaria)//lê primeiro produto temporário e passa para vetor vetorOrigD
			leiaProduto(vetorOrig, arqVenda)//lê primeiro produto e passa para veto vetorOrig
			
			cod = tp.cadeia_para_inteiro(vetorOrig[0], 10)//cod recebe código do primeiro produto vendido
			codD = tp.cadeia_para_inteiro(vetorOrigD[0], 10)
			inteiro quantidadeVendTot = tp.cadeia_para_inteiro(vetorOrig[2], 10)//quantidadeVendTot recebe a quantidade do primeiro produto vendido
			,quantidadeVendTotD = tp.cadeia_para_inteiro(vetorOrigD[2], 10)
			logico chave1, chave2
			
			//loop para processo de venda
			faca{
				//se código de produto vendido for igual a produto selecionado ou venda de produto com código ainda não foi registrado
				se(cod == posicao ou cod == 0){chave1 = verdadeiro}senao{chave1 = falso}
				se(codD == posicao ou codD == 0){chave2 = verdadeiro}senao{chave2 = falso}
				se(chave1 e chave2){
					//loop para concatenar dados originais do produto vendido  
					para(inteiro j = 0; j < VEN; j++){
							linhaVendOrig += "/"+vetorOrig[j]+"/"
							linhaVendOrigD += "/"+vetorOrigD[j]+"/"
					}
					
					//se venda de produto com código ainda não foi registrado
					se(cod == 0){
						valorTotal += 0 // valorTotal é somado com zero
						quantidadeVendTot = quantidadeVend // quantidadeVendTot recebe valor de de quantidade de produto da compra atual
					}
					se(codD == 0){
						valorTotalD += 0
						quantidadeVendTotD = quantidadeVend // quantidadeVendTot recebe valor de de quantidade de produto da compra atual
					}
					//se código de produto vendido for igual a produto selecionado 
					se(cod == posicao){
						valorTotal += tp.cadeia_para_real(vetorOrig[3]) //valorTotal da compra soma o valor atual com o valor registrado da compra do produto
						quantidadeVendTot += quantidadeVend//quantidadeVendTot recebe soma da quantidade atual de produtos vendidos com o valor registrado da compra do produto
					}
					se(codD == posicao ){
						valorTotalD += tp.cadeia_para_real(vetorOrigD[3]) //valorTotal da compra soma o valor atual com o valor registrado da compra do produto
						quantidadeVendTotD += quantidadeVend //quantidadeVendTot recebe soma da quantidade atual de produtos vendidos com o valor registrado da compra do produto
					}
					
					aq.fechar_arquivo(arqVendaDiaria)//fechando DataBase de vendas em modo de leitura
					aq.fechar_arquivo(arqVenda)//fechando DataBase de vendas em modo de leitura
					
					arqVenda = aq.abrir_arquivo(caminho[1], aq.MODO_ACRESCENTAR)//abre DataBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
					arqVendaDiaria = aq.abrir_arquivo(caminho[2], aq.MODO_ACRESCENTAR)//abre DataBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
					//se venda de produto com código ainda não foi registrado 
					se(cod == 0 ou codD == 0){
						//loop para atribuir dados de venda a vetorVend
						para(inteiro j = 0; j < VEN; j++){
							vetorVendD[j] = vetorVend[j]
							//escolha caso para atribuir dados aos ids especificos do vetorVend
							escolha(j){
								//iterador é no id de quantidade
								caso 2:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] = tp.inteiro_para_cadeia(quantidadeVendTot, 10)// passa dados de quantidadeVendTot convertida para cadeia 
									vetorVendD[j] = ""
									vetorVendD[j] = tp.inteiro_para_cadeia(quantidadeVendTotD, 10)// passa dados de quantidadeVendTot convertida para cadeia 
									pare
								//iterador é no id de valorTotal
								caso 3:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] += mt.arredondar(valorTotal, 2)//concatena valorTotal
									vetorVendD[j] = ""// limpa valor no vetor
									vetorVendD[j] += mt.arredondar(valorTotalD, 2)//concatena valorTotal
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
							aq.escrever_linha(linhaVend, arqVenda)//adiciona produto ao DataBase de Vendas
						}
						se(codD == 0){
							aq.escrever_linha(linhaVendD, arqVendaDiaria)
							
						}
					}
					//se código de produto vendido for igual a produto selecionado
					se(cod == posicao ou codD == posicao){
						para(inteiro j = 0; j < VEN; j++){
							//escolha caso para atribuir dados aos ids especificos do vetorVend
							vetorVendD[j] = vetorVend[j]
							escolha(j){
								//iterador é no id de quantidade
								caso 2:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] = tp.inteiro_para_cadeia(quantidadeVendTot, 10)// passa dados de quantidadeVendTot convertida para cadeia
									vetorVendD[j] = ""// limpa valor no vetor temp
									vetorVendD[j] =  tp.inteiro_para_cadeia(quantidadeVendTotD, 10)// passa dados de quantidadeVendTot convertida para cadeia temp
									pare
								//iterador é no id de valorTotal
								caso 3:
									vetorVend[j] = ""// limpa valor no vetor
									vetorVend[j] += mt.arredondar(valorTotal, 2)//concatena valorTotal
									vetorVendD[j] = ""// limpa valor no vetor temp
									vetorVendD[j] += mt.arredondar(valorTotalD, 2)//concatena valorTotalD
									pare
							}
							se(cod == posicao){
								linhaVend += "/"+vetorVend[j]+"/"
							}
							se(codD == posicao){
								linhaVendD += "/"+vetorVendD[j]+"/"//linha concatena valor de venda
							}
						}
						//substitui os dados antigos de venda do produto pelos novos dados atualizados
						se(cod == posicao){
							aq.substituir_texto(caminho[1], linhaVendOrig, linhaVend, verdadeiro)
						}
						se(codD == posicao){
							aq.substituir_texto(caminho[2], linhaVendOrigD, linhaVendD, verdadeiro)
						}
					}
					//substitui os dados antigos do produto vendido pelos novos dados atualizados
					aq.substituir_texto(caminho[0], linhaOriginal, linhaSubsProd, verdadeiro)
					aq.fechar_arquivo(arqVendaDiaria)//fecha arquivo
					aq.fechar_arquivo(arqVenda)//fecha arquivo
					saidaLoop = 1 //sai do loop
				}
				//senão
				senao {
					//se condicional de arquivo permanente for falsa
					se(chave1 == falso){
						//lê os dados da venda e passa para vetor
						leiaProduto(vetorOrig, arqVenda)
						inteiro codProximo = tp.cadeia_para_inteiro(vetorOrig[0], 10)//vê o código do do próximo produto
						// se código anterior é igual a próximo código
						se(cod == codProximo ){
							cod = 0	//código recebe 0
							quantidadeVendTot = 0// quantidadeVendTot recebe 0
						}
						//senão, se código anterior é diferente a próximo código ou está no último produto
						senao se (cod != codProximo ou i == vetDeNum[1]){
							cod = codProximo // cod recebe próximo código
							quantidadeVendTot = tp.cadeia_para_inteiro(vetorOrig[2], 10)//quantidadeVendTot recebe quantidade dos dados de venda
						}
					}
					//se condicional de arquivo temporaria for falsa
					se(chave2 == falso){
						//lê os dados da venda e passa para vetor
						leiaProduto(vetorOrigD, arqVendaDiaria)
						inteiro codProximoD = tp.cadeia_para_inteiro(vetorOrigD[0], 10)//vê o código do do próximo produto
						// se código anterior é igual a próximo código
						se(codD == codProximoD ){
							codD = 0	//código recebe 0
							quantidadeVendTotD = 0// quantidadeVendTot recebe 0
						}
						//senão, se código anterior é diferente a próximo código ou está no último produto
						senao se (codD != codProximoD ou i == vetDeNum[2]){
							codD = codProximoD // cod recebe próximo código
							quantidadeVendTotD = tp.cadeia_para_inteiro(vetorOrigD[2], 10)//quantidadeVendTot recebe quantidade dos dados de venda
						}
					}
					i++// iterador de produto é incrementado +1
					 
					
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
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "a")
					pare
				//filtra A
				caso 'Ã':caso 'Â':caso 'Á':caso 'À':caso 'Ä':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "A")
					pare
				//filtra e
				caso 'ê':caso 'ë':caso 'é':caso 'è':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "e")
					pare
				//filtra E
				caso 'Ê':caso 'Ë':caso 'É':caso 'È':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "E")
					pare
				//filtra o
				caso 'õ':caso 'ô':caso 'ó':caso 'ò':caso 'ö':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "o")
					pare
				//filtra O
				caso 'Õ':caso 'Ô':caso 'Ó':caso 'Ò':caso 'Ö':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "O")
					pare
				//filtra i
				caso 'î':caso 'í':caso 'ì':caso 'ï':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "i")
					pare
				//filtra I
				caso 'Î':caso 'Í':caso 'Ì':caso 'Ï':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "I")
					pare
				//filtra u
				caso 'û':caso 'ú':caso 'ù':caso 'ü':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "u")
					pare
				//filtra U
				caso 'Û':caso 'Ú':caso 'Ù':caso 'Ü':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "U")
					pare
				//filtra n
				caso 'ñ':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "n")
					pare
				//filtra N
				caso 'Ñ':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "N")
					pare
				//filtra c
				caso 'ç':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "c")
				//filtra C
				caso 'Ç':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "C")
					pare
				//filtra Y
				caso 'Ý':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "Y")
					pare
				//filtra y
				caso 'ý': caso 'ÿ':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "y")
					pare
				//filtra caracteres indesejados
				caso '|':caso '\\':caso '/':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "")
					pare
				//filtra caracter de separação de dados
				caso ':':
					letra = tp.caracter_para_cadeia(x)
					nome = txt.substituir(nome, letra, "-")
					pare
			}
		}
		retorne nome
	}
	funcao pesquisarProduto(inteiro id, inteiro numDeDados[],cadeia vetInfProd[], cadeia vetInfVend[], cadeia caminho[], inteiro vetDeNum[]){
		inteiro opcaoInterna, arquivo, saidaLoop, j = 1
		faca{
          	saidaLoop = 0
			//se tiver produtos
          	se(numDeDados[0] != 0){
         			//escolha da posição do arquivo
	          	faca{
					//usuário escolhe a matriz que deseja entrar
					escreva("Número de produtos do Arquivo: ",numDeDados[0],"\n")
					opcaoInterna = entradaBaseInteiro("Insira o código do produto: ")
					//se usuário colocar uma opção inválida 
					se(opcaoInterna <= 0 ou opcaoInterna > numDeDados[0]){
						escreva("Número de  inválido!!\n")
					}
				}enquanto(opcaoInterna <= 0 ou opcaoInterna > numDeDados[0])
				arquivo = aq.abrir_arquivo(caminho[0], aq.MODO_LEITURA)
				//verificar o produto
				faca{
					//se opcaoInterna for igual a posição da linha do produto escolhido
					se(opcaoInterna == j){	
						leiaProduto(vetInfProd,arquivo)//lê linha
						cadeia linhaOriginal = ""
						para(inteiro i = 0; i < DATA; i++){
							linhaOriginal += "/"+vetInfProd[i]+"/"
						}
						aq.fechar_arquivo(arquivo)//fecha arquivo
						//escreve informações do produto escolhido
						escrevaProdutoVenda(id,vetInfProd,vetInfVend,j)
						//se sim sai do loop, se não limpa vetor e sai do loop
						saidaLoop = escolhas("Deseja escolher este produto:\n1: Sim\n2: Não\n")
						//se produto não foi escolhido, limpa o vetor e sai
						se(saidaLoop == 1){
							para(inteiro i = 0; i< DATA; i++){
								vetInfProd[i] = ""
							}
							saidaLoop = 1		
						}
						//se produto foi escolhido, realiza venda e sai
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
				enquanto(j <= numDeDados[0] e saidaLoop != 1)		
          	}
          	//senão
          	senao{
          		escreva("Não há produtos cadastrados para realizar venda.\n")
          		saidaLoop = 1//sai do loop
          	}
		}enquanto(saidaLoop != 1)
          saidaLoop = 0
	}
	funcao inteiro totalProdutos(cadeia caminho){
		cadeia linha = ""//variável para receber linha do arquivo
		inteiro arquivo = aq.abrir_arquivo(caminho, aq.MODO_LEITURA)//váriavel arquivo recebe permissão para abrir e somente ler o arquivo com matrizes
		inteiro numDeLinhas = -1//o número de linhas utilizadas
		//loop para contar o número de linhas que tem abertas no arquivo
		faca{
			linha = aq.ler_linha(arquivo)//linha recebe a leitura da linha do arquivo
			numDeLinhas++// numdelinhas é adicionado + 1
		}enquanto(aq.fim_arquivo(arquivo) == falso)
		aq.fechar_arquivo(arquivo)//fecha arquivo
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
			entrada = aq.selecionar_arquivo(tiposArq, verdadeiro)
			//se caminho é válido
			se(aq.arquivo_existe(entrada) == verdadeiro){
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
	funcao cadastroProduto(cadeia vetor[], cadeia caminho){
		//loop para limpar o vetor de valores vazios
		para(inteiro i = 0; i< DATA; i++){
			vetor[i] = ""
		}
		//Vetor com idnomes recebe entrada de usuário do nome do produto
		vetor[0] += filtrarCaracteres(entradaBaseCadeia("Digite o nome do produto: "))
		//Vetor com id de stock recebe entrada de usuário do número de stock
		vetor[1] += entradaBaseInteiro("Digite a quantidade do produto que tem no estoque de hoje: ")
          //Vetor com id de precos recebe entrada de usuário do preço do produto
          vetor[2] += mt.arredondar(entradaBaseReal("Digite o preço do produto: "), 2)
          //vetor com id de custo recebe entrada de usuário do custo do produto
          vetor[3] += entradaBaseReal("Digite o custo do produto: ")
          passeProduto(1, caminho , vetor)//passa os dados do produto para o arquivo
	}
	funcao cadeia leiaProduto(cadeia vetor[], inteiro arquivo){
		//loop for para cada elemento da coluna
		cadeia valor = "" //váriavel para colocar os valores retirados das matrizes dentro arquivo, começa limpa
		inteiro j = 0// variável para iterar linhas
		cadeia x = aq.ler_linha(arquivo)//x recebe a linha a ser análisada
		// linha recebida é simplificada para ser processada
		cadeia texto = txt.substituir(x, "//", ":")
		texto = txt.substituir(texto, "/", "")
		/*
		Ex: 
		linha de produtos antes de ser simplificada:
			/x//y//z/
		linha depois de ser simplificada:
			x:y:z
		*/
		//loop for para análisar a linha de dados do produto
			
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
				arquivo = aq.abrir_arquivo(caminho, aq.MODO_ESCRITA)//variável arquivo recebe permissão para abrir e somente escrever no arquivo com matrizes
				pare
			//MODO ACRESCENTAR 
			caso 1:
				arquivo = aq.abrir_arquivo(caminho, aq.MODO_ACRESCENTAR)//variável arquivo recebe permissão para abrir e somente acrescentar no arquivo com matrizes
				pare
		}
		para(inteiro i = 0; i < ut.numero_elementos(vetor); i++){
			linha += "/"+vetor[i]+"/"//linha acrescenta a si os dados do produto
		}
		aq.escrever_linha(linha, arquivo)//escreve a linha no arquivo e pula pra próxima
		aq.fechar_arquivo(arquivo)//fechar arquivo
	}
	funcao ordenacaoVend(inteiro p, inteiro k, cadeia dadosDeVenda[], inteiro arquivoVendaD, inteiro numDeVendasDiaria, cadeia caminhoDeVendasDiaria){
		se(dadosDeVenda[0] != ""){
          	//título		
          	escreva("++++++++++++++++++++++++++\n")
          	escreva("REGISTROS DE VENDAS DO DIA\n")
          	escreva("++++++++++++++++++++++++++\n")
			//loop para organizar a escritura dos códigos 					
			faca{
									
				se(tp.cadeia_para_inteiro(dadosDeVenda[0], 10) == k){
					escreva("===============================================================================================================\n")
					escreva("|Código:"+dadosDeVenda[0]+"|Nome: "+dadosDeVenda[1]+"|Quantidade vendida: "+dadosDeVenda[2]+"|Valor total de vendas do produto: "+dadosDeVenda[3]+"|\n")	
					escreva("===============================================================================================================\n")
					k++
				}
				leiaProduto(dadosDeVenda, arquivoVendaD)//lê o produto vendido e passa para vetor
				p++
				se(p > numDeVendasDiaria){
					p = 1
					se(k <= numDeVendasDiaria){
						aq.fechar_arquivo(arquivoVendaD)
						arquivoVendaD = aq.abrir_arquivo(caminhoDeVendasDiaria, aq.MODO_LEITURA)					
					}
				}
				
			}enquanto(p <=numDeVendasDiaria e k <= numDeVendasDiaria)
		}
		senao{escreva("Não há registros de vendas no dia.\n")}
          aq.fechar_arquivo(arquivoVendaD)
		
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 24913; 
 * @DOBRAMENTO-CODIGO = [7, 300, 399, 459, 472, 493, 508, 539, 558];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */