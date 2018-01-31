function EEG = readdata(filename)
EEG = emptyEEG();
hdr = ft_read_header(filename);

EEG.Fs        = hdr.Fs;
EEG.nChans    = hdr.nChans;
EEG.nSamples  = hdr.nSamples;
EEG.nTrials   = hdr.nTrials;
EEG.data      = ft_read_data(filename);
EEG.event     = ft_read_event(filename);
return;

% fs = hdr.Fs
% samples = hdr.nSamples
% nchans = hdr.nChans
% nsamplesPre = hdr.nSamplesPre
% ntrials = hdr.nTrials
% label = hdr.label
% chantype = hdr.chantype
% chanunit = hdr.chanunit

