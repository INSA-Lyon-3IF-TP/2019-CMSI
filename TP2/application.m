function [A] = application()

X = ones(15,40);
A= zeros(600);

X(1,1)=0; %coin en haut à gauche

for i=15:40 %bord haut
   X(1,i)=0;
   indiceA=211+(i-15)*15;
   A(indiceA,indiceA)=1;
end

for i=1:15 %bord droit
   X(i,40)=0;
   indiceA=600-(i-1);
   A(indiceA,indiceA)=1;
end

for i=1:40 %bord bas
   X(15,i)=0;
   indiceA=15+(i-1)*15;
   A(indiceA,indiceA)=1;
end

for i=10:19
   X(11,i)=0; 
   indiceA=145+(i-10)*15;
   A(indiceA,indiceA)=1;
end

A(1,1)=1;
for i=2:14
   A(i,i) = -3;
   A(i,i+1) = 1;
   A(i,i-1) = 1;
   A(i,i+15) = 1; 
end

for i=2:14
   ind=1+(i-1)*15;
   A(ind,ind) = -3;
   A(ind,ind+1) = 1;
   A(ind,ind-15) = 1;
   A(ind,ind+15) = 1;  
end

j = 15;
while j < 600
    i = 1;
    while i < 15
         if(and(mod(j+i,15)==0, mod(j+i,15)==1))
             i = i + 1;
             continue;
         end
         if(j+i>585)
             i = i + 1;
             continue;
         end
         if(and(j+i>144,and(mod(j+i-10,15)==1,j+i<281)))
             i = i + 1;
             continue;
         end
        A(i+j,i+j) = -4;
        A(i+j,i+j+1) = 1;
        A(i+j,i+j-1) = 1;
        A(i+j,i+j+15) = 1;
        A(i+j,i+j-15) = 1;
        i = i + 1;
    end
    j = j + 15;
end

%writematrix(A,'test.xlsx')

end

