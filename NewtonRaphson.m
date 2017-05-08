function answer  = NewtonRaphson(initialGuess,polynomial,maxIterations,predefinedError)
%Calculates the root of polynomial with the given parameters using NewtonRaphson methods


%using tic;toc; to calculate the elapsed time;
tic;

variable = '@(x)';
str = strcat(variable,polynomial);
fh = str2func(str);

derivative = diff(fh,x);
derivative(0.2)
%initializing empty vectors to hold results
errorsVector = [];
iterationsVector=[];
appRootsVector=[];
error = 100;
iterations = 0;
%fplot (fh,[lowerBound,upperBound]) ---> needs limits for plotting the
%functions
%grid on
previousRootApproximation = initialGuess;
currentRootApproximation=0;
while error>predefinedError && iterations<maxIterations
  
    
   
  currentRootApproximation = previousRootApproximation  - (fh(previousRootApproximation)/derivative(currentRootApproximation));
  
  %disp(fh(currentRootApproximation))
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
       %fid = fopen('MyFile.txt','w')
       %fprintf(fid,'%f\n',a)
       %fprintf('%8.2f %8.3f\n', [velocity,distance]')
       
       answer = cat(2,iterationsVector,errorsVector,appRootsVector);
