programa
{
	inclua biblioteca Graficos-->grf
	inclua biblioteca Tipos-->typ
	inclua biblioteca Texto-->txt
	inclua biblioteca Calendario-->cal
	inclua biblioteca Matematica-->mat
	inclua biblioteca Util-->utl
	inclua biblioteca Arquivos-->src
	inclua biblioteca Teclado --> tec
	inclua biblioteca Mouse --> m

	const inteiro TAM_X_TELA = 1920	
	const inteiro TAM_Y_TELA = 1080
	const inteiro PROD = 5
	const inteiro VENDA = 4
     inteiro LarguraT = grf.largura_tela()
     inteiro AlturaT = grf.altura_tela()
	//realizar venda
	/*
	inteiro TelaCodigo = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaQuantidade = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaQuantErrada = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaValor = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaTroco = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaFormaPag = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaPagCart = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaOpcCart = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaPagCartConc = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaPagPix = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     inteiro TelaPagPixConc = grf.carregar_imagem(computador+"\\Downloads\\Sistema Padaria 2.0\\")
     */
	funcao inicio()
	{	
		//variaveis
		inteiro arquivo, mnu=0, qtd_estoque=0, id_produto=0
		real val_uni=0.0, val_custo=0.0
		cadeia nome_produto="", vetsrc[5]
		inteiro numDeVet[3]
		//leitura de arquivos
		src.listar_arquivos("./sourceDaPadaria", vetsrc)
		//menu de opções
		Menu(numDeVet,vetsrc)
	}
	//back end
	funcao inteiro imprime_mnu(inteiro &opcao){
		escreva("Escolha uma opcao \n\n 1) Cadastrar produto         2) Registrar Venda\n 3) Relatorio Atual           4) Fechar Caixa e Sair\n5)Exportar os dados registrados \nDigite o numero referente a opção desejada: ")
		leia(opcao)
		limpa()
		retorne opcao
	}
	funcao realizarVenda(cadeia vetorProd[], cadeia vetorVend[], cadeia caminho[], cadeia linhaOriginal, inteiro posicao,inteiro vetDeNum[], real saldoCaixa){
		//se existir produto escolhido
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
			inteiro quantidadeVend = 0//Variável para a quantidade de produtos que será comprada.
			real preco = typ.cadeia_para_real(vetorProd[4])//declara variável de preco e dá o preço do produto

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

			se(vetorProd[3] == "true"){
			faca{
				limite = typ.cadeia_para_inteiro(vetorProd[2], 10)//váriavel limite de estoque recebe limite de estoque
				//se estoque foi esgotado
				se(limite == 0){
					escreva("Produto foi esgotado!! Reposição do estoque foi solicitada\n")
					reposicao = entradaBaseInteiro("Insira o número da reposicao: ")//reposição recebe a reposição de estoque
					//loop para receber receber o uma diferença do estoque
					para(inteiro i = 0; i < PROD; i++){
						//se iterador for igual a posição do valor do estoque
						se(i == 2){
							vetorProd[i] = ""//vetor de produto com id de estoque é limpado
							vetorProd[i] += reposicao //vetor de produto com id de estoque é substituido pelo valor de reposição
						}
						linhaSubsProd += "/"+vetorProd[i]+"/"//linhaSubsProd concatena os dados do vetor do produto
					}
					src.substituir_texto(caminho[0], linhaOriginal, linhaSubsProd, verdadeiro)//substitui os dados antigos do estoque pelos novos
					limite = typ.cadeia_para_inteiro(vetorProd[2], 10)//váriavel limite de estoque recebe NOVO limite de estoque
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
			}
			senao{
				limite = typ.cadeia_para_inteiro(vetorProd[2], 10)//váriavel limite de estoque recebe NOVO limite de estoque
				se(limite == 0){
					escreva("Produtlo foi esgotado!! Reposição do estoque foi solicitada\n")
					reposicao = entradaBaseInteiro("Insira o número da reposicao: ")//reposição recebe a reposição de estoque
					//loop para receber receber o uma diferença do estoque
					para(inteiro i = 0; i < PROD; i++){
						//se iterador for igual a posição do valor do estoque
						se(i == 2){
							vetorProd[i] = ""//vetor de produto com id de estoque é limpado
							vetorProd[i] += reposicao //vetor de produto com id de estoque é substituido pelo valor de reposição
						}
						linhaSubsProd += "/"+vetorProd[i]+"/"//linhaSubsProd concatena os dados do vetor do produto
					}
					src.substituir_texto(caminho[0], linhaOriginal, linhaSubsProd, verdadeiro)//substitui os dados antigos do estoque pelos novos
					limite = typ.cadeia_para_inteiro(vetorProd[2], 10)//váriavel limite de estoque recebe NOVO limite de estoque
				}
				valorTotal = balanca(quantidadeVend, preco)
			}
			escreva(linhaSubsProd)
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
					se(vetorProd[3] == "true"){
						valorTotal += (preco * quantidadeVend)//valorTotal recebe o valor da compra
					}
					valorTotalD += valorTotal
					pare
				// caso cartão: acréscimo de 3%
				caso 3:
					//opção foi cartão, escreve texto sobre escolha
					escreva("Forma de pagamento em cartão de crédito/débito foi escolhido.\n3% de acrescimo foi acrescentado ao valor da compra.\n")
					se(vetorProd[3] == "true"){
						valorTotal += (preco * quantidadeVend)//valorTotal recebe o valor da compra
					}
					valorTotalD += valorTotal
					pare
			}

			vetorProd[2] = ""//vetor de produto com id de estoque é limpo
			vetorProd[2] += (limite - quantidadeVend)//vetor de produto com id de estoque recebe o estoque diminuído
			
			vetorVend[0] = ""//vetorVend com id de código é limpo do código de produto anterior
			vetorVend[0] = typ.inteiro_para_cadeia(posicao, 10)//vetorVend com id de código de venda recebe código de produto atual
			
			vetorVend[1] = ""//vetorVend com id de nome é limpo do nome de produto anterior 
			vetorVend[1] += vetorProd[1] //vetorVend com id de nome recebe nome do produto atual
			
			valorTotal = mat.arredondar(valorTotal, 2)//valor Total da compra é arredondado para duas casas
			valorTotalD = mat.arredondar(valorTotalD, 2)
			//texto de dados da compra
			escreva("======================\n")
			escreva("|Dados da compra: 	\n")
			escreva("|Código: ",vetorVend[0],"\n|Nome: ",vetorVend[1],"\n|Quantidade: ",quantidadeVend,"\n|Preço da compra do produto: ",valorTotal,"\n")
			escreva("======================\n")
			
			linhaSubsProd = ""//linhaSubsProd é limpo
			//loop para concatenar dados de produto a linha de atualização do produto
			para(inteiro i = 0; i < PROD; i++){
				linhaSubsProd += "/"+vetorProd[i]+"/"//linhaSubsProd concatena os dados do produto que será atualizado
			}
			inteiro i = 1//iterador
			inteiro cod, codD // variável que armazena código do produto
			cadeia vetorOrig[] = {"0","","0","0"},// cria vetor que abrigará as leituras dos produtos iterados
			
			vetorOrigD[] = {"0","","0","0"},
			vetorVendD[] = {"0","","0","0"}
			
			inteiro arqVenda = src.abrir_arquivo("sourceDaPadaria\\"+caminho[2], src.MODO_LEITURA)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de leitura
			,arqVendaDiaria = src.abrir_arquivo("sourceDaPadaria\\"+caminho[3], src.MODO_LEITURA)
			
			leiaProduto(vetorOrigD, arqVendaDiaria)//lê primeiro produto temporário e passa para vetor vetorOrigD
			leiaProduto(vetorOrig, arqVenda)//lê primeiro produto e passa para veto vetorOrig
			
			cod = typ.cadeia_para_inteiro(vetorOrig[0], 10)//cod recebe código do primeiro produto vendido
			codD = typ.cadeia_para_inteiro(vetorOrigD[0], 10)
			inteiro quantidadeVendTot = typ.cadeia_para_inteiro(vetorOrig[2], 10)//quantidadeVendTot recebe a quantidade do primeiro produto vendido
			,quantidadeVendTotD = typ.cadeia_para_inteiro(vetorOrigD[2], 10)
			logico chave1, chave2
			
			//loop para processo de venda
			faca{
				//se código de produto vendido for igual a produto selecionado ou venda de produto com código ainda não foi registrado
				se(cod == posicao ou cod == 0){chave1 = verdadeiro}senao{chave1 = falso}
				se(codD == posicao ou codD == 0){chave2 = verdadeiro}senao{chave2 = falso}
				se(chave1 e chave2){
					//loop para concatenar dados originais do produto vendido  
					para(inteiro j = 0; j < VENDA; j++){
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
						valorTotal += typ.cadeia_para_real(vetorOrig[3]) //valorTotal da compra soma o valor atual com o valor registrado da compra do produto
						quantidadeVendTot += quantidadeVend//quantidadeVendTot recebe soma da quantidade atual de produtos vendidos com o valor registrado da compra do produto
					}
					se(codD == posicao ){
						valorTotalD += typ.cadeia_para_real(vetorOrigD[3]) //valorTotal da compra soma o valor atual com o valor registrado da compra do produto
						quantidadeVendTotD += quantidadeVend //quantidadeVendTot recebe soma da quantidade atual de produtos vendidos com o valor registrado da compra do produto
					}
					
					src.fechar_arquivo(arqVendaDiaria)//fechando PRODBase de vendas em modo de leitura
					src.fechar_arquivo(arqVenda)//fechando PRODBase de vendas em modo de leitura
					
					arqVenda = src.abrir_arquivo("sourceDaPadaria\\"+caminho[2], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
					arqVendaDiaria = src.abrir_arquivo("sourceDaPadaria\\"+caminho[3], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
					//se venda de produto com código ainda não foi registrado 

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
							src.escrever_linha(linhaVend, arqVenda)//adiciona produto ao PRODBase de Vendas
						}
						se(codD == 0){
							src.escrever_linha(linhaVendD, arqVendaDiaria)
							
						}
					}
					//se código de produto vendido for igual a produto selecionado
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
						//substitui os dados antigos de venda do produto pelos novos dados atualizados
						se(cod == posicao){
							src.substituir_texto("sourceDaPadaria\\"+caminho[2], linhaVendOrig, linhaVend, verdadeiro)
						}
						se(codD == posicao){
							src.substituir_texto("sourceDaPadaria\\"+caminho[3], linhaVendOrigD, linhaVendD, verdadeiro)
						}
					}
					//substitui os dados antigos do produto vendido pelos novos dados atualizados

					src.substituir_texto("sourceDaPadaria\\"+caminho[1], linhaOriginal, linhaSubsProd, verdadeiro)
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
						inteiro codProximo = typ.cadeia_para_inteiro(vetorOrig[0], 10)//vê o código do do próximo produto
						// se código anterior é igual a próximo código
						se(cod == codProximo ){
							cod = 0	//código recebe 0
							quantidadeVendTot = 0// quantidadeVendTot recebe 0
						}
						//senão, se código anterior é diferente a próximo código ou está no último produto
						senao se (cod != codProximo ou i == vetDeNum[1]){
							cod = codProximo // cod recebe próximo código
							quantidadeVendTot = typ.cadeia_para_inteiro(vetorOrig[2], 10)//quantidadeVendTot recebe quantidade dos dados de venda
						}
					}
					//se condicional de arquivo temporaria for falsa
					se(chave2 == falso){
						//lê os dados da venda e passa para vetor
						leiaProduto(vetorOrigD, arqVendaDiaria)
						inteiro codProximoD = typ.cadeia_para_inteiro(vetorOrigD[0], 10)//vê o código do do próximo produto
						// se código anterior é igual a próximo código
						se(codD == codProximoD ){
							codD = 0	//código recebe 0
							quantidadeVendTotD = 0// quantidadeVendTot recebe 0
						}
						//senão, se código anterior é diferente a próximo código ou está no último produto
						senao se (codD != codProximoD ou i == vetDeNum[2]){
							codD = codProximoD // cod recebe próximo código
							quantidadeVendTotD = typ.cadeia_para_inteiro(vetorOrigD[2], 10)//quantidadeVendTot recebe quantidade dos dados de venda
						}
					}
					i++// iterador de produto é incrementado +1
					 
					
				}
			}enquanto(saidaLoop != 1)
		}
	}
	funcao real balanca (inteiro &peso, real valorDaKg){
		peso = utl.sorteia(50, 1000) // sorteando a quantidade que o cliente vai comprar, para simular uma balança 
		real l = typ.inteiro_para_real(peso) // mudando o valor de inteiro para real para poder usar zero apos a virgula pq o sorteia so roda com inteiro...
		escreva ("Você comprou ",l," gramas de pão.\n")
		real valorCobrarCliente = ((l * valorDaKg)/1000) // converte gramas em reais $$ dindin
		valorCobrarCliente = mat.arredondar(valorCobrarCliente, 7)
		escreva("Valor a cobrar do cliente é: ",valorCobrarCliente) // mostra o valor na tela a ser cobrado 
		retorne valorCobrarCliente
	}
	funcao real abrirCaixa (real saldoCaixa){
		saldoCaixa = entradaBaseReal("Abertura de caixa, Quantos reais tem no caixa?: ")
		retorne saldoCaixa
	}
     funcao pesquisarProduto(inteiro id,cadeia caminho[], inteiro vetDeNum[], real saldoCaixa){
		inteiro opcaoInterna, arquivo, saidaLoop, j = 1
		cadeia vetInfProd[6]
		cadeia vetInfVend[4]
		faca{
          	saidaLoop = 0
			//se tiver produtos
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
				arquivo = src.abrir_arquivo("sourceDaPadaria\\"+caminho[1], src.MODO_LEITURA)
				//verificar o produto
				faca{
					//se opcaoInterna for igual a posição da linha do produto escolhido
					se(opcaoInterna == j){	
						leiaProduto(vetInfProd,arquivo)//lê linha
						cadeia linhaOriginal = ""
						para(inteiro i = 0; i < PROD; i++){
							linhaOriginal += "/"+vetInfProd[i]+"/"
						}
						escreva(linhaOriginal)
						src.fechar_arquivo(arquivo)//fecha arquivo
						//escreve informações do produto escolhido
						escrevaProdutoVenda(id,vetInfProd,vetInfVend)
						//se sim sai do loop, se não limpa vetor e sai do loop
						saidaLoop = escolhas("Deseja escolher este produto:\n1: Sim\n2: Não\n")
						//se produto não foi escolhido, limpa o vetor e sai
						se(saidaLoop == 1){
							para(inteiro i = 0; i< PROD; i++){
								vetInfProd[i] = ""
							}
							saidaLoop = 1		
						}
						//se produto foi escolhido, realiza venda e sai
						senao{
							realizarVenda(vetInfProd, vetInfVend, caminho, linhaOriginal, j, vetDeNum, saldoCaixa)
							saidaLoop = 1
						}
					}
					//senão ignora matriz e iterador de posição acrescenta +1
					senao{
						leiaProduto(vetInfProd,arquivo)
						j++
					}
				}
				enquanto(j <= vetDeNum[0] e saidaLoop != 1)		
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
		inteiro arquivo = src.abrir_arquivo("sourceDaPadaria\\"+caminho, src.MODO_LEITURA)//váriavel arquivo recebe permissão para abrir e somente ler o arquivo com matrizes
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
	funcao cadastroProduto(cadeia caminho, inteiro numDeProd, cadeia senha){
		cadeia vetor[6]
		//loop para limpar o vetor de valores vazios
		para(inteiro i = 0; i< PROD; i++){
			vetor[i] = ""
		} 
		vetor[0] += (numDeProd+1)	
		f_front_cadastro(senha, vetor)
		// Antes de passar o produto, verifique se o produto já existe
		// Esta linha chama a função produtoExiste para verificar se o produto já existe no arquivo
		passeProduto(1, caminho , vetor)//passa os dados do produto para o arquivo
	}
     funcao logico produtoExiste(cadeia nomeProduto, cadeia caminho) {
        // Abra o arquivo em modo de leitura
        inteiro arquivo = src.abrir_arquivo(caminho, src.MODO_LEITURA)
        cadeia linha = src.ler_linha(arquivo)
        // Enquanto não for o fim do arquivo
        enquanto (src.fim_arquivo(arquivo) == falso) {
            // Se o nome do produto existir na linha, retorne verdadeiro
            // Esta linha verifica se o nome do produto existe na linha do arquivo
            se (txt.posicao_texto(linha, nomeProduto, 1) != -1) {
                retorne verdadeiro
            }
            linha = src.ler_linha(arquivo)
        }
        // Se o produto não foi encontrado, retorne falso
        retorne falso
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
				arquivo = src.abrir_arquivo("sourceDaPadaria\\"+caminho, src.MODO_ESCRITA)//variável arquivo recebe permissão para abrir e somente escrever no arquivo com matrizes
				pare
			//MODO ACRESCENTAR 
			caso 1:
				arquivo = src.abrir_arquivo("sourceDaPadaria\\"+caminho, src.MODO_ACRESCENTAR)//variável arquivo recebe permissão para abrir e somente acrescentar no arquivo com matrizes
				pare
		}
		para(inteiro i = 0; i < utl.numero_elementos(vetor); i++){
			linha += "/"+vetor[i]+"/"//linha acrescenta a si os dados do produto
		}
		src.escrever_linha(linha, arquivo)//escreve a linha no arquivo e pula pra próxima
		src.fechar_arquivo(arquivo)//fechar arquivo
	}
	funcao ordenacaoVend(inteiro p, inteiro k, inteiro numDeVendasDiaria, cadeia caminhoVendasD){
		cadeia dadosDeVenda[4]
		inteiro arquivoVendaD = src.abrir_arquivo("sourceDaPadaria\\"+caminhoVendasD, src.MODO_LEITURA)
		leiaProduto(dadosDeVenda, arquivoVendaD)
		se(dadosDeVenda[0] != ""){
          	//título		
          	escreva("++++++++++++++++++++++++++\n")
          	escreva("REGISTROS DE VENDAS DO DIA\n")
          	escreva("++++++++++++++++++++++++++\n")
			//loop para organizar a escritura dos códigos 					
			faca{
									
				se(typ.cadeia_para_inteiro(dadosDeVenda[0], 10) == k){
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
						src.fechar_arquivo(arquivoVendaD)
						arquivoVendaD = src.abrir_arquivo(caminhoVendasD, src.MODO_LEITURA)					
					}
				}
				
			}enquanto(p <=numDeVendasDiaria e k <= numDeVendasDiaria)
		}
		senao{escreva("Não há registros de vendas no dia.\n")}
          src.fechar_arquivo(arquivoVendaD)
	}
	funcao exportarVendas(inteiro p, inteiro k, inteiro numDeVendasDiaria, cadeia caminhoVendasD){
		cadeia dadosDeVenda[4]
		inteiro arquivoVendaD = src.abrir_arquivo(caminhoVendasD, src.MODO_LEITURA)
		cadeia caminhoDownload = (utl.obter_diretorio_usuario())+"\\Downloads\\PastaExportacoesJSON"
		src.criar_pasta(caminhoDownload)
		inteiro arquivoJSON = src.abrir_arquivo(caminhoDownload+"\\Arquivo", src.MODO_ACRESCENTAR)
		leiaProduto(dadosDeVenda, arquivoVendaD)
		se(dadosDeVenda[0] != ""){
          	//título		
          	escreva("++++++++++++++++++++++++++\n")
          	escreva("REGISTROS DE VENDAS DO DIA\n")
          	escreva("++++++++++++++++++++++++++\n")
			//loop para organizar a escritura dos códigos 					
			faca{
									
				se(typ.cadeia_para_inteiro(dadosDeVenda[0], 10) == k){
					src.escrever_linha("\tVendaCodigo"+dadosDeVenda[0]+"{\n", arquivoJSON)
					src.escrever_linha("\t\t\"código\" : "+dadosDeVenda[0]+",", arquivoJSON)
					src.escrever_linha("\t\t\"Nome\" : \""+dadosDeVenda[1]+"\",", arquivoJSON)
					src.escrever_linha("\t\t\"Quantidade_vendida\" : "+dadosDeVenda[2]+",", arquivoJSON)
					src.escrever_linha("\t\t\"ValorTotVendas\" : "+dadosDeVenda[3]+"\n", arquivoJSON)	
					src.escrever_linha("\t}", arquivoJSON)
					k++
				}
				leiaProduto(dadosDeVenda, arquivoVendaD)//lê o produto vendido e passa para vetor
				p++
				se(p > numDeVendasDiaria){
					p = 1
					se(k <= numDeVendasDiaria){
						src.fechar_arquivo(arquivoVendaD)
						arquivoVendaD = src.abrir_arquivo(caminhoVendasD, src.MODO_LEITURA)					
					}
				}
				
			}enquanto(p <=numDeVendasDiaria e k <= numDeVendasDiaria)
		}
		senao{escreva("Não há registros de vendas no dia.\n")}
          src.fechar_arquivo(arquivoVendaD)
	}
	funcao escrevaProdutoVenda(inteiro id, cadeia vetor[],cadeia vetorVend[]){
		escolha(id){
			//escreve produto
			caso 0:
				escreva("Informações do produto:\n")
				escreva("===============================================================================================================\n")
				escreva("|Código ID: ",vetor[0],"|Nome: ",vetor[1],"|Quantidade em estoque: ",vetor[2],"|Preço por unidade: ",vetor[3],"|Custo por unidade: ",vetor[4]," |\n")	
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
	funcao cadeia entradaBaseCadeia(cadeia texto)
     {
     	cadeia opcao
          caracter saida = ' '//Váriavel de saída.
          //Faça-enquanto para verificar a entrada do usuário.
          faca {
               escreva(texto)//Escreve o texto recebido pelo parâmetro.
               leia(opcao)//Parâmetro opçao recebe valor do usuário.
               limpa()
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
	funcao real entradaBaseReal(cadeia texto)
     {
     	cadeia opcao
          caracter saida = ' '//variavel de saida
          real x = 0.0//variavel de retorno
          //Faça-enquanto para verificar a entrada do usuário.
          faca 
          {
               escreva(texto)//Escreve o texto recebido pelo parâmetro.
               leia(opcao)//Parâmetro opçao recebe valor do usuário.
               limpa()
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
     funcao inteiro entradaBaseInteiro(cadeia texto){
     	cadeia opcao
          caracter saida = ' '//variável de saída.
          inteiro x = 0//variável de retorno.
          //Faça-enquanto para verificar a entrada do usuário
          faca {
               escreva(texto)//escreve o texto do parâmetro texto.
               leia(opcao)//opcao lê e recebe entrada de usuário.
               limpa()
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
	//front end
	funcao logico mouse(inteiro x, inteiro y, inteiro a, inteiro b)
     {
          se (m.posicao_x() >= x e m.posicao_y() >= y e m.posicao_x() <= x + a e m.posicao_y() <= y + b) {
               retorne verdadeiro
          }
          retorne falso
     }
	funcao Menu(inteiro numDeVet[],cadeia vetsrc[])
     {
          grf.iniciar_modo_grafico(verdadeiro)
          grf.definir_dimensoes_janela(LarguraT, AlturaT)
          grf.renderizar()// antes de aparecer alguma imagem aparece uma tela preta. 
          logico saida = verdadeiro
          enquanto (saida) {
          	inteiro ImgMenu = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/menu/menu_programa1.png")
               inteiro telaMenu = grf.redimensionar_imagem(ImgMenu, LarguraT, AlturaT, verdadeiro) // variavel que recebe a foto da variavel (telaMenu) e redimensiona para cobrir toda a janela.
               grf.desenhar_imagem(0,0, telaMenu)
               grf.liberar_imagem(telaMenu)  // libera o cache dessa imagem da memoria RAM 
			grf.liberar_imagem(ImgMenu)
			grf.renderizar()
			//Função para Cadastrar Produtos

			inteiro VerificaAdm = 0
			inteiro mou = m.ler_botao() 
			inteiro botao = 0
			cadeia senha = "ADMIN"

           	se(mouse(Tela(1920,735,LarguraT), Tela(1080,330,AlturaT), Tela(1920,325,LarguraT), Tela(1080,85,AlturaT)) e mou == m.BOTAO_ESQUERDO){
           		botao = 1
               }
               se(mouse(Tela(1920,735,LarguraT), Tela(1080,480,AlturaT), Tela(1920,325,LarguraT), Tela(1080,85,AlturaT)) e mou == m.BOTAO_ESQUERDO){
               	botao = 2
               }
               se(mouse(Tela(1920,735,LarguraT), Tela(1080,620,AlturaT), Tela(1920,325,LarguraT), Tela(1080,85,AlturaT)) e mou == m.BOTAO_ESQUERDO){
               	botao = 3
               }
               se(mouse(Tela(1920,735,LarguraT), Tela(1080,765,AlturaT), Tela(1920,325,LarguraT), Tela(1080,85,AlturaT)) e mou == m.BOTAO_ESQUERDO){
               	botao = 4
               }
               numDeVet[0] = totalProdutos(vetsrc[1])
               numDeVet[1] = totalProdutos(vetsrc[2])
			numDeVet[2] = totalProdutos(vetsrc[3])
               escolha(botao){
				caso 1:
					//cadastrar produtos
					cadastroProduto(vetsrc[1], numDeVet[0], senha)
				pare
				caso 2:
					//realizar vendas
					real saldoCaixa = abrirCaixa(0.0)
					pesquisarProduto(0,vetsrc,numDeVet, saldoCaixa)
				pare
				caso 3:
					//relatorio temporario
					ordenacaoVend(1,1,numDeVet[2],vetsrc[3])
				pare
				caso 4:
					saida=falso
					//fechar caixa

				pare
			}
               
               
           	//se(mouse(735, 475, 325, 85) == verdadeiro 
           	/*se (mouse(735, 620, 325, 85) == verdadeiro e mou == m.BOTAO_ESQUERDO){
           	 	grf.definir_cor(grf.COR_VERDE)
				grf.desenhar_retangulo(745, 480, 305, 84, verdadeiro, falso)
		     	grf.definir_tamanho_texto(20.0)
		          grf.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	grf.desenhar_texto(LarguraT/4, AlturaT / 1.15, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
           	}
               //Função para Relatório 
            	se(mouse(735, 620, 325, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
            		
				grf.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, falso)
				grf.definir_cor(grf.COR_VERDE)
		     	grf.definir_tamanho_texto(20.0)
		          grf.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		  		     	
			
               }

               //Função para Fechar caixa
            	se(mouse(735, 765, 325, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
            		
				grf.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, falso)
				grf.definir_cor(grf.COR_VERDE)
		     	grf.definir_tamanho_texto(20.0)
		          grf.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	
			
               }
               */
          }
          grf.encerrar_modo_grafico()
     }
	funcao f_front_venda(){}
	funcao f_front_cadastro(cadeia senha, cadeia &vetor[]){
		logico saida = verdadeiro
		cadeia texto = ""
		enquanto(saida){
			Apresenta_Registro(0, Tela(1920, 684, LarguraT),Tela(1080, 850, AlturaT),texto)//para login e senha
			Escrever(texto, saida)
		}
		
		logico chaveTentativas = verdadeiro
		se(texto != senha){
			para(inteiro tentativas = 1; tentativas <= 5; tentativas++){
				saida = verdadeiro
				enquanto(saida){
					Apresenta_Registro(1, Tela(1920, 684, LarguraT),Tela(1080, 850, AlturaT),texto)
					Escrever(texto, saida)
					
				}
				se(texto != senha){
					chaveTentativas = falso
				}
				senao{
					chaveTentativas = verdadeiro
				}
			}
		}
		se(chaveTentativas){
		//nome
		saida = verdadeiro
		texto = ""
		enquanto(saida){
			Apresentar_Cadastro(0, Tela(1920, 694, LarguraT),Tela(1080, 749, AlturaT),texto)//para login e senha
			Escrever(texto, saida)
			se(texto != ""){
				vetor[1] = texto
			}
			senao{
				saida = verdadeiro	
			}
		}
		//Peso ou kg
		texto = ""
		saida = verdadeiro
		inteiro descisao = 0
		enquanto(descisao == 0){
			Apresentar_Cadastro(2,Tela(1920, 694, LarguraT),Tela(1080, 765, AlturaT),texto)
			inteiro mou = m.ler_botao()
			se(mouse(Tela(1920,798,LarguraT), Tela(1080,721,AlturaT), Tela(1920,140,LarguraT), Tela(1080,53,AlturaT))e mou == m.BOTAO_ESQUERDO){
				descisao = 1
				vetor[3] += verdadeiro
			}
			senao se(mouse(Tela(1920,951,LarguraT), Tela(1080,721,AlturaT), Tela(1920,140,LarguraT), Tela(1080,53,AlturaT))e mou == m.BOTAO_ESQUERDO){
				descisao = 2
				vetor[3] += falso
			}
		}
		//quantidade
		saida = verdadeiro
		texto = ""
		enquanto(saida){
			Apresentar_Cadastro(1,Tela(1920, 694, LarguraT),Tela(1080, 745, AlturaT),texto)
			Escrever_Num(0,texto, saida)
			se(typ.cadeia_e_inteiro(texto, 10)){
				se(vetor[3]== "true"){
					vetor[2] = texto
				}
				senao{
					vetor[2] = typ.inteiro_para_cadeia(typ.cadeia_para_inteiro(texto, 10)*1000, 10)
				}
			}
			senao{
				saida = verdadeiro
			}
		}
		texto = ""
		saida = verdadeiro
		se(descisao == 1){
			enquanto(saida){
				inteiro x = m.posicao_x()
				inteiro y = m.posicao_y()
				Apresentar_Cadastro(4,Tela(1920, 694, LarguraT),Tela(1080, 750, AlturaT),texto)
				Escrever_Num(1,texto, saida)
				se(typ.cadeia_e_real(texto) ou typ.cadeia_e_inteiro(texto, 10)){
					real valor = typ.cadeia_para_real(texto)
					vetor[4] = typ.real_para_cadeia(valor)
				}
				senao{
					saida = verdadeiro
				}
			}
		}
		senao se(descisao == 2){
			enquanto(saida){
				Apresentar_Cadastro(3,Tela(1920, 694, LarguraT),Tela(1080, 750, AlturaT),texto)
				Escrever_Num(1,texto, saida)
				se(typ.cadeia_e_real(texto) ou typ.cadeia_e_inteiro(texto, 10)){
					real valor = typ.cadeia_para_real(texto)
					vetor[4] = typ.real_para_cadeia(valor)
				}
				senao{
					saida = verdadeiro
				}
			}
		}
		
		texto = ""
		saida = verdadeiro
		enquanto(saida){
			Apresentar_Cadastro(5,Tela(1920, 694, LarguraT),Tela(1080, 765, AlturaT),texto)
			Escrever_Num(1,texto, saida)
			se((typ.cadeia_e_real(texto) ou typ.cadeia_e_inteiro(texto, 10)) e (typ.cadeia_para_real(texto) < typ.cadeia_para_real(vetor[4]))){
				real valor = typ.cadeia_para_real(texto)
				vetor[5] = typ.real_para_cadeia(valor)
			}
			senao{
				saida = verdadeiro
			}
		}
		texto = ""
		Apresentar_Cadastro(6,0,0,texto)
		utl.aguarde(3500)
		}
		senao{
			Apresenta_Registro(2,0,0,texto)
			utl.aguarde(3500)
		}
	}
	
     funcao vazio Apresenta_Registro(inteiro id, inteiro x, inteiro y,cadeia &texto)// função para aparecer a outra tela 
     {
     	
     	escolha(id){
     	caso 0:
     		inteiro ImgAcesso = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/verificar_ADM/tela_verfica_acesso1.png")
     		inteiro telaAcesso = grf.redimensionar_imagem(ImgAcesso, LarguraT, AlturaT, verdadeiro)
	     	grf.desenhar_imagem(0, 0, telaAcesso)
	     	grf.desenhar_texto(x, y, texto+"_")
	     	grf.liberar_imagem(telaAcesso)
	     	pare
     	caso 1:
     		inteiro ImgAcessoNegado = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/verificar_ADM/senha_incorreta.png")
     		inteiro telaAcessoNegado = grf.redimensionar_imagem(ImgAcessoNegado, LarguraT, AlturaT, verdadeiro)
     		grf.desenhar_imagem(0, 0, telaAcessoNegado)
     		grf.desenhar_texto(x, y, texto+"_")
     		grf.liberar_imagem(telaAcessoNegado)
     		grf.liberar_imagem(ImgAcessoNegado)
     		pare
		caso 2:
			inteiro ImgExcessoTentativas = grf.carregar_imagem ("./midia/imagens/Telas do Front Padaria/verificar_ADM/excedeu_tentativas.png")
			inteiro telaExcessoTentativas = grf.redimensionar_imagem(ImgExcessoTentativas, LarguraT, AlturaT, verdadeiro)
			grf.desenhar_imagem(0, 0, telaExcessoTentativas)
			grf.liberar_imagem(telaExcessoTentativas)
     		grf.liberar_imagem(ImgExcessoTentativas)
			pare
     		
     	}
     	grf.renderizar()
     }
     
	funcao Apresentar_Cadastro(inteiro id, inteiro x, inteiro y,cadeia &texto){
		
    	
		escolha(id){
			caso 0:
				inteiro ImgNome = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/nome_produto.png")
				inteiro telaNome = grf.redimensionar_imagem(ImgNome, LarguraT, AlturaT, verdadeiro)
				grf.desenhar_imagem(0, 0, telaNome)
				grf.desenhar_texto(x, y, texto+"_")
			     grf.liberar_imagem(telaNome)
			     grf.liberar_imagem(ImgNome)
				pare
			caso 1:
				inteiro ImgQuantidade = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/quant_produtos.png")
     			inteiro telaQuantidade = grf.redimensionar_imagem(ImgQuantidade, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaQuantidade)
			     grf.desenhar_texto(x, y, texto+"_")
			     grf.liberar_imagem(telaQuantidade)
			     grf.liberar_imagem(ImgQuantidade)
		     	pare
		     caso 2:
		     	inteiro ImgPesoUnitario = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/kg_ou_uni.png")
				inteiro telaPesoUnitario = grf.redimensionar_imagem(ImgPesoUnitario, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaPesoUnitario)
			     grf.liberar_imagem(telaPesoUnitario)
			     grf.liberar_imagem(ImgPesoUnitario)
		     	pare
		     caso 3:
		     	inteiro ImgPeso = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/preco_kgrf.png")
				inteiro telaPeso = grf.redimensionar_imagem(ImgPeso, LarguraT, AlturaT, verdadeiro)
		     	grf.desenhar_imagem(0, 0, telaPeso)
		     	grf.desenhar_texto(x, y, texto+"_")
		     	grf.liberar_imagem(telaPeso)
		     	pare
		     caso 4:
		     	inteiro ImgUnitario = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/preco_unidade.png")
				inteiro telaUnitario = grf.redimensionar_imagem(ImgUnitario, LarguraT, AlturaT, verdadeiro)
		     	grf.desenhar_imagem(0, 0, telaUnitario)
		     	grf.desenhar_texto(x, y, texto+"_")
		     	grf.liberar_imagem(telaUnitario)
		     	grf.liberar_imagem(ImgUnitario)
		     	pare
		     caso 5:
		     	inteiro ImgCusto = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Custo.png")
		     	inteiro telaCusto = grf.redimensionar_imagem(ImgCusto, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaCusto)
			     grf.desenhar_texto(x, y, texto+"_")
			     grf.liberar_imagem(telaCusto)
			     grf.liberar_imagem(ImgCusto)
		     	pare
		      caso 6:
		      	inteiro ImgCadastroSucesso = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/produto_cadastrado.png")
				inteiro telaCadastroSucesso = grf.redimensionar_imagem(ImgCadastroSucesso, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaCadastroSucesso)
			     grf.liberar_imagem(telaCadastroSucesso)
			     grf.liberar_imagem(ImgCadastroSucesso)
		     	pare
		}
		
		grf.renderizar()
	}	
	funcao inteiro Tela(inteiro Base, inteiro posiTam, inteiro tela){
		retorne ((tela*posiTam)/Base)
	}
     funcao vazio Escrever (cadeia &texto, logico &saida)
     {
		inteiro tam = txt.numero_caracteres(texto)
          inteiro tecla = tec.ler_tecla() // função para pegar o código da tecla pressionada.

		grf.definir_cor(grf.COR_AZUL) // cor da letra da variavel ( texto )
          grf.definir_tamanho_texto(20.0) // ( texto)
		se (tecla >= tec.TECLA_A e tecla <= tec.TECLA_Z ou tecla == tec.TECLA_ESPACO) {
			se(tam < 29){
                    texto += tec.caracter_tecla(tecla)
			}
          }
          senao {
                    se (tecla == tec.TECLA_BACKSPACE e tam >= 1) {
                         texto = txt.extrair_subtexto(texto, 0, tam - 1)
                    }
          }
          se(tecla == tec.TECLA_ENTER){
          	saida = falso	
          }
          
     }
     funcao vazio Escrever_Num(inteiro id, cadeia &texto, logico &saida)
     {
		inteiro tam = txt.numero_caracteres(texto)
          inteiro tecla = tec.ler_tecla() // função para pegar o código da tecla pressionada.

		grf.definir_cor(grf.COR_AZUL) // cor da letra da variavel ( texto )
          grf.definir_tamanho_texto(20.0) // ( texto)
          se(id == 0){
			se (tecla >= tec.TECLA_0 e tecla <= tec.TECLA_9) {
				se(tam < 29){
	                    texto += tec.caracter_tecla(tecla)
				}
	          }
          }
          senao se(id == 1){
          	se (tecla >= tec.TECLA_0 e tecla <= tec.TECLA_9 ou tecla == tec.TECLA_PONTO_FINAL){
				se(tam < 29){
	                    texto += tec.caracter_tecla(tecla)
				}
	          }
          }
		se(tecla == tec.TECLA_BACKSPACE e tam >= 1) {
			texto = txt.extrair_subtexto(texto, 0, tam - 1)
		}
          se(tecla == tec.TECLA_ENTER){
          	saida = falso	
          }
          
     }	
}
