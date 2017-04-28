function answer = GaussJordan(A,B)
  %solves systems of linear equations using Gauss-Jordan Elimination
  
  %A is coefficients matrix : Ax=b
  
  %gaussian elimination code
  
  %vector to hold the results
  var = [];
  
  dimensions = size(A);
  if (dimensions(1)~=dimensions(2))
    error("coefficients matrix must be a square matrix");
  end
  %Augmented Matrix : [A|B]
 
   A = [A B]; 
   %forward substitution
   n = dimensions(1);
   
   %steps :
   % find pivot using max()
   %scaling the row of pivot 
   %elimination with all other rows
   
   maxRow = [];
   for k = 1 : n
      maxElements = max(A);
      
      for i = k+1 : n
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
 
