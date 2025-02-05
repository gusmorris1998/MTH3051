%---------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%---------------------------------------------------------------
%
%---------------------------------------------------------------
% This is the central difference quotient as in Example 6.2
%---------------------------------------------------------------
%
%--INPUTS-------------------------------------------------------
%
% f          -     function handle
% x          -     real number
% h          -     real number
%
%--OUTPUT-------------------------------------------------------
%
% cdq        -     approximation of f'(x)
%
%---------------------------------------------------------------

%---------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%---------------------------------------------------------------

function cdq=myCentralDQ(f,x,h)
    cdq = (1/2*h)*(f(x+h) - f(x-h));

%---------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%---------------------------------------------------------------
 