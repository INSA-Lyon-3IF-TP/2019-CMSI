function [ X ] = jacobi( A, B )

S = size(A);
nbLignes = S(1,1);
nbColonnes = S(1,2);


X = zeros(nbLignes,1); %matrice quelconque de départ au rang m
NEW = zeros(nbLignes,1); %nouvelle matrice X au range m+1
nbIterations=0;
while max(abs(A*X - B)) > power(10,-4)
    for i = 1:nbLignes
        x = zeros(nbLignes,1);
        for j = 1:nbColonnes
            if j == i 
                continue;
            end
            x(j) = A(i,j) * X(j);
        end
        NEW(i) = (B(i) - sum(x)) / A(i,i);
    end
    nbIterations=nbIterations+1;
    X = NEW;
end
disp(nbIterations);
end