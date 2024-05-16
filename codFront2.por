programa
{
	//Bibliotecas
     inclua biblioteca Graficos --> g
     inclua biblioteca Mouse --> m
     inclua biblioteca Calendario --> C
     inclua biblioteca Teclado --> tec
     inclua biblioteca Texto --> txt
     inclua biblioteca Tipos --> typ
     inclua biblioteca Util --> utl
//------------------------------------------------------------------

     //Altura e Largura da janela de exibição
     inteiro LarguraT = g.largura_tela()
     inteiro AlturaT = g.altura_tela()

//--------------------------------------------------------------------
 
 /*TELAS*/
 	//Caminho base
 	cadeia computador =  utl.obter_diretorio_usuario()
	//Menu 
	
	
     /*
     //Relatório
     inteiro TelaRelatDia = g.carregar_imagem()
     inteiro TelaVerificaAdm = g.carregar_imagem()
	inteiro TelaCaixFechado = g.carregar_imagem()
	
     //FecharCaixa
     inteiro TelaVerificaAdm = g.carregar_imagem()
     inteiro TelaAdmNegado = g.carregar_imagem()
     inteiro TelaRelatFinal = g.carregar_imagem()*/

 //---------------------------------------------------------------------------

     funcao inicio()
     {	
     	
     	
          
          g.definir_cor(Graficos.COR_BRANCO)
          interacaoBotaoLogar()
     }

//-------------------------------------------------------------------------------

	//Função para ativar o mouse
     funcao logico mouse(inteiro x, inteiro y, inteiro a, inteiro b)
     {
          se (m.posicao_x() >= x e m.posicao_y() >= y e m.posicao_x() <= x + a e m.posicao_y() <= y + b) {
               retorne verdadeiro
          }
          retorne falso
     }
//--------------------------------------------------------------------------------
	
     funcao interacaoBotaoLogar()
     {
          g.iniciar_modo_grafico(verdadeiro)
          g.definir_dimensoes_janela(LarguraT, AlturaT)
          g.renderizar()// antes de aparecer alguma imagem aparece uma tela preta.
         
          
          enquanto (verdadeiro) {
          	
               inteiro ImgMenu = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Menu.png")
               inteiro telaMenu = g.redimensionar_imagem(ImgMenu, LarguraT, AlturaT, verdadeiro) // variavel que recebe a foto da variavel (telaMenu) e redimensiona para cobrir toda a janela.
               g.desenhar_imagem(0,0, telaMenu)
               g.liberar_imagem(telaMenu)  // libera o cache dessa imagem da memoria RAM 
			g.liberar_imagem(ImgMenu) 
			g.renderizar()
			//Função para Cadastrar Produtos

			inteiro VerificaAdm = 0
			inteiro mou = m.ler_botao() 
			inteiro botao = 0 , Quantidade = 0
			cadeia senha = "ADMIN"
			cadeia texto = "", Nome = ""
			real Preco = 0.0, Custo= 0.0
			
			
       	  	//745, 480, 305, 84
       	  	//mouse(posicao x onde botão será criado,posicao y onde botão será criado,largura do botão que será criado, altura do botão que será criado )
			////////////////////////////
			
           	se(mouse(Tela(1920,735,LarguraT), Tela(1080,330,AlturaT), Tela(1920,325,LarguraT), Tela(1080,85,AlturaT)) e mou == m.BOTAO_ESQUERDO){
           		botao = 1
           		cadeia Produto[6]
           		para(inteiro i = 0; i < 6; i++){
           			Produto[i] = ""
           		}
           		f_front_cadastro(senha, Produto)
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
              	
			//Função para Realizar Vendas
           	//se(mouse(735, 475, 325, 85) == verdadeiro 
           	/*se (mouse(735, 620, 325, 85) == verdadeiro e mou == m.BOTAO_ESQUERDO){
           	 	g.definir_cor(g.COR_VERDE)
				g.desenhar_retangulo(745, 480, 305, 84, verdadeiro, falso)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	g.desenhar_texto(LarguraT/4, AlturaT / 1.15, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
           	}
               //Função para Relatório 
            	se(mouse(735, 620, 325, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
            		
				g.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, falso)
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		  		     	
			
               }

               //Função para Fechar caixa
            	se(mouse(735, 765, 325, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
            		
				g.desenhar_retangulo(LarguraT/2.5, 550, 350, 35, verdadeiro, falso)
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	
			
               }*/
          }
          g.encerrar_modo_grafico()
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
				vetor[2] += typ.cadeia_para_inteiro(texto,10)
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
					vetor[4] += typ.cadeia_para_real(texto)
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
					vetor[4] += typ.cadeia_para_real(texto)
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
				vetor[5] += typ.cadeia_para_real(texto)
			}
			senao{
				saida = verdadeiro
			}
		}
		texto = ""
		Apresentar_Cadastro(6,0,0,texto)
		utl.aguarde(3500)
	}

	
	//Login e Senha
	
	
	//cadastro
     
     //RealizarVendas
     /*
     inteiro TelaCodigo = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Codigo.png")
     inteiro TelaQuantidade = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/QuantidadeVenda.png")
     inteiro TelaQuantErrada = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/EstoqueLimite.png")
     inteiro TelaValor = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/ValorPago.png")
     inteiro TelaTroco = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Troco.png")
     inteiro TelaFormaPag = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Pagamento.png")
     inteiro TelaPagCart = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/CartaoPagar.png")
     inteiro TelaOpcCart = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Cartao.png")
     inteiro TelaPagCartConc = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/CartaoAprovado.png")
     inteiro TelaPagPix = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Pix.png")
     inteiro TelaPagPixConc = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/PixAprovado.png")
	*/
     funcao vazio Apresenta_Registro(inteiro id, inteiro x, inteiro y,cadeia &texto)// função para aparecer a outra tela 
     {
     	se(id == 0){
     		
     		inteiro ImgAcesso = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/VerificarAcesso.png")
     		inteiro telaAcesso = g.redimensionar_imagem(ImgAcesso, LarguraT, AlturaT, verdadeiro)
	     	g.desenhar_imagem(0, 0, telaAcesso)
	     	g.desenhar_texto(x, y, texto+"_")
	     	g.liberar_imagem(telaAcesso)
	     	g.liberar_imagem(ImgAcesso)
     	}
     	senao se(id == 1){
     		inteiro ImgAcessoNegado = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/AcessoNegado.png")
     		inteiro telaAcessoNegado = g.redimensionar_imagem(ImgAcessoNegado, LarguraT, AlturaT, verdadeiro)
     		g.desenhar_imagem(0, 0, telaAcessoNegado)
     		g.desenhar_texto(x, y, texto+"_")
     		g.liberar_imagem(telaAcessoNegado)
     		g.liberar_imagem(ImgAcessoNegado)
     	} 
     	g.renderizar()
     }
	funcao Apresentar_Cadastro(inteiro id, inteiro x, inteiro y,cadeia &texto){
		escolha(id){
			caso 0:
				inteiro ImgNome = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Nome.png")
				inteiro telaNome = g.redimensionar_imagem(ImgNome, LarguraT, AlturaT, verdadeiro)
				g.desenhar_imagem(0, 0, telaNome)
				g.desenhar_texto(x, y, texto+"_")
			     g.liberar_imagem(telaNome)
			     g.liberar_imagem(ImgNome)
				pare
			caso 1:
				inteiro ImgQuantidade = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Quantidade.png")
				inteiro telaQuantidade = g.redimensionar_imagem(ImgQuantidade, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaQuantidade)
			     g.desenhar_texto(x, y, texto+"_")
			     g.liberar_imagem(telaQuantidade)
			     g.liberar_imagem(ImgQuantidade)
		     	pare
		     caso 2:
		     	inteiro ImgPesoUnitario = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/PesoUnitario.png")
		     	inteiro telaPesoUnitario = g.redimensionar_imagem(ImgPesoUnitario, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaPesoUnitario)
			     g.liberar_imagem(telaPesoUnitario)
			     g.liberar_imagem(ImgPesoUnitario)
		     	pare
		     caso 3:
		     	inteiro ImgPeso = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Peso.png")
		     	inteiro telaPeso = g.redimensionar_imagem(ImgPeso, LarguraT, AlturaT, verdadeiro)
		     	g.desenhar_imagem(0, 0, telaPeso)
		     	g.desenhar_texto(x, y, texto+"_")
		     	g.liberar_imagem(telaPeso)
		     	pare
		     caso 4:
		     	inteiro ImgUnitario = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Unitario.png")
		     	inteiro telaUnitario = g.redimensionar_imagem(ImgUnitario, LarguraT, AlturaT, verdadeiro)
		     	g.desenhar_imagem(0, 0, telaUnitario)
		     	g.desenhar_texto(x, y, texto+"_")
		     	g.liberar_imagem(telaUnitario)
		     	g.liberar_imagem(ImgUnitario)
		     	pare
		     caso 5:
		     	inteiro ImgCusto = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Custo.png")
		     	inteiro telaCusto = g.redimensionar_imagem(ImgCusto, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaCusto)
			     g.desenhar_texto(x, y, texto+"_")
			     g.liberar_imagem(telaCusto)
			     g.liberar_imagem(ImgCusto)
		     	pare
		      caso 6:
		      	inteiro ImgCadastroSucesso = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/CadastradoSucesso.png")
		     	inteiro telaCadastroSucesso = g.redimensionar_imagem(ImgCadastroSucesso, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaCadastroSucesso)
			     g.liberar_imagem(telaCadastroSucesso)
			     g.liberar_imagem(ImgCadastroSucesso)
		     	pare
		}
		
		g.renderizar()
	}
	/*
	funcao Apresentar_Venda(inteiro id, inteiro x, inteiro y,cadeia &texto){
		//inteiro imgCodigo=0, LarguraT=0, AlturaT=0,imgquantidade=0, imgQuantErrada=0, imgTelaValor =0
		escolha(id){
			caso 1: 
              	TelaCodigo =  g.redimensionar_imagem( TelaCodigo=0, LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0, TelaCodigo)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem(TelaCodigo)
			pare 
			caso 2: 
               TelaQuantidade = g.redimensionar_imagem( TelaQuantidade, LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0, TelaQuantidade)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem(TelaQuantidade)
			pare
			caso 3: 
			TelaQuantErrada =  g.redimensionar_imagem(TelaQuantErrada , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0, TelaQuantErrada)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem(TelaQuantErrada)
			pare
			caso 4: 
               TelaValor =  g.redimensionar_imagem( TelaValor , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0, TelaValor)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem(TelaValor)
			pare
			caso 5:
               TelaTroco =  g.redimensionar_imagem( TelaTroco, LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0, TelaTroco)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem(TelaTroco)
			pare
			caso 6:
               TelaFormaPag =  g.redimensionar_imagem(  TelaFormaPag , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0,  TelaFormaPag)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem( TelaFormaPag)
			
			pare 
			caso 7:
		     TelaPagCart =  g.redimensionar_imagem(TelaPagCart , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0,  TelaPagCart)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem( TelaPagCart)
			
			pare
		     caso 8:
		     TelaOpcCart =  g.redimensionar_imagem(TelaOpcCart , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0,  TelaOpcCart)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem( TelaOpcCart)
       
		     pare 
		     caso 9:
              TelaPagCartConc =  g.redimensionar_imagem(TelaPagCartConc , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0,  TelaPagCartConc)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem( TelaPagCartConc)
		     pare 
		     caso 10:
               TelaPagPix=  g.redimensionar_imagem(TelaPagPix , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0,  TelaPagPix)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem(TelaPagPix)
		     pare 
		     caso 11:
              TelaPagPixConc =  g.redimensionar_imagem(TelaPagPixConc , LarguraT, AlturaT, verdadeiro )
               g.desenhar_imagem(0, 0,  TelaPagPixConc)
               g.desenhar_texto(x, y, texto+"_")
               g.liberar_imagem( TelaPagPixConc)
		     pare 
			}
			g.renderizar()
		
	}
	*/
	funcao inteiro Tela(inteiro Base, inteiro posiTam, inteiro tela){
		retorne ((tela*posiTam)/Base)
	}
     funcao vazio Escrever (cadeia &texto, logico &saida)
     {
		inteiro tam = txt.numero_caracteres(texto)
          inteiro tecla = tec.ler_tecla() // função para pegar o código da tecla pressionada.

		g.definir_cor(g.COR_AZUL) // cor da letra da variavel ( texto )
          g.definir_tamanho_texto(20.0) // ( texto)
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

		g.definir_cor(g.COR_AZUL) // cor da letra da variavel ( texto )
          g.definir_tamanho_texto(20.0) // ( texto)
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
 * @POSICAO-CURSOR = 11071; 
 * @DOBRAMENTO-CODIGO = [243, 256, 336];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */