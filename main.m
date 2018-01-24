addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/CB');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/CS');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/GT');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/PV');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/SR');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/TB');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/WB');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/RG');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/SC');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/HT');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/MD');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/TC');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/SS');
addpath('/home/matheus/Algoritmos/ITGO_ENG/Functions/GKLS');

format long

warning('off','all')




id = 'GKLS';

ffs = [];
iter = 25;

maxFEs = 100000;



popSizes = [10, 3];
K = [3, 1];
prob = 0.5;
phi = 0.5;

matR = dlmread('test4.txt');






[minF meanF maxF devF viol mFEs] = execute(id, popSizes, K, prob, phi, maxFEs, iter, matR);
