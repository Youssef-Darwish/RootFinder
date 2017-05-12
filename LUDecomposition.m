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
%used to detect swapped rows due to pivoting
indeces=zeros(n,1);
%intialize indeces matrix
for i=1:n
    indeces(i)=i;
end
%fills the diagonal of L with ones.
for j=1:n
    L(j,j)=1;
end

%pivoting and swapping function
% where k is the column index
function pivot(A,indeces,k,n)
 p=k;
 largestElement=A(indeces(k),k);
 for l=k+1:n
     if A(indeces(l),k)>largestElement
         largestElement=A(indeces(l),k);
         p=l;
     end
 end
 temp=indeces(p);
 indeces(p)=indeces(k);
 indeces(k)=temp;
end



%fills first row of U with same values of elements in A
for j=1:n
    U(1,j)=A(1,j);
end
%Gauss Elimination
   for k = 1 : n-1
       pivot(A,indeces,k,n);
      for i = k+1 : n
          factor = A(indeces(i),k)/A(indeces(k),k);
          L(i,k)=factor;
          for j = k : n
              U(i,j) = A(indeces(i),j) - (factor * A(indeces(k),j));
              A(indeces(i),j)=A(indeces(i),j) - (factor * A(indeces(k),j));
          end
      end
   end
%forward substitution  
   for j=1:n
      d(j)=B(indeces(j))/L(j,j);
      B(indeces(j+1:n))=B(indeces(j+1:n))-L(j+1:n,j)*d(j);
   end 
%backward substitution
    for j=n:-1:1
    x(j)=d(j)/U(j,j);
    d(1:j-1)=d(1:j-1)-U(1:j-1,j)*x(j);
    end
fileID = fopen('output.txt','w'); 
for i=1:n
fprintf(fileID,'%6s%d=','x',i);
fprintf(fileID,'%f\n',x(i));
end
fclose(fileID);    
   
end