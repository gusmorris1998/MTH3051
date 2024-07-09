clear
clc
clf

disp('This is wrapper_1_3.m.');
disp(' ');
disp('I measure the runtime of your routine myLaplaceExpansion and');
disp('compare it with determinant computation via LU-factorisation.');
disp(' ');

dmax=9;
time_Laplace=zeros(1,dmax);
time_LU=zeros(1,dmax);

disp('I apply your routine as well as LU-factorisation to random');
disp('dxd-matrices. I use the commands tic and toc to measure the');
disp('elapsed time. I do this several times for each d to smoothe');
disp('out effects coming from your OS or from processes within');
disp('Matlab - at least to some extent.');
disp(' ');

for d=1:dmax
    fprintf('d=%d: ',d);
    A=rand(d);    
    for t=1:10            
        tic
        myLaplaceExpansion(A);
        time_Laplace(d)=time_Laplace(d)+toc;
        tic
        [L,U]=lu(A);
        U=prod(diag(U));
        time_LU(d)=time_LU(d)+toc;
        fprintf('.');
    end
    fprintf('\n');
end
fprintf('\n');

disp('Done. Now I display the computation times for both approaches.')
disp('As you see, the computation time of Laplace expansion explodes');
disp('as d increases, while the computation time of the LU-based');
disp('algorithm grows moderately.');

time_Laplace
time_LU

disp('I visualise the runtimes in a diagram. Logarithmic plots help');
disp('compare data of different orders of magnitude. Time measurements');
disp('can be flawed in Matlab, in particular when the runtimes are');
disp('short. If you see some strange effects for small d, this is why.');
disp('For cleaner results, you can increase dmax, but then you will');
disp('have to wait for a long time until the computation finishes.');

semilogy([1:dmax],time_Laplace(1:dmax),[1:dmax],time_LU(1:dmax))
title('Laplace Expansion versus LU-based determinant computation')
xlabel('dimension d')
ylabel('time elapsed')
legend('Laplace','LU','Location','NorthWest')
