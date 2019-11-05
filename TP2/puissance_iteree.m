function [lambda, V, U ] = puissance_iteree( A )

taille=size(A);
X0=ones(taille(1),1);
X=X0;
ANCX=X;
Y=A*X;

while abs(norm(X)*norm(Y)) ~= abs(dot(X,Y))
        ANCX=X;
        Y=A*X;
        X=Y/norm(Y);
end
Y=A*X;
[m,ind]=max(abs(X));
lambda = Y(ind) / X(ind);
V = X;


X0=ones(1,taille(1));
X=X0;
Y=X*A;
while abs(norm(X)*norm(Y)) ~= abs(dot(X,Y))
        X=Y/norm(Y);
        Y=X*A;
end

[m,ind]=max(abs(X));
lambda = Y(ind) / X(ind);
U = X;
end

