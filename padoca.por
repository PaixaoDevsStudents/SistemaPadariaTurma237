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
	cadeia computador =  utl.obter_diretorio_usuario()
	
	//Menu 
	inteiro ImgMenu = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/menu/menu_programa1.png")
     //Login e Senha
     inteiro ImgAcesso = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/verificar_ADM/tela_verfica_acesso1.png")
     inteiro ImgAcessoNegado = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/verificar_ADM/senha_incorreta.png")
     inteiro ImgExcessoTentativas = grf.carregar_imagem ("./midia/imagens/Telas do Front Padaria/verificar_ADM/excedeu_tentativas.png")
     //cadastro
     inteiro ImgNome = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/nome_produto.png")
    	inteiro ImgCusto = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/custo_produto.png")
	inteiro ImgPesoUnitario = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/kg_ou_uni.png")
	inteiro ImgPeso = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/preco_kg.png")
	inteiro ImgUnitario = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/preco_unidade.png")
	inteiro ImgQuantidade = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/quant_produtos.png")
     inteiro ImgCadastroSucesso = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/cadastro/produto_cadastrado.png")
	
     /*cadastro
     inteiro ImgNome = grf.carregar_imagem(computador+"./midia/imagens/Sistema Padaria 2.0/Nome.png")
    	inteiro ImgCusto = grf.carregar_imagem(computador+"./midia/imagens/Sistema Padaria 2.0/Custo.png")
	inteiro ImgPesoUnitario = grf.carregar_imagem(computador+"./midia/imagens/Sistema Padaria 2.0/PesoUnitario.png")
	inteiro ImgPeso = grf.carregar_imagem(computador+"./midia/imagens/Sistema Padaria 2.0/Peso.png")
	inteiro ImgUnitario = grf.carregar_imagem(computador+"./midia/imagens/Sistema Padaria 2.0/Unitario.png")
	inteiro ImgQuantidade = grf.carregar_imagem(computador+"./midia/imagens/Sistema Padaria 2.0/Quantidade.png")
     inteiro ImgCadastroSucesso = grf.carregar_imagem(computador+"./midia/imagens/Sistema Padaria 2.0/CadastradoSucesso.png")*/
	
	funcao inicio()
	{	
		//variaveis
		inteiro arquivo, mnu=0, qtd_estoque=0, id_produto=0
		real val_uni=0.0, val_custo=0.0
		cadeia nome_produto="", vetsrc[5], typdata[2]={"arquivo de dados|txt","arquivo de dados|txt"}
		inteiro opcao
		inteiro numDeVet[3]
		//leitura de arquivos
		para(inteiro c=0;c<5;c++){
			escreva("Selecione a sequência de arquivos:\n1-Carrinho\n2-Produtos Registrados\n3-Total de vendas\n4-Vendas do dia\n5-Registro de vendas")
			vetsrc[c] = src.selecionar_arquivo(typdata, verdadeiro)
		}
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
			real preco = typ.cadeia_para_real(vetorProd[3])//declara variável de preco e dá o preço do produto

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
				limite = typ.cadeia_para_inteiro(vetorProd[2], 10)//váriavel limite de estoque recebe limite de estoque
				//se estoque foi esgotado
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
					valorTotal += (preco * quantidadeVend)//valorTotal recebe o valor da compra
					
					valorTotalD += valorTotal
					pare
				// caso cartão: acréscimo de 3%
				caso 3:
					//opção foi cartão, escreve texto sobre escolha
					escreva("Forma de pagamento em cartão de crédito/débito foi escolhido.\n3% de acrescimo foi acrescentado ao valor da compra.\n")
					valorTotal += (preco * quantidadeVend)//valorTotal recebe o valor da compra
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
			
			inteiro arqVenda = src.abrir_arquivo(caminho[2], src.MODO_LEITURA)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de leitura
			,arqVendaDiaria = src.abrir_arquivo(caminho[3], src.MODO_LEITURA)
			
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
					
					arqVenda = src.abrir_arquivo(caminho[2], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
					arqVendaDiaria = src.abrir_arquivo(caminho[3], src.MODO_ACRESCENTAR)//abre PRODBase de vendas e armazena endereço de memória na variável arqVendas em modo de acréscimo
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
							src.substituir_texto(caminho[2], linhaVendOrig, linhaVend, verdadeiro)
						}
						se(codD == posicao){
							src.substituir_texto(caminho[3], linhaVendOrigD, linhaVendD, verdadeiro)
						}
					}
					//substitui os dados antigos do produto vendido pelos novos dados atualizados

					src.substituir_texto(caminho[1], linhaOriginal, linhaSubsProd, verdadeiro)
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
	funcao real abrirCaixa (real saldoCaixa){
		saldoCaixa = entradaBaseReal("Abertura de caixa, Quantos reais tem no caixa?: ")
		retorne saldoCaixa
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
	funcao pesquisarProduto(inteiro id,cadeia caminho[], inteiro vetDeNum[], real saldoCaixa){
		inteiro opcaoInterna, arquivo, saidaLoop, j = 1
		cadeia vetInfProd[5]
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
				arquivo = src.abrir_arquivo(caminho[1], src.MODO_LEITURA)
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
	funcao cadastroProduto(cadeia caminho, inteiro numDeProd, cadeia senha){
		cadeia vetor[6]
		//loop para limpar o vetor de valores vazios
		para(inteiro i = 0; i< PROD; i++){
			vetor[i] = ""
		} 
        f_front_cadastro(senha, vetor)
            vetor[0] += (numDeProd+1)
        // Antes de passar o produto, verifique se o produto já existe
        // Esta linha chama a função produtoExiste para verificar se o produto já existe no arquivo
        se (produtoExiste(vetor[1], caminho) == falso) {
            // Validação de quantidade de produtos
            // Esta parte garante que a quantidade de produtos inserida seja um número inteiro maior que zero
            inteiro quantidade
            faca {
                quantidade = entradaBaseInteiro("Insira a quantidade do produto: ")
            } enquanto (quantidade <= 0)
            vetor[2] = typ.inteiro_para_cadeia(quantidade, 10)

            // Validação de valores de produtos
            // Esta parte garante que o valor de custo do produto não seja maior que o valor do produto
            real valor_custo, valor_produto
            faca {
                valor_custo = entradaBaseReal("Insira o valor de custo do produto: ")
                valor_produto = entradaBaseReal("Insira o valor do produto: ")
                se (valor_custo > valor_produto) {
                    escreva("O valor de custo não pode ser maior que o valor do produto. Por favor, tente novamente.")
                }
            } enquanto (valor_custo > valor_produto)
            vetor[3] = typ.real_para_cadeia(valor_produto)
            vetor[4] = typ.real_para_cadeia(valor_custo)

            passeProduto(1, caminho , vetor)//passa os dados do produto para o arquivo
        } senao {
            escreva("O produto já existe. Por favor, tente novamente com um produto diferente.")
        }
    
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
				arquivo = src.abrir_arquivo(caminho, src.MODO_ESCRITA)//variável arquivo recebe permissão para abrir e somente escrever no arquivo com matrizes
				pare
			//MODO ACRESCENTAR 
			caso 1:
				arquivo = src.abrir_arquivo(caminho, src.MODO_ACRESCENTAR)//variável arquivo recebe permissão para abrir e somente acrescentar no arquivo com matrizes
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
		inteiro arquivoVendaD = src.abrir_arquivo(caminhoVendasD, src.MODO_LEITURA)
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
	funcao fechamentoCaixa(cadeia password, cadeia vetsrc[]) {
	    // Solicita a verificação de acesso
	    verifAcess(password)
	    logico formato_24h = verdadeiro
	    // Após a verificação bem-sucedida, pergunte ao usuário se ele realmente deseja fechar o caixa
	    escreva("Você realmente deseja fechar o caixa? (S/N)\n-->")
	    caracter resposta
	    leia(resposta)
	    enquanto (resposta != 'S' e resposta != 's' e resposta != 'N' e resposta != 'n') {
	        escreva("Entrada inválida. Por favor, insira 'S' para sim ou 'N' para não.\n-->")
	        leia(resposta)
	    }
	    se (resposta == 'N' ou resposta == 'n') {
	        inicio() // Volta para o menu inicial se o usuário responder 'N' ou 'n'
	    }senao{
	    // Se o usuário responder 'S' ou 's', prossiga com o fechamento do caixa
	    escreva("Fechando o caixa...\n")
	      gerarRelatorioVendas(vetsrc)
	    
	   // Registrar a data e hora de fechamento
	    cadeia dataHoraFechamento = Data()
	    escreva("Data e hora de fechamento: ", dataHoraFechamento, "\n")
	    }
	}
	funcao cadeia Data() {
	    cadeia dia = typ.inteiro_para_cadeia(cal.dia_mes_atual(),10)
	    cadeia mes = typ.inteiro_para_cadeia(cal.mes_atual(),10)
	    cadeia ano = typ.inteiro_para_cadeia(cal.ano_atual(),10)
	    cadeia hora = typ.inteiro_para_cadeia(cal.hora_atual(verdadeiro),10) // formato_24h = verdadeiro
	    cadeia minuto = typ.inteiro_para_cadeia(cal.minuto_atual(),10)
	
	    // Adiciona um zero à esquerda se o dia, mês, hora ou minuto tiverem apenas um dígito
	    se (txt.numero_caracteres(dia) == 1) {
	        dia = "0" + dia
	    }
	    se (txt.numero_caracteres(mes) == 1) {
	        mes = "0" + mes
	    }
	    se (txt.numero_caracteres(hora) == 1) {
	        hora = "0" + hora
	    }
	    se (txt.numero_caracteres(minuto) == 1) {
	        minuto = "0" + minuto
	    }
	
	    retorne ""+dia+"/"+mes+"/"+ano+"\t"+hora+":"+minuto
	}
	funcao vazio gerarRelatorioVendas(cadeia vetsrc[]) {
	        // Abra o arquivo onde os dados de vendas estão armazenados    
	        cadeia dataHoraFechamento = Data()
	        cadeia caminho = vetsrc[3] // Ajuste o índice conforme necessário para o caminho correto
	        inteiro arquivoVendas = src.abrir_arquivo(caminho, src.MODO_LEITURA)
	
	        escreva("===========================================\n")
	        escreva("\tRELATÓRIO\n")
	        escreva("===========================================\n")
	
	        // Leia cada linha do arquivo de vendas
	        cadeia linha = src.ler_linha(arquivoVendas)
	        enquanto (src.fim_arquivo(arquivoVendas) == falso) {
	            // Supondo que cada linha esteja no formato "nomeProduto;quantidadeVendida;valorTotalVenda"
	            // A linha é exibida diretamente, a formatação será feita pela biblioteca gráfica
	            escreva(linha + "\n")
	            linha = src.ler_linha(arquivoVendas)
	        
	
	        escreva("===========================================\n")
	
	        // Feche o arquivo de vendas
	        src.fechar_arquivo(arquivoVendas)
	    }
	    
	    escreva("\n=============================================\n")
	    escreva("TOTAL DE VENDAS DO DIA: "+  +"\n")
	    escreva("=============================================\n")
	
	    // Feche o arquivo de vendas
	    
	    src.fechar_arquivo(arquivoVendas)
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
	
	//front en
	funcao realizarVendas(inteiro id, inteiro x, inteiro y,cadeia &texto){a
		leia(id)
		//inteiro imgCodigo=0, alturaT=0, larguraT=0,imgquantidade=0, imgQuantErrada=0, imgTelaValor =0
		inteiro alturaT=0, larguraT=0
		escolha(id){
			caso 1: 
			inteiro ImgCodigo =  grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/cod_produto.png")
			inteiro TelaCodigo = grf.redimensionar_imagem(ImgCodigo, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0, TelaCodigo)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(TelaCodigo)
               grf.liberar_imagem( ImgCodigo)
			pare 
			caso 2: 
			inteiro ImgCodInexistente  = grf.carregar_imagem("./imagens/Telas do Front Padaria/vendas/cod_inexistente.png")
			inteiro CodInesxistente =  grf.redimensionar_imagem(ImgCodInexistente, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0, CodInesxistente)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(CodInesxistente)
               grf.liberar_imagem(ImgCodInexistente)
			pare
			caso 3: 
			 inteiro  ImgQuantidade = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/cod_prod_qtdvend.png")
			 inteiro TelaQuantidade = grf.redimensionar_imagem(ImgQuantidade, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0,  TelaQuantidade)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem( TelaQuantidade)
               grf.liberar_imagem( ImgQuantidade)
			pare
			caso 4: 
			 inteiro ImgQuantErrada = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/erro_qtd_infor.png")
			 inteiro TelaQuantErrada = grf.redimensionar_imagem(ImgQuantErrada, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0, TelaQuantErrada)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(TelaQuantErrada)
               grf.liberar_imagem(ImgQuantErrada)
			
			pare
			caso 5:
               inteiro ImgFinalizarVend =grf.carregar_imagem("./imagens/Telas do Front Padaria/vendas/vend_finali.png")
               inteiro FinalizarVend = grf.redimensionar_imagem(ImgFinalizarVend, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0, FinalizarVend)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(FinalizarVend)
               grf.liberar_imagem(ImgFinalizarVend)
			pare
			caso 6:
			inteiro ImgFormaPag = grf.carregar_imagem("./imagens/Telas do Front Padaria/vendas/forma_pagrf.png")
			inteiro TelaFormaPag = grf.redimensionar_imagem(ImgFormaPag, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0, TelaFormaPag )
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(TelaFormaPag )
               grf.liberar_imagem(ImgFormaPag)
			pare
			caso 7:
               inteiro ImgTelaValor = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/valor_ pgmento.png")
			inteiro TelaValor = grf.redimensionar_imagem(ImgTelaValor, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0, TelaValor)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(TelaValor)
               grf.liberar_imagem(ImgTelaValor)
			pare 
			caso 8:
               inteiro ImgTipoCartao = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/selec_cart.png")
               inteiro TipoCartao = grf.redimensionar_imagem(ImgTipoCartao, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0, TipoCartao)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(TipoCartao )
               grf.liberar_imagem(ImgTipoCartao)
			pare
			caso 9:
			inteiro ImgPagamentoCred = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/pgmento_credito.png")
			inteiro PagamentoCred = grf.redimensionar_imagem(ImgPagamentoCred, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0,  PagamentoCred )
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem( PagamentoCred)
               grf.liberar_imagem( ImgPagamentoCred )
			
			pare
		     caso 10:
		     inteiro ImgPagamentoDeb = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/pgmento_debito.png")
		     inteiro PagamentoDeb = grf.redimensionar_imagem(ImgPagamentoDeb, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0,  PagamentoDeb)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem( PagamentoDeb)
               grf.liberar_imagem(ImgPagamentoDeb)
       
		     pare 
		     caso 11:
		     inteiro ImgPix = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/qrcod_gerado.png")
		     inteiro PixQrcod =  grf.redimensionar_imagem(ImgPix, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0,  PixQrcod)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem( PixQrcod)
               grf.liberar_imagem( ImgPix )
		     pare 
		     caso 12:
		     inteiro ImgPixAprovad = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/qrcod_aprov.png")
		     inteiro PixAprovad =  grf.redimensionar_imagem(ImgPixAprovad, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0,  PixAprovad)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem( PixAprovad)
               grf.liberar_imagem( ImgPixAprovad )
		     pare 
		     caso 13:
               inteiro ImgTroco = grf.carregar_imagem("./midia/imagens/Telas do Front Padaria/vendas/inf_pagtroco.png")
		     inteiro Troco =  grf.redimensionar_imagem(ImgTroco, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0,  Troco)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(Troco)
               grf.liberar_imagem(ImgTroco)
		     pare 
		     caso 14:
               inteiro ImgPagAprovad = grf.carregar_imagem("/midia/imagens/Telas do Front Padaria/vendas/pag_aprovado.png")
               inteiro PagAprovad = grf.redimensionar_imagem(ImgPagAprovad, LarguraT, AlturaT, verdadeiro)
               grf.desenhar_imagem(0, 0,  PagAprovad)
               grf.desenhar_texto(x, y, texto+"_")
               grf.liberar_imagem(PagAprovad)
               grf.liberar_imagem(ImgPagAprovad)
		     pare 
			
			}
		grf.renderizar()
		}
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
               inteiro telaMenu = grf.redimensionar_imagem(ImgMenu, LarguraT, AlturaT, verdadeiro) // variavel que recebe a foto da variavel (telaMenu) e redimensiona para cobrir toda a janela.
               grf.desenhar_imagem(0,0, telaMenu)
               grf.liberar_imagem(telaMenu)  // libera o cache dessa imagem da memoria RAM 
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
               
               //Função para Realizar Vendas
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
		     	
			
               }*/
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
		se(texto != senha){
			saida = verdadeiro
			enquanto(saida){
				Apresenta_Registro(1, Tela(1920, 684, LarguraT),Tela(1080, 850, AlturaT),texto)
				Escrever(texto, saida)
				se(texto != senha){
					saida = verdadeiro
				}
			}
		}
		saida = verdadeiro
		texto = ""
		enquanto(saida){
			Apresentar_Cadastro(0, Tela(1920, 694, LarguraT),Tela(1080, 749, AlturaT),texto)//para login e senha
			Escrever(texto, saida)
			
			vetor[1] = texto
		}
		saida = verdadeiro
		texto = ""
		enquanto(saida){
			Apresentar_Cadastro(1,Tela(1920, 694, LarguraT),Tela(1080, 745, AlturaT),texto)
			Escrever_Num(0,texto, saida)
			se(typ.cadeia_e_inteiro(texto, 10)){
				vetor[2] = texto
			}
			senao{
				saida = verdadeiro
			}
		}
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
			se(typ.cadeia_e_real(texto) ou typ.cadeia_e_inteiro(texto, 10)){
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
     funcao vazio Apresenta_Registro(inteiro id, inteiro x, inteiro y,cadeia &texto)// função para aparecer a outra tela 
     {
     	se(id == 0){
     		inteiro telaAcesso = grf.redimensionar_imagem(ImgAcesso, LarguraT, AlturaT, verdadeiro)
	     	grf.desenhar_imagem(0, 0, telaAcesso)
	     	grf.desenhar_texto(x, y, texto+"_")
	     	grf.liberar_imagem(telaAcesso)
     	}
     	senao se(id == 1){
     		inteiro telaAcessoNegado = grf.redimensionar_imagem(ImgAcessoNegado, LarguraT, AlturaT, verdadeiro)
     		grf.desenhar_imagem(0, 0, telaAcessoNegado)
     		grf.desenhar_texto(x, y, texto+"_")
     		grf.liberar_imagem(telaAcessoNegado)
     	} 
     	grf.renderizar()
     }
	funcao Apresentar_Cadastro(inteiro id, inteiro x, inteiro y,cadeia &texto){
		escolha(id){
			caso 0:
				inteiro telaNome = grf.redimensionar_imagem(ImgNome, LarguraT, AlturaT, verdadeiro)
				grf.desenhar_imagem(0, 0, telaNome)
				grf.desenhar_texto(x, y, texto+"_")
			     grf.liberar_imagem(telaNome)
				pare
			caso 1:
				inteiro telaQuantidade = grf.redimensionar_imagem(ImgQuantidade, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaQuantidade)
			     grf.desenhar_texto(x, y, texto+"_")
			     grf.liberar_imagem(telaQuantidade)
		     	pare
		     caso 2:
		     	inteiro telaPesoUnitario = grf.redimensionar_imagem(ImgPesoUnitario, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaPesoUnitario)
			     grf.liberar_imagem(telaPesoUnitario)
		     	pare
		     caso 3:
		     	inteiro telaPeso = grf.redimensionar_imagem(ImgPeso, LarguraT, AlturaT, verdadeiro)
		     	grf.desenhar_imagem(0, 0, telaPeso)
		     	grf.desenhar_texto(x, y, texto+"_")
		     	grf.liberar_imagem(telaPeso)
		     	pare
		     caso 4:
		     	inteiro telaUnitario = grf.redimensionar_imagem(ImgUnitario, LarguraT, AlturaT, verdadeiro)
		     	grf.desenhar_imagem(0, 0, telaUnitario)
		     	grf.desenhar_texto(x, y, texto+"_")
		     	grf.liberar_imagem(telaUnitario)
		     	pare
		     caso 5:
		     	inteiro telaCusto = grf.redimensionar_imagem(ImgCusto, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaCusto)
			     grf.desenhar_texto(x, y, texto+"_")
			     grf.liberar_imagem(telaCusto)
		     	pare
		      caso 6:
		     	inteiro telaCadastroSucesso = grf.redimensionar_imagem(ImgCadastroSucesso, LarguraT, AlturaT, verdadeiro)
			     grf.desenhar_imagem(0, 0, telaCadastroSucesso)
			     grf.liberar_imagem(telaCadastroSucesso)
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
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 42246; 
 * @DOBRAMENTO-CODIGO = [45, 62, 68, 368, 378, 382, 481, 544, 557, 578, 617, 633, 664, 683, 716, 755, 773, 797, 832, 864, 887, 911, 934, 967, 997, 1121, 1128, 1216, 1315, 1331, 1377, 1380, 1402];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz;
 */