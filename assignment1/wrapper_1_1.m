% clean up workspace

clear

% clean up command window

clc

disp('Hi! This is wrapper_1_1.m! My job is to take your code and do')
disp('something with it.')
disp(' ')
disp('First I combine the algorithms you program in Assignment 1.1')
disp('into one algorithm that solves a system of linear equations.')
disp('I test your code on a random example.')
disp(' ')

% set dimension of problem

d=5;
disp('I generate a random matrix and a random vector.')
A=rand(d);
b=rand(d,1);

% Now we make sure that A is strictly diagonally dominant, so the naive LU
% factorisation algorithm will not break down. (If you want to understand 
% why this works, please follow the challenges on the exercise sheets.)

for i=1:d
    A(i,i)=A(i,i)+d;
end

% The simplest way to display variables in Matlab.

A
b

disp('I call your function for LU-decomposition with this A and b.')
LU=myLUfactorisation(A)

disp('I generate matrices L and U from your output. (An efficient solver')
disp('would carry out forward and backward substitution directly with the')
disp('matrix LU. That would complicate parts a) and b) of Assignment 1.1,')
disp('which is not what we want.)')

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

disp('We should have L*U=A. Let us have a look at the product L*U:');
L*U

disp('Compring L*U and A can be cumbersome. There is a simple trick that')
disp('makes this unnecessary: We compute L*U-A. Let the computer do the work!')

diff_LUA=L*U-A

disp('This difference should be zero, right? Most likely, it is not. How')
disp('is this possible? When you carry out the LU factorisation, you carry')
disp('out a sequence of floating point operations. As you know, these are')
disp('not exact, so we have to expect some errors in the solution.')
disp(' ')
disp('Note that when I compute L*U-A in the test, I introduce more floating')
disp('point operations and more errors. The test is not perfect either!')
disp(' ')
disp('How would you test whether L*U is reasonably close to A when the')
disp('dimension of A is large? Do you want to read through a huge matrix?')
disp('Of course not. We can e.g. choose a matrix norm and compute ||L*U-A||:')

norm(diff_LUA,Inf)

disp('Or we can compute the maximum of the errors in the components of A:')

max(max(abs(diff_LUA)))

disp('Now I solve the linear system by calling your functions for')
disp('forward and backward substitution.');

y=myForwardSubstitution(L,b)
x_student=myBackwardSubstitution(U,y)

disp('For comparison, I apply the standard Matlab solver to the same data.')

x_Matlab=A\b

disp('We can again let Matlab simplify the comparison:')

norm(x_student-x_Matlab,Inf)

disp('If you programmed your functions correctly, the vectors x_student') 
disp('and x_Matlab should agree (up to some floating-point errors).')
disp(' ')
disp('CAUTION: If the solutions agree, this does not prove that your') 
disp('algorithm is correct. It may fail for different d, or for a different')
disp('type of matrix.')
disp(' ')
disp('Now let us see how the runtime of your code depends on the dimension');
disp('of the matrix. For simplicity, we only examine your LU fctorisation.');

kmax=10;
runtimes=zeros(1,kmax);
dimensions=zeros(1,kmax);
for k=1:kmax
    d=2^k;
    A=randn(d);
    tic
    fprintf('d=%3d: ',d);
    LU=myLUfactorisation(A);
    fprintf('done.\n');
    runtimes(k)=toc;
    dimensions(k)=d;
end

dimensions
runtimes

disp('We see that these runtimes are constant first, and then grow rapidly.');
disp('Matlab is bad at measuring short runtimes. This explains the constant');
disp('measurements for small d. This is not a problem, because we care about');
disp('large d. How rapid is the growth of the runtime in d? Let us draw a ');
disp('graph.')

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

disp(' ')
disp('The plain plot shown in the top panel is hard to interpret. As we have')
disp('large runtimes for large d, the relation between the smaller runtimes')
disp('is difficult to gauge.')
disp(' ')
disp('A logrithmic or a doubly logarithmic plot (latter shown in bottom panel)')
disp('can be a much better tool for visualising this kind of data. We see')
disp('that after an initial phase, in which Matlab seems to have problems')
disp('with assessing the runtime, a straight line emerges. Can you guess what')
disp('the slope of this line is, and how it might relate to our theory?') 
disp(' ')
disp('We will discuss such plots in more depth in the second half of the unit.')
disp('For now, you are only required to make an intelligent guess.')
