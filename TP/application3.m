function [  ] = application3()

A = zeros(500);

i = 21;
%Ligne du haut et du bas sauf cas particuliers (coins et plis)
while i < 481
    if(i ~= 361)
        A(i,i) = -3;
        A(i,i+1) = 1;
        A(i,i+20) = 1;
        A(i,i-20) = 1;
    end
    i = i + 19;
    A(i,i) = -3;
    A(i,i-1) = 1;
    A(i,i+20) = 1;
    A(i,i-20) = 1;
    i = i + 1;
end
%Deux lignes au milieu à gauche
i = 30;
while i < 260
    A(i,i) = -3;
    A(i,i-1) = 1;
    A(i,i+20) = 1;
    A(i,i-20) = 1;
    i = i + 1;
    A(i,i) = -3;
    A(i,i+1) = 1;
    A(i,i+20) = 1;
    A(i,i-20) = 1;
    i = i + 19;
end
% Côté en haut à droite
i = 482;
while i <= 492
    A(i,i) = -3;
    A(i,i+1) = 1;
    A(i,i-1) = 1;
    A(i,i-20) = 1;
    i = i + 1;
end
% Cas particuliers en gras
A(1,1) = -3;
A(1,2) = 1;
A(1, 21) = 1;
A(1, 361) = 1;

A(10,10) = -3;
A(10,9) = 1;
A(10, 30) = 1;
A(10, 370) = 1;

A(11,11) = -3;
A(11,12) = 1;
A(11, 31) = 1;
A(11, 491) = 1;

A(20,20) = -3;
A(20,19) = 1;
A(20, 40) = 1;
A(20, 500) = 1;

A(361,361) = -4;
A(361,341) = 1;
A(361, 381) = 1;
A(361, 362) = 1;
A(361, 1) = 1;

A(481,481) = -2;
A(481,461) = 1;
A(481, 482) = 1;

A(500,500) = -3;
A(500, 499) = 1;
A(500, 480) = 1;
A(500, 20) = 1;

%% Initialisation des points à 500°C
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
% Fin initialisation des points à 500°C

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

%% Initialisation des points spéciaux (côtés qui referment)
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
% Fin initialisation des points spéciaux

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
%         if(and(or(j == 180, j == 200), or(i == 15, i == 16)))
%             i = i + 1;
%             continue
%         end
%         if(and(or(j == 400, j == 420), or(i == 5, i == 6)))
%             i = i + 1;
%             continue
%         end
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

deltaT = 0.5;
Uzero = zeros(500,1);
Uzero(405) = 500;
Uzero(406) = 500;
Uzero(425) = 500;
Uzero(426) = 500;
Uzero(195) = 500;
Uzero(196) = 500;
Uzero(215) = 500;
Uzero(216) = 500;

cte = expm(A*deltaT);
U = Uzero;
prevU = zeros(500,1);
i = 0;

%x = 1:0.038:20;
%y = 1:0.048:25;
%[X,Y]=meshgrid(x,y);

figure
%F(1429) = struct('cdata',[],'colormap',[]);
while max(abs(U - prevU)) > power(10,-2)
    prevU = U;
    U = cte * U;
    U(405) = 500;
    U(406) = 500;
    U(425) = 500;
    U(426) = 500;
    U(195) = 500;
    U(196) = 500;
    U(215) = 500;
    U(216) = 500;
    i = i + 1;
    surf(vectToMatrix(U))
    zlim([100 500])
    caxis([100 500])
    drawnow
    %F(i) = getframe;
end
%movie(F,2);

i %1259 secondes (environ 21 minutes)

%surf(vectToMatrix(U));


end

