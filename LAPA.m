%Jay Maini 101037537
%PA 4 - Finite Difference Formulation

set(0,'DefaultFigureWindowStyle','docked')
close all;

nx = 50;
ny = 50;
ni = 2500;
V = zeros(nx,ny);

SidesToZero = 1;
for k=1:ni
    for m=1:nx
        for n=1:ny
            %Something here
            
            %Set/Reset boundary conditions
            if (n == 1)
                %Edge case: V = 1 on left side
                V(m,n) = 1;
            elseif (n == ny)
                %Edge case: V = 0 on right side
                V(m,n) = 0;    
            elseif (m == 1)
                %Bottom edge case: Only affected by 3 surrounding particles
                V(m,n) = (V(m+1,n)+V(m,n+1)+V(m,n-1))/3;    
            elseif (m == nx) 
                %Top edge case: Only affected by 3 surrounding particles
                V(m,n) = (V(m-1,n)+V(m,n+1)+V(m,n-1))/3;     
            else
                %Full finite-difference formulation
                 V(m,n) = (V(m+1,n)+V(m-1,n)+V(m,n+1)+V(m,n-1))/4;
            end
        
        end
        
        if mod(k,50) == 0
            surf(V)
            pause(0.01)
        end
    end
end
[Ex, Ey] = gradient(V);

figure
quiver(-Ey',-Ex',1)