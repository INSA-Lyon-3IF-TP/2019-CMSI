function [ newA ] = deflation( lambda,V,U,A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    newA=A-lambda*((V*U)/(U*V));
end

