clear
clc

disp('Hi! This is wrapper_3_1. Let me show you how polynomial interpolation');
disp('can go wrong.');
disp(' ');
disp('We have emphasized that the smoothness of a function and the magnitude');
disp('of the derivatives charaterise the quality of an approximation by');
disp('polynomials. Now I show you in an example what can happen when the');
disp('function is non-smooth.')
disp(' ');
disp('The Heaviside function is 0 for nonpositive and 1 for positive x.');
disp('It has a jump at zero. I use your code to approximate it with');
disp('polynomials on equidistant nodes. You will see in the left panel of'); 
disp('Figure 1 that taking more nodes makes the approximation worse and');
disp('not better.');
disp(' ');
disp('If you want to see how bad the problem is, replace N by something');
disp('like N=[1,2,4,8,16,32] and have a look at the disaster.');
disp(' ');
disp('***********');
disp(' ');

figure(1)
clf

N=[1,2,4,8];
x=[-1:0.01:1];
y=zeros(size(x));

subplot(1,2,1)
hold on

%plot Heavyside function

plot(x,double(x>0))

%plot interpolation polynomials

for i=1:length(N)    
    nodes=[-1:2/N(i):1];
    values=double(nodes>0);
    c=myNewtonCoefficients(nodes,values);
    for i=1:length(x)        
        y(i)=myEvaluateNewtonPolynomial(x(i),nodes,c);
    end
    plot(x,y)  
end
hold off

title(sprintf('polynomial interpolation of Heavyside function:\n more nodes give worse approximation!'))
xlabel('x')
ylabel('y')
legend('Heaviside','ipp for N=1','ipp for N=2','ipp for N=4','ipp for N=8','Location','northwest')

disp('Now you will see that a high degree of smoothness is not enough to');
disp('guarantee a meaningful approximation by interpolation polynomials.');
disp('The following example is classical and often referred to as Runges');
disp('phenomenon. The result is displayed in the right panel of Figure 1.');
disp(' ');
disp('***********');
disp(' ');

subplot(1,2,2)
hold on

%we consider this rational function

f=@(t)1./(1+(5*t).^2);
plot(x,f(x))

%approximation by interpolation polynomials

for i=1:length(N)    
    nodes=[-1:2/N(i):1];
    values=f(nodes);

    %Now I use high-level Matlab commands to compute the interpolation
    %polynomials. Your code does more or less the same.

    p=polyfit(nodes,values,length(nodes)-1);
    y=polyval(p,x);    
    plot(x,y)        
end
hold off

[val,pos]=max(f(x)-y)
x(pos)

title(sprintf('polynomial interpolation of rational function: \nmore nodes give worse approximation!'))
xlabel('x')
ylabel('y')
legend('f','ipp for N=1','ipp for N=2','ipp for N=4','ipp for N=8','Location','northwest')

disp('In the lectures, we have skipped splines, because we cannot cover');
disp('every aspect of numerics in just one unit. Splines are made of');
disp('many polynomials, which are glued together. They react much better');
disp('to nonsmooth data or functions with large derivatives. The output');
disp('of the following code goes to Figure 2.');

figure(2)
clf

subplot(1,2,1)
hold on

N=[4,8,16,32];
x=[-1:0.01:1];

%plot Heavyside function

plot(x,double(x>0))

%plot cubic splines

for i=1:length(N)    
    nodes=[-1:2/N(i):1];
    values=double(nodes>0); 
    y=spline(nodes,values,x);
    plot(x,y)  
end
hold off
title(sprintf('cubic spline interpolation of Heavyside function:\n more nodes give better approximation!'))
xlabel('x')
ylabel('y')
legend('Heaviside','spline for N=4','spline for N=8','spline for N=16','spline for N=32','Location','northwest')


subplot(1,2,2)
hold on

N=[4,8,16,32];
x=[-1:0.01:1];

f=@(t)1./(1+(5*t).^2);
plot(x,f(x))

%approximation by splines

for i=1:length(N)    
    nodes=[-1:2/N(i):1];
    values=f(nodes);    
    y=spline(nodes,values,x);
    plot(x,y)    
end
hold off

title(sprintf('cubic spline interpolation of rational function: \nmore nodes give better approximation!'))
xlabel('x')
ylabel('y')
legend('f','spline for N=4','spline for N=8','spline for N=16','spline for N=32','Location','northwest')

