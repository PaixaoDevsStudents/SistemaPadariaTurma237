programa
{
	
	//Bibliotecas
     inclua biblioteca Graficos --> g
     inclua biblioteca Mouse --> m
     inclua biblioteca Calendario --> C
     inclua biblioteca Teclado --> tec
     inclua biblioteca Texto --> txt
     inclua biblioteca Tipos --> typ
//------------------------------------------------------------------

     //Altura e Largura da janela de exibição
     inteiro LarguraT = g.largura_tela()
     inteiro AlturaT = g.altura_tela()

//--------------------------------------------------------------------
 
 /*TELAS*/
 
	//Menu     
     inteiro TelaMenu = g.carregar_imagem("C:/Users/AM VM/Documents/imagens/Telas/Menu/telaMenu.png")
     //CadastrarProduto
     inteiro TelaVerificaAdm = g.carregar_imagem("C:/Users/AM VM/Documents/imagens/Telas/Cadastrar/Tela_senha.png")
     inteiro TelaAdmNegado = g.carregar_imagem("C:/Users/AM VM/Documents/imagens/Telas/Cadastrar/Acesso_negado.png")
    	inteiro TelaCusto = g.carregar_imagem("C:/Users/AM VM/Documents/imagens/Telas/Cadastrar/Custo.png")
	inteiro TelaPreco = g.carregar_imagem("C:/Users/AM VM/Documents/imagens/Telas/Cadastrar/Preço.png")
     inteiro TelaQuantidade = g.carregar_imagem("C:/Users/AM VM/Documents/imagens/Telas/Cadastrar/Quantidade.png")
     //RealizarVendas
     /*inteiro TelaCodigo = g.carregar_imagem()
     inteiro TelaQuantidade = g.carregar_imagem()
     inteiro TelaQuantErrada = g.carregar_imagem()
     inteiro TelaValor = g.carregar_imagem()
     inteiro TelaTroco = g.carregar_imagem()
     inteiro TelaFormaPag = g.carregar_imagem()
     inteiro TelaPagCart = g.carregar_imagem()
     inteiro TelaOpcCart = g.carregar_imagem()
     inteiro TelaPagCartConc = g.carregar_imagem()
     inteiro TelaPagPix = g.carregar_imagem()
     inteiro TelaPagPixConc = g.carregar_imagem()

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
          	
               
               inteiro TelaMenu2 = g.redimensionar_imagem(TelaMenu, LarguraT, AlturaT, verdadeiro) // variavel que recebe a foto da variavel (telaMenu) e redimensiona para cobrir toda a janela.
               
               g.desenhar_imagem(0,0, TelaMenu2)
               g.liberar_imagem(TelaMenu2)  // libera o cache dessa imagem da memoria RAM 
			g.renderizar()
			//Função para Cadastrar Produtos

			inteiro VerificaAdm = 0
			inteiro mou = m.ler_botao() 
			inteiro botao = 0 , Quantidade
			cadeia senha = "ADMIN"
			cadeia texto = ""
			real Preco, Custo
			
			
       	  	
       	  	
			////////////////////////////
			
           	se(mouse(Tela(1920,735,LarguraT), Tela(1080,330,AlturaT), Tela(1920,325,LarguraT), Tela(1080,85,AlturaT)) e mou == m.BOTAO_ESQUERDO){
           		botao = 1
               }
               se(botao == 1){
               	logico saida = verdadeiro
               	enquanto(saida){
               		Apresenta_Registro(0, Tela(1920, 684, LarguraT),Tela(1080, 850, AlturaT),texto)
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
               		Apresentar_Cadastro(2,Tela(1920, 684, LarguraT),Tela(1080, 850, AlturaT),texto)
               		Escrever_Num(0,texto, saida)
               		se(typ.cadeia_e_inteiro(texto, 10)){
               			Quantidade = typ.cadeia_para_inteiro(texto,10)
               		}senao{
               			saida = verdadeiro
               		}
               	}
               	texto = ""
               	saida = verdadeiro
               	enquanto(saida){
               		Apresentar_Cadastro(0,Tela(1920, 684, LarguraT),Tela(1080, 850, AlturaT),texto)
               		Escrever_Num(1,texto, saida)
               		se(typ.cadeia_e_real(texto)){
               			Preco = typ.cadeia_para_real(texto)
               		}
               		senao{
               			saida = verdadeiro
               		}
               	}
               	texto = ""
               	saida = verdadeiro
               	enquanto(saida){
               		Apresentar_Cadastro(1,Tela(1920, 684, LarguraT),Tela(1080, 850, AlturaT),texto)
               		Escrever_Num(1,texto, saida)
               		se(typ.cadeia_e_real(texto)){
               			Custo = typ.cadeia_para_real(texto)
               		}
               		senao{
               			saida = verdadeiro
               		}
               	}
               }
               //Função para Realizar Vendas
           	se(mouse(735, 475, 325, 85) == verdadeiro e m.ler_botao() == 1){
           		
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LarguraT/4, AlturaT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	
		     
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
		     	
			
               }
          }
          g.encerrar_modo_grafico()
     }

     funcao vazio Apresenta_Registro(inteiro id, inteiro x, inteiro y,cadeia &texto)// função para aparecer a outra tela 
     {
     	se(id == 0){
	     	inteiro TelaAdm = g.redimensionar_imagem(TelaVerificaAdm, LarguraT, AlturaT, verdadeiro)
	     	g.desenhar_imagem(0, 0, TelaAdm)
	     	g.desenhar_texto(x, y, texto)
	     	g.liberar_imagem(TelaAdm)
     	}
     	senao se(id == 1){
     		inteiro telaAcessoNegado = g.redimensionar_imagem(TelaAdmNegado, LarguraT, AlturaT, verdadeiro)
     		g.desenhar_imagem(0, 0, telaAcessoNegado)
     		g.desenhar_texto(x, y, texto)
     		g.liberar_imagem(telaAcessoNegado)
     	} 
     	g.renderizar()
     }
	funcao Apresentar_Cadastro(inteiro id, inteiro x, inteiro y,cadeia &texto){
		escolha(id){
			caso 0:
				inteiro telaCustoR = g.redimensionar_imagem(TelaCusto, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaCustoR)
			     g.liberar_imagem(telaCustoR)
		     	pare
		     caso 1:
		     	inteiro telaPrecoR = g.redimensionar_imagem(TelaPreco, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaPrecoR)
			     g.liberar_imagem(telaPrecoR)
		     	pare
		     caso 2:
		     	inteiro telaQuantidade = g.redimensionar_imagem(TelaQuantidade, LarguraT, AlturaT, verdadeiro)
			     g.desenhar_imagem(0, 0, telaQuantidade)
			     g.liberar_imagem(telaQuantidade)
		     	pare
		}
		g.desenhar_texto(x, y, texto)
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
 * @POSICAO-CURSOR = 3896; 
 * @DOBRAMENTO-CODIGO = [230];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {texto, 191, 78, 5}-{x, 191, 57, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */