% 该函数用于处理主界面字符串
function s = stringPro()
%STRINGPRO Summary of this function goes here
%   Detailed explanation goes here
    
    a = evalin('base','EEG.filePath');
    b = evalin('base','EEG.Fs');
    s = {a;'';b};

end

