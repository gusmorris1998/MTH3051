% clean up workspace and command window

clear
clc

disp('Hi! This is wrapper_1_2.m.');
disp('')
disp('I combine your PALU factorisation algorithm with your forward and');
disp('backward substitution from Problem 1.1 into one algorithm that solves');
disp('a system of linear equations, and test them on a random example.');
disp('I guess you have seen something similar before.')

% set dimension of problem

d=5;

disp('I generate a random matrix and a random vector.');

% This time, any invertible matrix will do. This type of random matrix
% is invertible with probability 1. It is extremely unlikely that A is
% singular, but not impossible.

A=randn(d)
b=randn(d,1)

disp('I call your function for PALU-decomposition with this A and b.');

[LU,r]=myPALUfactorisation(A)

disp('I generate matrices L and U from your output. (An efficient solver');
disp('would work directly with the matrix LU.)');

L=zeros(d);
U=zeros(d);
for i=1:d
    for j=1:d
        if (i<j)
            U(i,j)=LU(i,j);
        elseif (i==j)
            U(i,j)=LU(i,j);
            L(i,j)=1;
        else
            L(i,j)=LU(i,j);
        end
    end
end

L
U

disp('Now we should have PA=LU. (An efficient solver would compute neither')
disp('PA nor LU. We just do it out of curiosity.) Let us see:')

PA=A;
for i=1:d-1
    v=PA(i,:);
    PA(i,:)=PA(r(i),:);
    PA(r(i),:)=v;
end
LU=L*U;

PA 
LU

disp('My colleague wrapper_1_1.m already showed you how to make the')
disp('computer do all the work in testing. The maximal error in a single')
disp('component of PA is:')

max(max(abs(PA-LU)))

disp('If this is not close to zero, then there is something wrong.')
disp(' ')
disp('Now I solve the linear system Ax=b by solving the equivalent system');
disp('LUx=PAx=Pb with your functions for forward and backward substitution.');
disp('First I compute Pb.');

Pb=b;
for k=1:d-1
    if (r(k)~=k)
        tau=Pb(r(k));
        Pb(r(k))=Pb(k);
        Pb(k)=tau;
    end
end

Pb

disp('Now I carry out a forward substitution and a backward substitution');
disp('with L, U and Pb:')

y=myForwardSubstitution(L,Pb)
x_student=myBackwardSubstitution(U,y)

disp('For comparison, I apply the standard Matlab solver to the same data.');

x_Matlab=A\b

disp('We quickly check ||x_student-x_Matlab||_oo:')

max(abs(x_student-x_Matlab))

disp('If you programmed your functions correctly, the vectors x_student and')
disp('x_Matlab should agree.');
disp(' ')
disp('CAUTION: If you get the correct result, this does not guarantee that')
disp('your code is correct. What about other choices of d? What about other')
disp('types of matrices?')

disp(' ')
disp('Now let us see how the runtime of this code depends on the dimension');
disp('of the matrix. For simplicity, we only examine your PALU fctorisation.');
kmax=10;
runtimes=zeros(1,kmax);
dimensions=zeros(1,kmax);
for k=1:kmax
    d=2^k;
    A=randn(d);
    tic
    fprintf('d=%3d: ',d);
    LU=myPALUfactorisation(A);
    fprintf('done.\n');
    runtimes(k)=toc;
    dimensions(k)=d;
end
dimensions
runtimes

disp('The plot is very similar to the one from Problem 1.1. This is not');
disp('surprising, because both algorithms are identical, apart from some');
disp('additional swapping operations, which - in theory - are cheap.');

figure(1)
clf
subplot(2,1,1)
plot(dimensions(1:kmax),runtimes(1:kmax))
title('plain plot')
xlabel('d')
ylabel('runtime')
subplot(2,1,2)
loglog(dimensions(1:kmax),runtimes(1:kmax))
title('loglog plot')
xlabel('d')
ylabel('runtime')
figure(1)



