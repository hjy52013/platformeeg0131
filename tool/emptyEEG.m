%�ú������ڳ�ʼ��EEG����
function EEG = emptyEEG()

EEG.Fs = 0;
EEG.nChans = 0;
EEG.nSamples = 0;
EEG.nTrials = 0;
EEG.data = [];
EEG.event = {};

return;