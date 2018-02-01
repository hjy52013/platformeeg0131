%clear;
eeglab;
EEG = pop_loadset('filename','1001.set','filepath','E:\\ԭʼ����\\��һ�δ���\\����\\');
EEG = eeg_checkset( EEG );
figure;
topoplot([],EEG.chanlocs, 'style', 'blank',  'electrodes', 'numpoint', 'chaninfo', EEG.chaninfo);
data=importdata('E:\ʵ������\������10��\network\attribute_entirety\Intercepted\patient\encoding\alpha\percentage\BsortPLV_10\BSort30.mat');%������ʽΪ����
loc_file=EEG.chanlocs;
[tmpeloc labels Th Rd indices] = readlocs( loc_file );
Th = pi/180*Th;                              % convert degrees to radians
[x,y]     = pol2cart(Th,Rd);
rmax=0.5;
plotrad=0.5438;
squeezefac = rmax/plotrad;
x    = x*squeezefac;    
y    = y*squeezefac;   
hold on;

num=length(data);

%num=length(data_com);
data1=data;
 for i=1:num
     plot([y(data1(i,1)),y(data1(i,2))],[x(data1(i,1)),x(data1(i,2))]);
 end
%for i=1:num
   % plot([y(data1(i,1)),y(data1(i,2))],[x(data1(i,1)),x(data1(i,2))]);
%   plot([y(data_com(i,1)),y(data_com(i,2))],[x(data_com(i,1)),x(data_com(i,2))]);
%end