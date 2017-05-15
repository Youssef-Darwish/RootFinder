function answer = GaussianElimination(A,B)
  %solves systems of linear equations using Naive Gaussian Elimination
  
  %A is coefficients matrix : Ax=b
  
  %vector to hold the results
  var = [];
  dimensions = size(A);
  if (dimensions(1)~=dimensions(2))
    error("coefficients matrix must be a square matrix");
  end
   
   %forward substitution
   n = dimensions(1);
   for k = 1 : n-1
      %get max elements and their indices
      [M I] = max(A);
      %swapping
      if(A(k,k)==0)
        temp = A(k,:);
        A(k,:) = A(I(k),:);
        A(I(k),:) = temp;
        temp = B(k,:);
        B(k,:) = B(I(k),:);
        B(I(k),:) = temp;
      end
      for i = k+1 : n
       % disp("pivot");
       %disp(A(k,k));
        factor = A(i,k)/A(k,k);
        for j = k+1 : n
              A(i,j) = A(i,j) - (factor * A(k,j));
        end
          B(i) = B(i) - (factor * B(k));
      end
   end
   %disp(B);
   %disp("passed")
   %forward substitution checked
  
  %back Substitution
  var(n) = B(n)/A(n,n);  
 for i  = n-1 : -1 : 1   %inverse loop syntax
    sum =0;
    for j = i+1 :n
      sum = sum + (A(i,j) * var(j));
    end 
    var(i) = (B(i)-sum)/A(i,i);
 
 end
 answer = var';
 

