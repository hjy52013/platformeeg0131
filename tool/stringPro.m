% �ú������ڴ����������ַ���
function s = stringPro()
%STRINGPRO Summary of this function goes here
%   Detailed explanation goes here
    
    a = evalin('base','EEG.filePath');
    b = evalin('base','EEG.Fs');
    s = {a;'';b};

end

