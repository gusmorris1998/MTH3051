%----------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%----------------------------------------------------------------
%
%----------------------------------------------------------------
% This is the Horner-type algorithm from Remark 4.14
%----------------------------------------------------------------
%
%--INPUTS--------------------------------------------------------
%
% x          -     real number
% nodes      -     row vector with pairwise distinct entries
% c          -     column vector with Newton coefficients of 
%                  polynomial p
%
%--OUTPUT--------------------------------------------------------
%
% y          -     function value p(x)
%
%----------------------------------------------------------------

%----------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%----------------------------------------------------------------

function y=myEvaluateNewtonPolynomial(x,nodes,c)
    n = length(nodes);

    if n == 1
        y = c(1);
    else
        y = c(1) + (x - nodes(1)) * myEvaluateNewtonPolynomial(x, nodes(2:end), c(2:end));
    end

    


    

%----------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%----------------------------------------------------------------

 