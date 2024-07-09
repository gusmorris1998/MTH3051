%----------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%----------------------------------------------------------------
%
%----------------------------------------------------------------
% This is parallel chord method as in Algorithm 3.18
%----------------------------------------------------------------
%
%--INPUTS--------------------------------------------------------
%
% f          -     handle of function f:R->R
% df         -     handle of function f':R->R
% x0         -     initial guess
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

function [x,k]=myParallelChord(f,df,x0,epstol,maxstep)
    x = x0;
    k = 0;
    while abs(f(x)) > epstol && k < maxstep
        x = x - (f(x)/df(x0));
        k = k + 1;
    end

%----------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%----------------------------------------------------------------    