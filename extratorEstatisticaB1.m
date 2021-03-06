function caracteristicas = extratorEstatisticaB1(f)

    H = imhist(f);              %histograma da imagem
           
    p = H./numel(f);            %normaliza o histograma
       
    L = length(p);              %quantidade de tons de cinza
    
    z=0:255;                    %vetor com tons de cinza
    
    % para remover o fundo preto (0)
    %mn=numel(f)-H(1);
    %p = H./mn;    
    %L = length(p)-1;
    %z=1:255;   
    %p(1,:)=[];
    %H(1,:)=[];
    
    %% media
    media = z*p;
    caracteristicas(1) = media;
           
    %% desvio padrão
    desvio = z - media;
    variancia = (desvio.^2)*p;
    desviopadrao = sqrt(variancia);
    caracteristicas(2) = desviopadrao;
    
    %% suavidade (smoothness)
    suavidade = 1 - 1/(1+(variancia/(L-1)^2));
    caracteristicas(3) = suavidade;
        
    %% assimetria / skewness / terceiro momento
    assimetria = ((desvio.^3)*p)/(L-1)^2;
    caracteristicas(4) = assimetria;
    
    %% uniformidade
    uniformidade = sum(p.^2);
    caracteristicas(5) = uniformidade;
        
    %% kurtosi / quarto momento 
    kurtosi = ((desvio.^4)*p)/(L-1)^2;
    caracteristicas(6) = kurtosi;
           
    %% entropia
    entropia =-sum(p.*(log2(p+eps)));
    caracteristicas(7) = entropia;
        
    
    %%
    
    return