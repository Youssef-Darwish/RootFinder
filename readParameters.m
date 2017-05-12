% reads different paramters for methods in part one in condition they have
% a string before each paramter expressing what it is ---->look txt file
% "inputParamtersTrial.txt"
function [lowerBound,upperBound,polynomial,maxIterations,error]=readParameters(fileName)
[lowerBound,upperBound,polynomial,maxIterations,error] = textread(fileName,'lowerBound%f upperBound%f polynomial%s maxIterations%d error%f', 1);
end