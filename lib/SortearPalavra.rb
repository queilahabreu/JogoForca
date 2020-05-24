

class SortearPalavra

	#com o self não precisa criar um objeto p chamar no outro arquivo
	def self.sortear
		
		#Criando um vetor que vai pegar todas as palavras
		v = []


		#abrindo arquivo
		File.open('lib/palavras.txt', 'r') do |arq|
			#pegando a palavra em cada linha e guardando no vetor
			while line = arq.gets
				v.push(line.to_s)
			end
		end
		#escolhendo uma palavra do vetor
		sorte = v.sample
		

		#agora tem que pegar cada palavra e formar um vetor 
		#puts sorte

		#obs: ta pegando um tamanho a mais, ta egando a quebra de linhar
		#puts sorte.length

	end

end