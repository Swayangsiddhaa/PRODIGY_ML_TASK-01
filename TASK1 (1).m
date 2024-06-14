%Step1(Clear all workspace and close all figures).
clear all;
close all;
format longG;

% Step2 (Download the dataset from a URL)
% Modify the URL to point to the raw content of the file on GitHub
dataset_url = "https://raw.githubusercontent.com/Swayangsiddhaa/PRODIGY_ML_TASK-01/main/Housing(price%20prediction).csv"; 
output_file = "Housing(price prediction).csv";
websave(output_file, dataset_url);

% Step3(Initialization of data by importing from the downloaded dataset).
Data = readtable(output_file);

%Step4(Initialization of data [x1 for squarefootage] , [x2 for bedrooms] ,
%[x3 for bathrooms] , [y for price] , [y_predictprice for predicted
%prices]).
x1 = Data.Squarefootage;
x2 = Data.bedrooms;
x3 = Data.bathrooms;
y = Data.price;

%No: of observation.
n = length(x1);

% Matrix formation.
a  = [ones(n,1) x1 x2 x3];

%Calculation of Regression Coefficients.
c = pinv(a) * y;
disp("The regression coefficients are:");
disp(c)

%Calculation of Predicted prices.
y_predictprice = a * c;
disp("The predict prices are:");
disp(y_predictprice)

%Graph plot of Squarearea vs Price.
figure;
scatter(x1, y, 'filled');
xlabel('Squarefootage');
ylabel('Predicted Price');
title('Squarefootage vs Predicted Price');
hold off;  

%Graph plot of Bedroom vs Price
figure;
scatter(x2, y, 'filled');
xlabel('Bedroom');
ylabel('Predicted Price');
title('Bedroom vs Predicted Price');
hold off;

%Graph plot of Bathroom vs Price
figure;
scatter(x3, y, 'filled');
xlabel('Bathroom');
ylabel('Predicted Price');
title('Bathroom vs Predicted Price');
hold off;