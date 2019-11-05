function [ M ] = vectToMatrix( V )
a = 20;
b = 25;
M = zeros(a,b);

i = 1;
while i <= 20
    j = 0;
    while j < 25
        z = (j*20)+i;
        M(i,j+1) = V(z);
        j = j + 1;
    end
    i = i +1;
end

end

