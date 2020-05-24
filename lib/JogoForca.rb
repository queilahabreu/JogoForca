require_relative 'SortearPalavra.rb'

class JogoForca
	attr_reader :nome
	

	def initialize
		#abertura do jogo
		abertura
		#Palavra sorteada obs: chomp é p/ não pegar a quebra de linha
		@nome = SortearPalavra.sortear.chomp
		
		
	end

	def abertura
		#limpar terminal
		system('clear')
		#mostra a "capa" do jogo
		File.open('desenho/desenho_inicializacao.txt', 'r') do |arq|
			while line = arq.gets
				puts line
			end
		end
		#depois de 3 segundos limpa tudo no terminal
		sleep(3)
		system('clear')

		


	end

	def adivinhar

		
		#mostra a quantidade de letras p usuário
		x = 0
		while(x < nome.length)
			print "_ "

			x = x + 1
		end
		puts ""


		#variavel que vai receber a resposta final do usuário
		resposta = "".chomp
		
		
		#variavel que faz a contagem do boneco na forca
		boneco = 0

		#11 pq serão 11 tentativas		
		x = 0
		while(x < 11)
			
			
			if(boneco == 0)
				
				File.open('desenho/inicio.txt', 'r') do |arq|
					while line = arq.gets
						puts line
					end
				end
			end
			
			puts "Tente adivinhar uma comida baiana "
			puts "Insira uma letra: "

			#letra recebida pela usuária
			letra = gets.chomp
			puts ""
			

			#Comparando se tem a letra que a usuária digitou na palavra sorteada, nome = letra sorteada
			i = 0
			while(i < nome.length)

				#serve para sempre deixar atualizado a última resposta que apareceu na forca
				if(resposta[i] == nome[i])
					i = i + 1
					
				#se a letra da posição ainda não é a mesma colocar a letra agora correta em resposta				
				else
				if (letra == nome[i])
							
					resposta[i] = letra 
					#cont = caso cont seja 1 é pq a usuária acertou uma nova letra
					cont = 1
					i = i + 1
					
				else
					#caso a usuária não acertou a letra vai continuar como "_"
					resposta[i] = "_".chomp
					i = i + 1
				end				
				end
			end
			

			#apagando no terminal para aparecer o mais atualizado
			system('clear')
			puts ""
			
			#imprimindo a resposta mais atual da palavra
			y = 0
			while(y <resposta.length)
				print resposta[y]
				y = y + 1
			end 

			puts ""


			if(cont == 1)

			else
				#quando a usuária não acertar a palavra nova parte do boneco(desenho) vai ser formada
				boneco = boneco + 1
			end
			#zerando pois depois vai ter um novo teste	
			cont = 0


			puts ""

			#desenho da forca
			q = 1
			while(q <= 6)
				if(boneco == q)
					File.open("desenho/tentativa#{q}.txt", 'r') do |arq|
						while line = arq.gets
							puts line
						end
					end
				end
				q = q + 1
				if(boneco == 6)
					x = 21	
				end 
			end	 	 

			#quando a usuária acerta a palavra
			if(resposta == nome)
				system("clear")
				File.open("desenho/parabens.txt",'r') do |arq|
					while line = arq.gets
						puts line
					end
				end
				puts resposta
				File.open("desenho/parabens2.txt",'r') do |arq|
					while line = arq.gets
						puts line
					end
				end#coloca um arquivo aqui
				#puts "Parabéns"
				x = 21
			end

			x = x + 1

		end	
	end
end

