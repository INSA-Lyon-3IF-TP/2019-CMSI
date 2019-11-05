function [ X ] = relaxation( A, B )

S = size(A);
taille = S(1,1);

D = diag(diag(A));
L= tril(A)-D;
U= triu(A)-D;

X = zeros(taille,1);
NEW = zeros(taille,1);

w = searchOmega(A);

nbIterations = 0;
while max(abs(A*X - B)) > power(10,-4)
    NEW = inv(D+L*w)*((1-w)*D*X-w*U*X+w*B);
    nbIterations = nbIterations+1;
    X = NEW;
end
disp(nbIterations);
end