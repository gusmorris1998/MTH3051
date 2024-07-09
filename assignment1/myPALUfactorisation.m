%--------------------------------------------------------------------------
% DO NOT MODIFY THE FILE NAME!
%--------------------------------------------------------------------------
%
%--------------------------------------------------------------------------
% This is memory-efficient PALU-factorisation as in Algorithm 2.46.
%--------------------------------------------------------------------------
% 
%--INPUTS------------------------------------------------------------------
%
% A          -     invertible matrix
%
%--OUTPUT------------------------------------------------------------------
%
% A          -     LU-decomposition [L,U] of PA, stored in A
% r          -     permutation vector (row vector) encoding the matrix P 
%                  of PALU
%
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% DO NOT MODIFY THE FUNCTION DEFINITION!
%--------------------------------------------------------------------------

function [A,r]=myPALUfactorisation(A)
    d=size(A,1);
    r=zeros(1,d);
    for k = 1:d - 1
        % Select pivot element
        [~,pos] = max(abs(A([k:d], k)));
        % indexing a matrix is considered a new matrix
        %   => (k - 1) corrects this 
        r(k) = pos + (k - 1);
        if r(k) ~= k
            for j=1:d
                t = A(k,j);
                A(k,j) = A(r(k),j);
                A(r(k),j) = t;
            end
        end
        % Elimination step
        for i = k+1:d
            A(i,k) = A(i,k)/A(k,k);
            for j = k + 1:d
                A(i,j) = A(i,j) - A(i,k)*A(k,j);
            end
        end
    end


%--------------------------------------------------------------------------
% WRITE YOUR CODE BELOW THIS LINE!
%--------------------------------------------------------------------------
 