clear;clc; warning('off');
paths = genpath('./');
addpath(paths);

srcPath = '../../datasets/MediaMill/Reduce/group1_vision.mat'; % dataset path
load(srcPath); % X_train: NxD Y_train: NxC
optmParam.mu1 = 1e3;
optmParam.mu2 = 1e3;
optmParam.rho1 = 1.1;
optmParam.rho2 = 1.1;
optmParam.alpha = 5;
optmParam.beta = 1;
optmParam.eta = 50;
optmParam.lambda = 50;
optmParam.maxIter = 10;

[AP, CO, RL, OE, HL] = DLRSF(optmParam, X_train, Y_train, X_test, Y_test); 
rmpath(paths);

