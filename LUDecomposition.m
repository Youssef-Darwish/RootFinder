% A is the cofficients matrix where Ax=B.
function [L,U,x] = LUDecomposition(A,B)
 
dimensions = size(A);
if (dimensions(1)~=dimensions(2))
    error('coefficients matrix must be a square matrix');
end
%intializes L and U matrices with zeros
L=zeros(size(A));
U=zeros(size(A));
n = dimensions(1);
d=zeros(n,1);
x=zeros(n,1);
%fills the diagonal of L with ones.
for j=1:n
    L(j,j)=1;
end
%fills first row of U with same values of elements in A
for j=1:n
    U(1,j)=A(1,j);
end
%Gauss Elimination
   for k = 1 : n-1
      for i = k+1 : n
          factor = A(i,k)/A(k,k);
          L(i,k)=factor;
          for j = k : n
              U(i,j) = A(i,j) - (factor * A(k,j));
              A(i,j)=A(i,j) - (factor * A(k,j));
          end
      end
   end
%forward substitution  
   for j=1:n
      d(j)=B(j)/L(j,j);
      B(j+1:n)=B(j+1:n)-L(j+1:n,j)*d(j);
   end 
%backward substitution
    for j=n:-1:1
    x(j)=d(j)/U(j,j);
    d(1:j-1)=d(1:j-1)-U(1:j-1,j)*x(j);
    end
   
   
   
   
end