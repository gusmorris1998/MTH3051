%----------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%----------------------------------------------------------------
%
%----------------------------------------------------------------
% This is Gauss-Seidel method as in Algorithm 2.56
%----------------------------------------------------------------
%
%--INPUTS--------------------------------------------------------
%
% A          -     quadratic matrix
% b          -     column vector
% x          -     initial guess
% epstol     -     tolerable residual size
% maxstep    -     maximal number of steps to be carried out
%
%--OUTPUTS-------------------------------------------------------
%
% x          -     approximate solution x of Ax=b
% k          -     number of steps carried out
%
%----------------------------------------------------------------

%----------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%----------------------------------------------------------------

function [x,k]=myGaussSeidel(A,b,x,epstol,maxstep)
    d=length(b);
    k = 0;
    while norm(A*x - b) > epstol && k < maxstep
        for i = 1:d
            x(i) = b(i);
            for j = 1:d
                if j ~= i
                    x(i) = x(i) - A(i,j)*x(j);
                end
            end
            x(i) = x(i)/A(i,i);
        end
        k = k + 1;
    end

%----------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%----------------------------------------------------------------
 