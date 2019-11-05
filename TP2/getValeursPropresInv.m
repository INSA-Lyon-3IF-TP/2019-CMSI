function [ EIG ] = getValeursPropresInv( A, taille )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if ~exist('taille','var')
    taille=length(A);
end
if taille>length(A)
    taille=length(A);
end

A = inv(A);
[lambda,V,U]=puissance_iteree(A);
A=deflation(lambda,V,U,A);
EIG(1,1)=1/lambda;
i=2;
while i<=taille
    [lambda,V,U]=puissance_iteree(A);
    A=deflation(lambda,V,U,A);
    EIG(i,1)=1/lambda
    i=i+1;
end
end

