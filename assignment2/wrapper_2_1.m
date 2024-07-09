clear
clc

disp('This is wrapper_2_1. How are you?');
disp(' ');
disp('One reason for the maxstep feature is obviously to prevent the code');
disp('from running for an unreasonably long time. The user can, for example,');
disp('choose to terminate the iteration after maxstep=100 steps, no matter');
disp('whether the desired tolerance is achieved.');
disp(' ');
disp('Why is that useful? Because unlike for the LU factorisation algorithm,');
disp('the intermediate iterates of the Gauss-Seidel algorithm are imprecise,');
disp('but meaningful approximations of the desired solution. So with a bit');
disp('of luck, the maxstep-th iterate is not as good as we would like it to be,');
disp('but still good enough for some purposes.');
disp(' ');
disp('In what particular situations is this feature useful? The user may be');
disp('running a time-critical operation, in which one sensor measurement must be');
disp('processed before the next one comes in. The user may want to check once');
disp('in a while whether the result is already good enough for his or her');
disp('purposes. If not, he or she can restart the algorithm with the result');
disp('of the previous run as initial guess.');
disp(' ');
disp('You will see that the maxstep feature helps me to generate nice plots');
disp('from your function. My trick is to run your method with an error tolerance');
disp('tol=-1, which cannot be achieved, and to set maxstep=1. This way, I can');
disp('be sure that your method carries out exactly one step. I can update my');
disp('figure, and then I call your function again, using the result of your');
disp('previous step as initial guess for the next step.');
disp(' ');
disp('Let us first have a look at a two-dimensional example, where you can see');
disp('what the method does when interpreted as a dynamical process. The output');
disp('will go to the broad top panel of figure 1.');
disp(' ');

%prepare the figure

figure(1)
clf

%set up data

A=[2 -1;-1 2]
b=[1;1]
x_exact=[1;1];
x0=[0;3]

%output into top panel of figure

subplot(2,2,1:2)
hold on

%draw exact solution as red circle

plot(x_exact(1),x_exact(2),'ro')

%iterate Gauss-Seidel scheme and plot the iterates as blue connected crosses

x=x0;
for k=1:10
    z=myGaussSeidel(A,b,x,-1,1);
    plot([x(1),z(1)],[x(2),z(2)],'x-b')
    x=z;
end

%add title and axis labels to figure

title('iterates of Gauss-Seidel method')
xlabel('x_1')
ylabel('x_2')

disp('Now we will study the error of the Gauss-Seidel method. The output');
disp('will go to the smaller panels at the bottom of figure 1. We will');
disp('display the errors once in standard format and once in a semilog-');
disp('arithmic plot. You will see that the latter is more informative.');

%iterate Gauss-Seidel scheme and record the errors

err=zeros(1,11);
err(1)=norm(x0-x_exact,Inf);
x=x0;
for k=1:10
    z=myGaussSeidel(A,b,x,-1,1);
    err(k+1)=norm(z-x_exact,Inf);
    x=z;
end

%naive plot 

subplot(2,2,3)
plot([0:10],err,'x-')
xticks([0:2:10])
title('naive error plot')
xlabel('k')
ylabel('||x_k-x^*||_\infty')

%semilogarithmic plot

subplot(2,2,4)
semilogy([0:10],err,'x-')
xticks([0:2:10])
yticks(10.^[-5:1:0])
title('semilogarithmic error plot')
xlabel('k')
ylabel('||x_k-x^*||_\infty')
