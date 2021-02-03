set(0,'DefaultFigureWindowStyle','docked')

nx = 100;
ny = 100;
ni = 10000;
V = zeros(nx,ny);

SidesToZero = 1;
for k=1:ni
    for i=1:nx
        for j=1:ny
            %Something here
            
            %Set/Reset boundary conditions
            %1 on left side
            
            %0 on right side 
        end
        
        if mod(k,50) == 0
            surf(V;)
            pause(0.05)
        end
    end

[Ex, Ey] = gradient(V);

figure
quiver(-Ey',-Ex',1)