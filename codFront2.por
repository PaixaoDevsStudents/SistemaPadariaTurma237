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
	inteiro ImgMenu = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Menu.png")
	//Login e Senha
	inteiro ImgAcesso = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/VerificarAcesso.png")
	inteiro ImgAcessoNegado = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/AcessoNegado.png")
	//cadastro
	inteiro ImgNome = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Nome.png")
	inteiro ImgCusto = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Custo.png")
	inteiro ImgPesoUnitario = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/PesoUnitario.png")
	inteiro ImgPeso = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Peso.png")
	inteiro ImgUnitario = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Unitario.png")
	inteiro ImgQuantidade = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/Quantidade.png")
	inteiro ImgCadastroSucesso = grf.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/CadastradoSucesso.png")

     
     //RealizarVendas
     inteiro TelaCodigo = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaQuantidade = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaQuantErrada = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaValor = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaTroco = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaFormaPag = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaPagCart = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaOpcCart = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaPagCartConc = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaPagPix = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")
     inteiro TelaPagPixConc = g.carregar_imagem("./midia/imagens/Sistema Padaria 2.0/")

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
          	
               
               inteiro telaMenu = g.redimensionar_imagem(ImgMenu, LarguraT, AlturaT, verdadeiro) // variavel que recebe a foto da variavel (telaMenu) e redimensiona para cobrir toda a janela.
               g.desenhar_imagem(0,0, telaMenu)
               g.liberar_imagem(telaMenu)  // libera o cache dessa imagem da memoria RAM 
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
     funcao vazio Apresenta_Registro(inteiro id, inteiro x, inteiro y,cadeia &texto)// função para aparecer a outra tela 
     {
     	se(id == 0){
     		inteiro telaAcesso = g.redimensionar_imagem(ImgAcesso, LarguraT, AlturaT, verdadeiro)
	     	g.desenhar_imagem(0, 0, telaAcesso)
	     	g.desenhar_texto(x, y, texto+"_")
	     	g.liberar_imagem(telaAcesso)
     	}
     	senao se(id == 1){
     		inteiro telaAcessoNegado = g.redimensionar_imagem(ImgAcessoNegado, LarguraT, AlturaT, verdadeiro)
     		g.desenhar_imagem(0, 0, telaAcessoNegado)
     		g.desenhar_texto(x, y, texto+"_")
     		g.liberar_imagem(telaAcessoNegado)
     	} 
     	g.renderizar()
     }
	funcao Apresentar_Cadastro(inteiro id, inteiro x, inteiro y,cadeia &texto){
		escolha(id){
			caso 0:
				inteiro telaNome = g.redimensionar_imagem(ImgNome, LarguraT, AlturaT, verdadeiro)
				g.desenhar_imagem(0, 0, telaNome)
				g.desenhar_texto(x, y, texto+"_")
			     g.liberar_imagem(telaNome)
				pare
			caso 1:
				inteiro telaQuantidade = g.redimensionar_imagem(ImgQuantidade, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaQuantidade)
			     g.desenhar_texto(x, y, texto+"_")
			     g.liberar_imagem(telaQuantidade)
		     	pare
		     caso 2:
		     	inteiro telaPesoUnitario = g.redimensionar_imagem(ImgPesoUnitario, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaPesoUnitario)
			     g.liberar_imagem(telaPesoUnitario)
		     	pare
		     caso 3:
		     	inteiro telaPeso = g.redimensionar_imagem(ImgPeso, LarguraT, AlturaT, verdadeiro)
		     	g.desenhar_imagem(0, 0, telaPeso)
		     	g.desenhar_texto(x, y, texto+"_")
		     	g.liberar_imagem(telaPeso)
		     	pare
		     caso 4:
		     	inteiro telaUnitario = g.redimensionar_imagem(ImgUnitario, LarguraT, AlturaT, verdadeiro)
		     	g.desenhar_imagem(0, 0, telaUnitario)
		     	g.desenhar_texto(x, y, texto+"_")
		     	g.liberar_imagem(telaUnitario)
		     	pare
		     caso 5:
		     	inteiro telaCusto = g.redimensionar_imagem(ImgCusto, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaCusto)
			     g.desenhar_texto(x, y, texto+"_")
			     g.liberar_imagem(telaCusto)
		     	pare
		      caso 6:
		     	inteiro telaCadastroSucesso = g.redimensionar_imagem(ImgCadastroSucesso, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaCadastroSucesso)
			     g.liberar_imagem(telaCadastroSucesso)
		     	pare
		}
		
		g.renderizar()
	}
	
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
 * @POSICAO-CURSOR = 5703; 
 * @DOBRAMENTO-CODIGO = [111, 164, 259, 275, 322, 325, 347];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */