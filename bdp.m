% add path
bdppath = which('bdp.m');
bdppath = bdppath(1:end-length('bdp.m'));
addpath(strcat(bdppath,'pretreat'));
addpath(strcat(bdppath,'signalanalysis'));
addpath(strcat(bdppath,'view'));
addpath(strcat(bdppath,'fileio'));
addpath(strcat(bdppath,'tool'));
main;