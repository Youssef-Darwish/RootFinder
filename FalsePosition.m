function answer  = FalsePosition(lowerBound,upperBound,polynomial,maxIterations,predefinedError)
%Calculates the root of polynomial with the given parameters using Flase-position methods

variable = '@(x)';
str = strcat(variable,polynomial);

fh = str2func(str);
%initializing empty vectors to hold results
errorsVector = [];
iterationsVector=[];
appRootsVector=[];
error = 100;
iterations = 0;
previousRootApproximation =0 ;

while error>predefinedError && iterations<maxIterations
  
    
  currentRootApproximation = ((lowerBound*fh(upperBound)) - (upperBound*fh(lowerBound)))/(fh(upperBound)-fh(lowerBound));
  
  checkFunction = fh(currentRootApproximation);
  if (checkFunction <0)
    lowerBound = currentRootApproximation;
  elseif (checkFunction >0)
    upperBound = currentRootApproximation;
  elseif (checkFunction ==0)
  iterations = iterations+1
  iterationsVector = [iterationsVector iterations];
  error = abs(currentRootApproximation-previousRootApproximation);
  errorsVector = [errorsVector error ];
  previousRootApproximation = currentRootApproximation;
  appRootsVector = [appRootsVector previousRootApproximation];
    break
  end
  iterations = iterations+1
  iterationsVector = [iterationsVector iterations];
  error = abs(currentRootApproximation-previousRootApproximation);
  errorsVector = [errorsVector error ];
  previousRootApproximation = currentRootApproximation;
  appRootsVector = [appRootsVector previousRootApproximation];
  
end
       errorsVector = transpose(errorsVector);
       appRootsVector = transpose(appRootsVector);
       iterationsVector = transpose(iterationsVector); 
       % plotting the function --> not yet
       answer = cat(2,iterationsVector,errorsVector,appRootsVector);
