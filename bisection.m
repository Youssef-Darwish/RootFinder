function answer  = bisection(lowerBound,upperBound,polynomial,maxIterations,predefinedError)
%Calculates the root of polynomial with the given parameters using bisection methods

disp(predefinedError)

%using tic;toc; to calculate the elapsed time;
tic;

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
fplot (fh,[lowerBound,upperBound])
grid on
while error>predefinedError && iterations<maxIterations
  
  currentRootApproximation = (lowerBound + upperBound)/2;
  
  checkFunction = fh(currentRootApproximation)*fh(lowerBound);
  %disp(fh(currentRootApproximation))
  if (checkFunction <0)
    upperBound = currentRootApproximation;
  elseif (checkFunction >0)
    lowerBound = currentRootApproximation;
  elseif (checkFunction ==0)
    break
  end
  iterations = iterations+1;
  iterationsVector = [iterationsVector iterations];
  error = (currentRootApproximation-previousRootApproximation)/currentRootApproximation;
  error = abs(error *100);
  errorsVector = [errorsVector error ];
  previousRootApproximation = currentRootApproximation;
  appRootsVector = [appRootsVector previousRootApproximation];
  
end
       errorsVector = transpose(errorsVector);
       appRootsVector = transpose(appRootsVector);   % or [appRootsVector]'
       iterationsVector = transpose(iterationsVector); 
       toc;
       
       answer = cat(2,iterationsVector,errorsVector,appRootsVector);