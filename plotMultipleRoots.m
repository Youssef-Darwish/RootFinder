function plotMultipleRoots(roots)
n = size(roots,1);
m = size(roots,2);
iter = [1:m];
for  i = 1:n
    figure
    plot(iter,roots(i,1:end));
    title(strcat('x',i+'0'));
    xlabel('iterations');
    ylabel('root');
end
end