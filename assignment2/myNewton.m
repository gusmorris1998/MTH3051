%----------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%----------------------------------------------------------------
%
%----------------------------------------------------------------
% This is Newton's method as in Algorithm 3.24
%----------------------------------------------------------------
%
%--INPUTS--------------------------------------------------------
%
% f          -     handle of function f:R^d->R^d
% Df         -     handle of function for Jacobi matrix of f
% x          -     initial guess
% epstol     -     tolerable residual size
% maxstep    -     maximal number of steps to be carried out
%
%--OUTPUT--------------------------------------------------------
%
% x          -     approximation of a zero of f
% k          -     number of steps carried out
%
%----------------------------------------------------------------

%----------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%----------------------------------------------------------------

function [x,k]=myNewton(f,Df,x,epstol,maxstep)
    k = 0;
    while norm(f(x)) > epstol && k < maxstep
        w = linsolve(Df(x),-f(x));
        x = x + w;
        k = k + 1;
    end



%----------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%----------------------------------------------------------------
 