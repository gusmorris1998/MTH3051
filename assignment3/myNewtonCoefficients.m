%----------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%----------------------------------------------------------------
%
%----------------------------------------------------------------
% This algorithm computes the Newton coefficients of the
% interpolation polynomial for given data as indicated in 
% Remark 5.7.
%----------------------------------------------------------------
%
%--INPUTS--------------------------------------------------------
%
% x          -     row vector of pairwise distinct real numbers
% y          -     row vector of real numbers
%
%--OUTPUT--------------------------------------------------------
%
% c          -     column vector with Newton coefficients of 
%                  interpolation polynomial for data (x,y)
%
%----------------------------------------------------------------

%----------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%----------------------------------------------------------------

function c=myNewtonCoefficients(x,y)
    n = length(x);
    c = zeros(n, 1);
    A = zeros(n);
    c(1) = y(1);
    A(1, 1) = y(1);
    for i=2:n
        A(i,1) = y(i);
        for j=2:i
            A(i,j) = (A(i,j-1) - A(i-1, j-1))/(x(i) - x(i-(j-1)));
            if i == j
                c(i) = A(i,j);
            end
        end
    end

%----------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%----------------------------------------------------------------
 