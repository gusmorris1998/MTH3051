%----------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%----------------------------------------------------------------
%
%----------------------------------------------------------------
% This is secant method as in Algorithm 3.12
%----------------------------------------------------------------
%
%--INPUTS--------------------------------------------------------
%
% f          -     handle of function f:R->R
% x          -     first initial guess
% y          -     second initial guess
% epstol     -     tolerable residual size
% maxstep    -     maximal number of steps to be carried out
%
%--OUTPUT--------------------------------------------------------
%
% y          -     approximation of a zero of f
% k          -     number of steps carried out
%
%----------------------------------------------------------------

%----------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%----------------------------------------------------------------

function [y,k]=mySecant(f,x,y,epstol,maxstep)
    k = 0;
    while abs(f(y)) > epstol && k < maxstep
        z = y - ((y-x)/(f(y)-f(x))) * f(y);
        x = y;
        y = z;
        k = k + 1;
    end


%----------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%----------------------------------------------------------------
    
    