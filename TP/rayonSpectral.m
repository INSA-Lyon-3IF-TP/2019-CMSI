function [ X ] = rayonSpectral(M)
X = max(abs(eig(M)));
end
