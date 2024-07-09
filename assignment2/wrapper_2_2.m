clear 
clc

disp('This is wrapper_2_2. Today we will generate a really fancy error plot.');
disp(' ');
disp('We will compare the parallel chord method with the secant method and');
disp('Newtons method by approximating sqrt(2) with all three schemes. At');
disp('first, we plot the errors into a semilogarithmic diagram.');
disp(' ');

%function data

f=@(x)x.^2-2;
df=@(x)2*x;

%set iteration horizon for every function

pcm_steps=10;
sec_steps=6;
new_steps=5;

%compute parallel chord method erors

pcm_err=zeros(1,pcm_steps);
for k=1:pcm_steps
    pcm_err(k)=abs(myParallelChord(f,df,1,-1,k)-sqrt(2));
end

%compute secant method errors

sec_err=zeros(1,sec_steps);
for k=1:sec_steps
    sec_err(k)=abs(mySecant(f,0,1,-1,k)-sqrt(2));
end

%compute Newton's method errors

new_err=zeros(1,new_steps);
for k=1:new_steps
    new_err(k)=abs(myScalarNewton(f,df,1,-1,k)-sqrt(2));
end

%visualisation

figure(1)
clf

subplot(1,2,1)
semilogy([1:pcm_steps],pcm_err,[1:sec_steps],sec_err,[1:new_steps],new_err)
title('performance on problem f(x)=x^2-2=0')
xlabel('iteration number k')
ylabel('k-th error e_k')
legend('parallel chord method','secant method','Newtons method')

disp('The error of the parallel chord method decreases along a straight line,')
disp('while the error of the secant method curves down. The error of Newtons');
disp('method curves down even more, so you see that when the problem is nice,');
disp('then Newtons method beats secant method beats parallel chord method.');
disp('But it would be nice to know how much faster exactly one method is com-');
disp('pared to another in terms of the rate of convergence. How can we see this?' );
disp(' ');

subplot(1,2,2)
disp('Do you remember the exercise sheet from Week 6? What does it tell us');
disp('about the second plot?');

loglog(pcm_err(1:length(pcm_err)-1),pcm_err(2:length(pcm_err)),...
    sec_err(1:length(sec_err)-1),sec_err(2:length(sec_err)),...
    new_err(1:length(new_err)-1),new_err(2:length(new_err)))
title('pairs of errors (log(e_k),log(e_{k+1}))')
xlabel('k-th error e_k')
ylabel('(k+1)-th error e_{k+1}')
legend('parallel chord method','secant method','Newtons method','Location','northwest')

%brings the figure to the front, in case it isn't visible

figure(1)