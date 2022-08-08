function [resultadoPicos, resultadoVales] = picosvales(vetor, tamanho)
	picos = [];
	vales = [];
	indiceVale = 1;
	indicePico = 1;
	maximo = tamanho;

	for i=1:maximo
		if (i==1)

			if(vetor(i)>vetor(i+1))
				picos(indicePico)=vetor(1);
				indicePico = indicePico+1;
				n = "aqui 1==1   ->  vetor(i)>vetor(i+1)"
				picos
			endif

			if(vetor(i)<vetor(i+1))
				vales(indiceVale)=vetor(i);
				indiceVale = indiceVale+1;
				n = "aqui 1==1   ->> vetor(i)<vetor(i+1)"
				vales
			endif
		endif



		if(i!=1)
			if(i==maximo)
					if(vetor(i)<vetor(i-1))
						vales(indiceVale) = vetor(i);
						indiceVale = indiceVale+1;
						n = "aqui i!=1   ->  i==maximo   ->  vetor(i)<vetor(i-1)"
						vales
					endif
					if(vetor(i)>vetor(i-1))
						picos(indicePico) = vetor(i);
						indicePico = indicePico+1;
						n = "aqui i!=1   ->  i==maximo   ->  vetor(i)>vetor(i-1)"
						picos
					endif
			endif


			if(i<maximo)
				if (vetor(i)<vetor(i+1))
					if(vetor(i)<vetor(i-1))
						n = "aqui i!=1  ->  i<maximo  ->  vetor(i)<vetor(i-1)"
						vales(indiceVale) = vetor(i);
						indiceVale = indiceVale+1;
						vales
					endif
				endif

				if(vetor(i) >vetor(i+1))
					if(vetor(i)>vetor(i-1))
						n = "aqui i!=1  ->  i<maximo  ->  vetor(i)>vetor(i-1)"
						picos(indicePico) = vetor(i);
						indicePico = indicePico+1;
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


