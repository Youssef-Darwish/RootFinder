function [answer,err] = GaussSidel( A,B,thres,maxIterations )
%solves systems of linear equations using Gauss-Jordan Elimination
  
  %A is coefficients matrix : Ax=b
  
  %tic;
  
  dimensions = size(A);
  if (dimensions(1)~=dimensions(2))
    error('coefficients matrix must be a square matrix');
  end
  dimensions2 = size(B);
  if (dimensions(1)~=dimensions2(1))
    error('number of Equations should equal ');
  end
  n = dimensions(1);
  x = zeros(n,1)+[1;0;1];
  
  t = zeros(n,1)+[1;0;1];
  err = zeros(n,1)+100;
  totalErr = zeros(n,1)';
  roots = zeros(n,1);
  maxErr = 1;
  while ((maxErr > thres) && (maxIterations > 0) )
    maxErr = 0;
  for i=1:n
       x(i,1) = B(i,1); 
     
    for j=1:n
        if(i~=j)
            x(i) = x(i) - A(i,j)*x(j,1);
        end
    end
    x(i,1) = x(i,1) / A(i,i);
    div = x(i,1);
    if (div ==0)
        if (t(i,1) ~= 0)
            div = t(i,1);
        end
    end
    err(i,1) = abs((x(i,1) - t(i,1)));
    if (err(i,1) > 0 )
        err(i,1) = err(i,1)/ div;
    end
    maxErr = max(maxErr,err(i,1));
    t(i,1) = x(i,1);
  end
  maxIterations = maxIterations-1;
  roots = [roots x];
  totalErr = [totalErr;err']; %optimize this by setting totalErr initialy with dimension of max iterations.
  end
  err = totalErr(2:end,:);
  answer = x;
  figure1 = figure
  plot((1:size(roots,2)),roots(1,:));
  saveas(figure1,'root1.jpg')
  
end

