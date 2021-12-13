%%Initialize
clear;
clc;
load("R_005_930_complete");

train_x = Config;
train_y = U;

nftool;

%Test for    8 is a bit weaker
%           10(is really good)
%          100(can make good pred. but I'm sus)
%         1000(takes a long time and is overfitted)