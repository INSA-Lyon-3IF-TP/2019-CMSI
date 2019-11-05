function [ minw ] = searchOmega(A )

D = diag(diag(A));
L= tril(A)-D;
U= triu(A)-D;
w=0;

while w<2
    PI = inv((D + w*L))*((1-w)*D-w*U);
    ro = rayonSpectral(PI);
    if w == 0
        minw = w;
        minro = ro;
    else
    if ro < minro
        minw = w;
        minro = ro;
    end
    end
    w = w + 0.01;
end
end