function answer  = Secant(firstGuess,secondGuess,polynomial,maxIterations,predefinedError)
%Calculates the root of polynomial with the given parameters using Secant methods


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
%fplot (fh,[lowerBound,upperBound]) ---> needs limits for plotting the
%functions
grid on
previousRootApproximation = firstGuess;
beforePreviousRootApproximation = secondGuess;
while error>predefinedError && iterations<maxIterations
  
  formulaNumerator = fh(previousRootApproximation)*(beforePreviousRootApproximation-previousRootApproximation);
  formulaDenominator = fh(beforePreviousRootApproximation)-fh(previousRootApproximation);
  
  currentRootApproximation = previousRootApproximation  - formulaNumerator/formulaDenominator;
  
  %disp(fh(currentRootApproximation))
  iterations = iterations+1;
  iterationsVector = [iterationsVector iterations];
  error = abs(currentRootApproximation-previousRootApproximation);
  errorsVector = [errorsVector error ];
  previousRootApproximation = currentRootApproximation;
  appRootsVector = [appRootsVector previousRootApproximation];
  
end
       errorsVector = transpose(errorsVector);
       appRootsVector = transpose(appRootsVector);   % or [appRootsVector]'
       iterationsVector = transpose(iterationsVector); 
       time = toc;
       %fid = fopen('Results.txt','w')
       %fprintf(fid,'%f\n',a)
       %fprintf('%f\t\t%f\t\t%f\t\t\n\n', [iterationsVector,errorsVector,appRootsVector],]')
       %fprintf('%f',time);
       answer = cat(2,iterationsVector,errorsVector,appRootsVector);
