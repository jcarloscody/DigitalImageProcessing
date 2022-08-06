# Digital Image Processing

### Principais áreas de atuação
- Processmaento de dados de imagens para armazenamento, transmissão 

- PDI: o processamento digital de imagens envolve processos cujas entradas e saídas sao imagens e além disso, envolve processos de extração de atributos de imagens (dados) e o reconhecimento de objetos individuais

<br/>


- Distância: a promiximidade das intensidades dos pixels.
  - preto: 0
  - branco: 255

- Imagem:
  - função bidimensional f(x,y)(i,j)(linha, coluna)
    - f: é a amplitude em qq par de coordenas e é chamda de intensidade ou nível de cinza
  - img digital: quando f, x, y são quantidades finitas e discretas
  - pixel: elementos que compõe a imagem, é uma intensidade, é o valor matricial, 3x3 = 9 pixels.
    - O valor do pixel de uma imagem recebe um nome de intensidade o preto tem intensidade 0 o branco propriamente dito tem intensidade 255


### Adaptação ao brilho e discriminação 
- Efeito de Banda Mach: embora o nível de cinza das linhas seja constante, percebe-se um padrão de brilho fortemente alterado perto das bordas.


Resolução de intensidade: quantidade de bits que vc tem para armazenar cada intensidade

### Saturação e ruído
- é o valor mais alto além do qual todos os níveis de intensidades são cortados. saturar significa encher inteiramente, saciar-se.
- ruído: aparece como uma granulação na textura. 


### Resolução Espacial e Intensidade
- **Resolução espacial:** é a medida do menor detalhe discernível em uma imagem (pontos por polegada - pdi).  a quantidade de quadradinhos que a imagem tem, 
  - o tamanho por si só não diz tudo.
- **resolução de intensidade:** é a menor variação discernível de nível de intensidade em uma imagem(8 bits níveis de cinza, 16 bits, 32 bits). a quantidade de níveis de cinza que a imagem tem.


### Passos Fundamentais
- Aquisição:
  - tem objetivo de obter uma representação da informação a partir de dispositivos fisicos sensíveis que convertem o sinal elétrico para um formato digital.
- pré-processamento: consiste no realce da imagem para enfatizar características de interesse ou recuperar imagens que sofreram alguma perda.
- segmentação: consiste na extração ou identificação dos objetos contidos na imagem, separando a imagem em regiões de interesse.
- Representação e descrição: consiste na representação a partir da descrição das propriedades das regioes segmentadas (descritores) para o reconhecimento dos objetos.
- reconhecimento e interpretação: consiste na atribuição de um rótulo (classe) a um objeto ou região baseada nas informações fornecidas pelo seu conjunto de descritores.
- Base de conhecimento: agrega ao modelo um conjunto especializado de conhecimentos a respeito do domínio do problema. 

<br/>
<br/>

<img src="https://raw.githubusercontent.com/jcarloscody/DigitalImageProcessing/main/images/modelorgb.jpg" alt="Nature">

<br/>

<img src="https://raw.githubusercontent.com/jcarloscody/DigitalImageProcessing/main/images/modelorgb.jpg" alt="Nature">

## IMAGENS COLORIDAS
  - Consistem em 3 imagens sobrepostas. possuem 3 canais: RGB - red, green, blue.
  - Intensidade - Luz acromática: imagem de 1 canal aprensenta apenas uma intensidade de cinza.
  - Intensidade - Luz cromática: manipulação de 3 canais, 3 variaçoes de intnesidade de cinzas 
  - o olho humano distingui pouco mais de 30 níveis de cinza e não as 255, e as cores distinguimos pouco mais de 1000.
  - Pseudocores: atribuição de cores a imagens monocromáticas(imagens captadas em apenas uma variacao de cinza e dentro de um intervalo de intensidade de cinza atribuimos uma cor)
  - Brilho: intensidade de luz, variacao do 0-255
  - Tom - tonalidade ou matiz, é a cor pura, relativo ao comprimento de onda da luz.
  - Saturação ou pureza: refere-se à quantidade em que a cor pura é diluída na luz branca.
  - Cromaticidade: matiz + saturação