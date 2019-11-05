function [ X ] = application()

A = zeros(500);
B = zeros(500,1);

%%Initialisation des bords � 100�C
i = 1;
%Ligne du haut et du bas
while i < 500
    A(i , i) = 1;
    B(i) = 100;
    i = i + 19;
    A(i , i) = 1;
    B(i) = 100;
    i = i + 1;
end
%Deux lignes au milieu � gauche
i = 10;
while i < 260
    A(i , i) = 1;
    B(i) = 100;
    i = i + 1;
    A(i , i) = 1;
    B(i) = 100;
    i = i + 19;
end
% C�t� en haut � droite
i = 481;
while i <= 492
    A(i , i) = 1;
    B(i) = 100;
    i = i + 1;
end
% Fin initialisation des 100�C

%% Initialisation des points � 500�C
A(405, 405) = 1; %I
B(405) = 500;
A(406, 406) = 1; %K
B(406) = 500;
A(425, 425) = 1; %J
B(425) = 500;
A(426, 426) = 1; %L
B(426) = 500;

A(195, 195) = 1; %M
B(195) = 500;
A(196, 196) = 1; %O
B(196) = 500;
A(215, 215) = 1; %N
B(215) = 500;
A(216, 216) = 1; %P
B(216) = 500;
% Fin initialisation des points � 500�C

%% Initialisation des points qui ont 5 voisins
i = 362;
while i <= 370
   A(i,i) = -5;
   A(i,i+1) = 1;
   A(i,i-1) = 1;
   A(i,i-20) = 1;
   A(i,i+20) = 1;
   A(i, i-360) = 1;
   i = i + 1;
end
% Fin initialisation des points qui ont 5 voisins

%% Initialisation des points sp�ciaux (c�t�s qui referment)
i = 2;
while i < 10
   A(i,i) = -4;
   A(i,i+1) = 1;
   A(i,i-1) = 1;
   A(i,i+360) = 1;
   A(i,i+20) = 1;
   i = i + 1;
end
i = 12;
while i < 20
   A(i,i) = -4;
   A(i,i+1) = 1;
   A(i,i-1) = 1;
   A(i,i+480) = 1;
   A(i,i+20) = 1;
   i = i + 1; 
end
i = 492;
while i < 500
   A(i,i) = -4;
   A(i,i+1) = 1;
   A(i,i-1) = 1;
   A(i,i-480) = 1;
   A(i,i-20) = 1;
   i = i + 1; 
end
% Fin initialisation des points sp�ciaux

%% Initialisation des points normaux
j = 20;
while j < 480
    i = 2;
    while i < 20
        if(and(j < 260, or(i==10, i==11)))
            i = i + 1;
            continue
        end
        if(and(j == 360, i <= 10))
            i = i + 1;
            continue
        end
        if(and(or(j == 180, j == 200), or(i == 15, i == 16)))
            i = i + 1;
            continue
        end
        if(and(or(j == 400, j == 420), or(i == 5, i == 6)))
            i = i + 1;
            continue
        end
        A(i+j,i+j) = -4;
        A(i+j,i+j+1) = 1;
        A(i+j,i+j-1) = 1;
        A(i+j,i+j+20) = 1;
        A(i+j,i+j-20) = 1;
        i = i + 1;
    end
    j = j + 20;
end
% Fin initialisation des points normaux

X = relaxation(A,B);

figure(1);
surf(vectToMatrix(X));

end

