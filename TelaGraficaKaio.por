programa
{
	//Bibliotecas
	inclua biblioteca Util --> u
     inclua biblioteca Graficos --> g
     inclua biblioteca Mouse --> m
     inclua biblioteca Calendario --> c
     inclua biblioteca Teclado --> tc
     inclua biblioteca Texto --> tx

	const inteiro LARGURAT= 1920
     const inteiro ALTURAT = 1080
     const cadeia senha = "admin"

	inteiro tela_menu_bg = g.carregar_imagem("D:/Projetos/curso-senai/SistemaPadariaTurma237/midia/imagens/Telas/Menu/telaMenu.png")
	inteiro tela_verificar_adm_bg = g.carregar_imagem("D:/Projetos/curso-senai/SistemaPadariaTurma237/midia/imagens/Telas/Cadastrar/Tela_senha.png")
	inteiro tela_acesso_negado_bg = g.carregar_imagem("D:/Projetos/curso-senai/SistemaPadariaTurma237/midia/imagens/Telas/Cadastrar/Acesso_negado.png")
	
	funcao inicio()
	{
		interacaoDeLogin()
	}

	funcao logico posicaoMouse(inteiro x1, inteiro y1, inteiro x2, inteiro y2){
		se (m.posicao_x() >= x1 e m.posicao_y() >= y1 e m.posicao_x() <= x1 + x2 e m.posicao_y() <= y1 + y2) {
               retorne verdadeiro
          }
		retorne falso
	}

	funcao vazio interacaoDeLogin () {
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURAT, ALTURAT)
		g.definir_titulo_janela("Padaria Pão Quente")
		g.renderizar()
		u.aguarde(1000)
		g.definir_cor(g.COR_BRANCO)
		

		enquanto(verdadeiro) {
			g.limpar()
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_imagem(0, 0, g.redimensionar_imagem(tela_menu_bg, LARGURAT, ALTURAT,verdadeiro))
			g.liberar_imagem(g.redimensionar_imagem(tela_menu_bg, LARGURAT, ALTURAT,verdadeiro))
			g.desenhar_retangulo(745, 330, 305, 85, verdadeiro, falso)
			g.desenhar_retangulo(745, 480, 305, 84, verdadeiro, falso)
			g.desenhar_retangulo(745, 620, 305, 85, verdadeiro, falso)
			g.desenhar_retangulo(745, 765, 305, 85, verdadeiro, falso)

			inteiro verificador_de_acesso = 0
			inteiro ler_mouse = m.ler_botao()
			cadeia texto = ""
			inteiro tam  = 0
       	  	inteiro tecla = 0
     		inteiro TelaVA = 0
     		inteiro click = 0

     		se(posicaoMouse(745, 330, 305, 85) == verdadeiro e ler_mouse == m.BOTAO_ESQUERDO){
				g.limpar()
				g.definir_cor(g.COR_BRANCO)
     			cadastro_de_produtos(verificador_de_acesso)
     		}senao se(posicaoMouse(745, 480, 305, 84) == verdadeiro e ler_mouse == m.BOTAO_ESQUERDO){
				
				g.definir_cor(g.COR_VERDE)
				g.desenhar_retangulo(745, 480, 305, 84, verdadeiro, falso)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LARGURAT/4, ALTURAT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	g.desenhar_texto(LARGURAT/4, ALTURAT / 1.15, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     
               }

               //Função para Relatório 
            	senao se(posicaoMouse(745, 620, 305, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.desenhar_retangulo(LARGURAT/2.5, 550, 350, 35, verdadeiro, falso)
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LARGURAT/4, ALTURAT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	g.desenhar_texto(LARGURAT/4, ALTURAT / 1.15, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	
			
               }

               //Função para Fechar caixa
            	senao se(posicaoMouse(745, 765, 305, 85) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.desenhar_retangulo(LARGURAT/2.5, 550, 350, 35, verdadeiro, falso)
				g.definir_cor(g.COR_VERDE)
		     	g.definir_tamanho_texto(20.0)
		          g.desenhar_texto(LARGURAT/4, ALTURAT / 1.22,"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	g.desenhar_texto(LARGURAT/4, ALTURAT / 1.15, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		     	
			
               }
               g.renderizar()
			
		}
	}

	  funcao vazio f_verificar_acesso (cadeia senha){
		cadeia valorSenha
		inteiro contador=0
		escreva("Verificação de Acesso\n\nDigite a senha para continuar:\n->")
		leia(valorSenha)
		limpa()
		se(valorSenha=="x" ou valorSenha=="X"){
			inicio()
		}
		enquanto(valorSenha!=senha){
			contador++
			se(contador==5){
				para(inteiro i=30;i>0;i--){
					limpa()
					escreva("Você errou demais, aguarde ",i," segundos para tentar novamente...")
					u.aguarde(1000)
				}
				limpa()
			}
			escreva("Senha incorreta!Tente novamente:\n->")
			leia(valorSenha)
			limpa()
			se(valorSenha=="x" ou valorSenha=="X"){
				inicio()
			}
		}
	}	

	funcao vazio cadastro_de_produtos(inteiro verificador_de_acesso){
		cadeia texto = "" 
		g.desenhar_imagem(0, 0, g.redimensionar_imagem(tela_verificar_adm_bg, LARGURAT, ALTURAT,verdadeiro))
		g.renderizar()
		g.definir_cor(g.COR_PRETO)
		texto = f_escrever_texto()
		f_verificar_acesso(texto)
	}

	funcao cadeia f_escrever_texto(){
		cadeia texto_digitado = ""
		logico saida = verdadeiro
		enquanto(saida){
			inteiro tamanho_texto = tx.numero_caracteres(texto_digitado)
			inteiro tecla_digitada = tc.ler_tecla()
			
			se(tecla_digitada >= tc.TECLA_A e tecla_digitada <= tc.TECLA_Z ou tecla_digitada == tc.TECLA_ESPACO){
				texto_digitado += tc.caracter_tecla(tecla_digitada)
			}senao se(tecla_digitada == tc.TECLA_BACKSPACE e tamanho_texto >= 1){
					texto_digitado = tx.extrair_subtexto(texto_digitado, 0, tamanho_texto-1)
			}
			se(tecla_digitada == tc.TECLA_ENTER){
				saida = falso
			}
			g.liberar_imagem(tela_menu_bg)
			g.desenhar_imagem(0, 0, g.redimensionar_imagem(tela_verificar_adm_bg, LARGURAT, ALTURAT,verdadeiro))
			g.desenhar_texto(680, 850, texto_digitado+"|")
			g.renderizar()
		}
		retorne texto_digitado
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4423; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */