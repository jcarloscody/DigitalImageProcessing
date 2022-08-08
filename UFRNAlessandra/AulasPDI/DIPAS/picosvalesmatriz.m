function [resultadoPicos, resultadoVales] = picosvalesmatriz(vetor, tamanho)
	picos = [];
	vales = [];
	indiceValeLinha = 1;
	indiceValeColuna = 1;
	indicePicoLinha = 1;
	indicePicoColuna = 1;
	maximo = tamanho;

	for i=1:maximo
		if (i==1)

			if(vetor(i)>vetor(i+1))
				picos(indicePicoLinha, indicePicoColuna)=  i;
				picos(indicePicoLinha+1, indicePicoColuna)=vetor(i);
				indicePicoLinha = indicePicoColuna = indicePicoColuna+1;
				n = "aqui 1==1   ->  vetor(i)>vetor(i+1)"
				picos
			endif

			if(vetor(i)<vetor(i+1))
				vales(indiceValeLinha, indiceValeColuna)=  i;
				vales(indiceValeLinha+1, indiceValeColuna)=vetor(i);
				indiceValeLinha = indiceValeColuna = indiceValeColuna+1;
				n = "aqui 1==1   ->> vetor(i)<vetor(i+1)"
				vales
			endif
		endif



		if(i!=1)
			if(i==maximo)
					if(vetor(i)<vetor(i-1))
						vales(indiceValeLinha, indiceValeColuna)=  i;
						vales(indiceValeLinha+1, indiceValeColuna)=vetor(i);
						indiceValeLinha = indiceValeColuna = indiceValeColuna+1;
						n = "aqui i!=1   ->  i==maximo   ->  vetor(i)<vetor(i-1)"
						vales
					endif
					if(vetor(i)>vetor(i-1))
						picos(indicePicoLinha, indicePicoColuna)=  i;
						picos(indicePicoLinha+1, indicePicoColuna)=vetor(i);
						indicePicoLinha = indicePicoColuna = indicePicoColuna+1;
						n = "aqui i!=1   ->  i==maximo   ->  vetor(i)>vetor(i-1)"
						picos
					endif
			endif


			if(i<maximo)
				if (vetor(i)<vetor(i+1))
					if(vetor(i)<vetor(i-1))
						vales(indiceValeLinha, indiceValeColuna)=  i;
						vales(indiceValeLinha+1, indiceValeColuna)=vetor(i);
						indiceValeLinha = indiceValeColuna = indiceValeColuna+1;
						n = "aqui i!=1  ->  i<maximo  ->  vetor(i)<vetor(i-1)"
						vales
					endif
				endif

				if(vetor(i) >vetor(i+1))
					if(vetor(i)>vetor(i-1))
						picos(indicePicoLinha, indicePicoColuna)=  i;
						picos(indicePicoLinha+1, indicePicoColuna)=vetor(i);
						indicePicoLinha = indicePicoColuna = indicePicoColuna+1;
						n = "aqui i!=1  ->  i<maximo  ->  vetor(i)>vetor(i-1)"
						picos
					endif
				endif
			endif
		endif

endfor

resultadoPicos = picos;
resultadoVales = vales;
resultadoPicos
resultadoVales

endfunction
