function [A] = applicationLigne()

X = ones(15,40);
A= zeros(600);

X(1,1)=0; %coin en haut à gauche
A(1,1)=1;

for i=15:40 %bord haut
   X(1,i)=0;
   indiceA=i;
   A(indiceA,indiceA)=1;
end

for i=1:15 %bord droit
   X(i,40)=0;
   indiceA=40+(i-1)*40;
   A(indiceA,indiceA)=1;
end

for i=1:40 %bord bas
   X(15,i)=0;
   indiceA=560+i;
   A(indiceA,indiceA)=1;
end

for i=10:19
   X(11,i)=0; 
   indiceA=410+(i-10);
   A(indiceA,indiceA)=1;
end


for i=2:14
   A(i,i) = -3;
   A(i,i+1) = 1;
   A(i,i-1) = 1;
   A(i,i+40) = 1; 
end

for i=2:14
   ind=1+(i-1)*40;
   A(ind,ind) = -3;
   A(ind,ind+1) = 1;
   A(ind,ind-40) = 1;
   A(ind,ind+40) = 1;  
end

j = 40;
while j < 560
    i = 2;
    while i < 40
         if(mod(j+i,40)==0)
             i = i + 1;
             continue;
         end
         if(and(j+i>409,j+i<420))
             i = i + 1;
             continue;
         end
        A(i+j,i+j) = -4;
        A(i+j,i+j+1) = 1;
        A(i+j,i+j-1) = 1;
        A(i+j,i+j+40) = 1;
        A(i+j,i+j-40) = 1;
        i = i + 1;
    end
    j = j + 40;
end
end

