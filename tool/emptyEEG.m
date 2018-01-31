%该函数用于初始化EEG数据
function EEG = emptyEEG()

EEG.Fs = 0;
EEG.nChans = 0;
EEG.nSamples = 0;
EEG.nTrials = 0;
EEG.data = [];
EEG.event = {};

return;