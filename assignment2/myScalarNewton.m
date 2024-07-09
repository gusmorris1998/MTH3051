%----------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%----------------------------------------------------------------
%
%----------------------------------------------------------------
% This is the scalar Newton's method as in Algorithm 3.19
%----------------------------------------------------------------
%
%-INPUTS--------------------------------------------------------
%
% f          -     handle of function f:R->R
% df         -     handle of function f':R->R
% x0         -     initial guess
% epstol     -     tolerable residual size
% maxstep    -     maximal number of steps to be carried out
%
%-OUTPUT--------------------------------------------------------
%
% x          -     approximation of a zero of f
% k          -     number of steps carried out
%
%----------------------------------------------------------------

%----------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%----------------------------------------------------------------

function [x,k]=myScalarNewton(f,df,x,epstol,maxstep)
    k = 0;
    while abs(f(x)) > epstol && k < maxstep
        x = x - (f(x)/df(x));
        k = k + 1;
    end

%----------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%----------------------------------------------------------------
 