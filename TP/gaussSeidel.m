function [ X ] = gaussSeidel( A, B )

S = size(A);
nbLignes = S(1,1);
nbColonnes = S(1,2);

X = zeros(nbLignes,1);
NEW = zeros(nbLignes,1);
nbIterations=0;
while max(abs(A*X - B)) > power(10,-4)
    for i = 1:nbLignes
        xa = zeros(nbLignes,1);
        xb = zeros(nbLignes,1);
        for j = 1:(i-1)
            xa(j) = A(i,j) * X(j);
        end
        for j = (i+1):nbColonnes
            xb(j) = A(i,j) * X(j);
        end
        NEW(i) = (B(i) - sum(xa) - sum(xb)) / A(i,i);
    end
    nbIterations=nbIterations+1;
    X = NEW;
end

disp(nbIterations);
end