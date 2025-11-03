function [approximateIntegral] = rectangulo_medio(f,a,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

approximateIntegral = f((a + b) / 2) * (b - a)

end