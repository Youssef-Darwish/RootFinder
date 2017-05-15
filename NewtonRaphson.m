function answer  = NewtonRaphson(initialGuess,polynomial,maxIterations,predefinedError)
%Calculates the root of polynomial with the given parameters using NewtonRaphson methods

%using tic;toc; to calculate the elapsed time;
tic;
variable = '@(x)';
str = strcat(variable,polynomial);

fh = str2func(str);

s = vectorize(char(polynomial));
eval(['polynomial = @(x)',s]);
   
syms x;
derivative = matlabFunction(diff(polynomial,x));

%initializing empty vectors to hold results
errorsVector = [];
iterationsVector=[];
appRootsVector=[];
error = 100;
iterations = 0;
previousRootApproximation = initialGuess;
currentRootApproximation=initialGuess;
while error>predefinedError && iterations<maxIterations
 
    
  %handling division by zero
  
  if (derivative(currentRootApproximation) ==0)  
    break
  end
  currentRootApproximation = previousRootApproximation  - (fh(previousRootApproximation)/derivative(currentRootApproximation));
  %disp(fh(currentRootApproximation))
  iterations = iterations+1;
  iterationsVector = [iterationsVector iterations];
  error =abs (currentRootApproximation-previousRootApproximation);
  errorsVector = [errorsVector error ];
  previousRootApproximation = currentRootApproximation;
  appRootsVector = [appRootsVector previousRootApproximation];
  
end
       errorsVector = transpose(errorsVector);
       appRootsVector = transpose(appRootsVector);   % or [appRootsVector]'
       iterationsVector = transpose(iterationsVector); 
       toc;       
       answer = cat(2,iterationsVector,errorsVector,appRootsVector);
       
            