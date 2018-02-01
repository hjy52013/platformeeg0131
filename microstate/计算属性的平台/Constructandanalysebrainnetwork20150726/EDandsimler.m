function varargout = EDandsimler(varargin)
% EDANDSIMLER M-file for EDandsimler.fig
%      EDANDSIMLER, by itself, creates a new EDANDSIMLER or raises the existing
%      singleton*.
%
%      H = EDANDSIMLER returns the handle to a new EDANDSIMLER or the handle to
%      the existing singleton*.
%
%      EDANDSIMLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDANDSIMLER.M with the given input arguments.
%
%      EDANDSIMLER('Property','Value',...) creates a new EDANDSIMLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EDandsimler_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EDandsimler_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EDandsimler

% Last Modified by GUIDE v2.5 24-Jan-2015 18:18:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EDandsimler_OpeningFcn, ...
                   'gui_OutputFcn',  @EDandsimler_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EDandsimler is made visible.
function EDandsimler_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EDandsimler (see VARARGIN)

% Choose default command line output for EDandsimler
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EDandsimler wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EDandsimler_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_fin.
function pushbutton_fin_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_fin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf)


function edit_inpu_Callback(hObject, eventdata, handles)
% hObject    handle to edit_inpu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_inpu as text
%        str2double(get(hObject,'String')) returns contents of edit_inpu as a double


% --- Executes during object creation, after setting all properties.
function edit_inpu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_inpu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_out_Callback(hObject, eventdata, handles)
% hObject    handle to edit_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_out as text
%        str2double(get(hObject,'String')) returns contents of edit_out as a double


% --- Executes during object creation, after setting all properties.
function edit_out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_num_Callback(hObject, eventdata, handles)
% hObject    handle to edit_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_num as text
%        str2double(get(hObject,'String')) returns contents of edit_num as a double


% --- Executes during object creation, after setting all properties.
function edit_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in in_pushbutton.
function in_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to in_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_inpu,'String',directoryname);

% --- Executes on button press in out_pushbutton.
function out_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to out_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_out,'String',directoryname);

% --- Executes on button press in pushbutton_sim.
function pushbutton_sim_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath1 = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
num=str2num(number);
if length(inputdatapath)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath1)<=0;
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    errordlg('Number of ROIs can not be empty !')
 return;
 end
 
  %计算共同邻居CN
 
 outputdatapath=strcat(outputdatapath1,'\CN');
 cn =num2str( get(handles.checkbox_cn,'Value'));
 if cn=='1'
     mkdir(strcat(outputdatapath1,'\CN'));
     cosimler(inputdatapath,outputdatapath,num);
 end
 
 %功能： 计算AA指标并返回相似度矩阵
 
 outputdatapath=strcat(outputdatapath1,'\AA');
 aa=num2str( get(handles.checkbox_AA,'Value'));
 if aa=='1'
     mkdir(strcat(outputdatapath1,'\AA'));
 coAA(inputdatapath,outputdatapath,num);
 end
 
 %功能： 计算ACT指标并返回相似度矩阵
 
 outputdatapath=strcat(outputdatapath1,'\ACT');
 act=num2str( get(handles.checkbox_ACT,'Value'));
 if act=='1'
     mkdir(strcat(outputdatapath1,'\ACT'));
   coACT(inputdatapath,outputdatapath,num)
 end
 
%功能： 计算CosPlus指标并返回相似度矩阵
 
 outputdatapath=strcat(outputdatapath1,'\CosPlus');
CosPlus=num2str( get(handles.checkbox_CosPlus,'Value'));
if CosPlus=='1'
    mkdir(strcat(outputdatapath1,'\CosPlus'));
    pro='Cos';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算HDI指标并返回相似度矩阵

 outputdatapath=strcat(outputdatapath1,'\HDI');
HDI=num2str( get(handles.checkbox_HDI,'Value'));
if HDI=='1'
    mkdir(strcat(outputdatapath1,'\HDI'));
    pro='HDI';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算HPI指标并返回相似度矩阵

outputdatapath=strcat(outputdatapath1,'\HPI');
HPI=num2str( get(handles.checkbox_HPI,'Value'));
if HPI=='1'
    mkdir(strcat(outputdatapath1,'\HPI'));
    pro='HPI';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算jaccard指标并返回相似度矩阵

outputdatapath=strcat(outputdatapath1,'\jaccard');
jaccard=num2str( get(handles.checkbox_jaccard,'Value'));
if jaccard=='1'
    mkdir(strcat(outputdatapath1,'\jaccard'));
    pro='jac';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算katz0.01指标并返回相似度矩阵

outputdatapath=strcat(outputdatapath1,'\katz0.01');
katz1=num2str( get(handles.checkbox8,'Value'));
if katz1=='1'
    mkdir(strcat(outputdatapath1,'\katz0.01'));
    pro='ka1';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算katz0.001指标并返回相似度矩阵

outputdatapath=strcat(outputdatapath1,'\katz0.001');
katz2=num2str( get(handles.checkbox9,'Value'));
if katz2=='1'
    mkdir(strcat(outputdatapath1,'\katz0.001'));
    pro='ka2';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算LHN1指标并返回相似度矩阵

outputdatapath=strcat(outputdatapath1,'\LHN1');
LHN1=num2str( get(handles.checkbox_LHN1,'Value'));
if LHN1=='1'
    mkdir(strcat(outputdatapath1,'\LHN1'));
    pro='LHN';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算LHNII0.9指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\LHNII0.9');
LHNII1=num2str( get(handles.checkbox11,'Value'));
if LHNII1=='1'
    mkdir(strcat(outputdatapath1,'\LHNII0.9'));
    pro='LH0';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算LHNII0.95指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\LHNII0.95');
LHNII2=num2str( get(handles.checkbox12,'Value'));
if LHNII2=='1'
    mkdir(strcat(outputdatapath1,'\LHNII0.9'));
    pro='LH5';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算LHNII0.99指标并返回相似矩阵
outputdatapath=strcat(outputdatapath1,'\LHNII0.99');
LHNII3=num2str( get(handles.checkbox13,'Value'));
if LHNII3=='1'
    mkdir(strcat(outputdatapath1,'\LHNII0.99'));
    pro='LH9';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算局部朴素贝叶斯模型性AA指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\LNBAA');
LNBAA=num2str( get(handles.checkbox_LNBAA,'Value'));
if LNBAA=='1'
    mkdir(strcat(outputdatapath1,'\LNBAA'));
    pro='LNB';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算局部朴素贝叶斯模型性CN指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\LNBCN');
LNBCN=num2str( get(handles.checkbox_LNBCN,'Value'));
if LNBCN=='1'
    mkdir(strcat(outputdatapath1,'\LNBCN'));
    pro='LNC';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算局部朴素贝叶斯模型性RA指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\LNBRA');
LNBRA=num2str( get(handles.checkbox_LNBRA,'Value'));
if LNBRA=='1'
    mkdir(strcat(outputdatapath1,'\LNBRA'));
    pro='LNR';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算LP指标并返回相似度矩阵,第二参数取0.0001
outputdatapath=strcat(outputdatapath1,'\LP');
LP=num2str( get(handles.checkbox_LP,'Value'));
if LP=='1'
    mkdir(strcat(outputdatapath1,'\LP'));
    pro='Loc';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算MFI指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\MFI');
MFI=num2str( get(handles.checkbox_MFI,'Value'));
if MFI=='1'
    mkdir(strcat(outputdatapath1,'\MFI'));
    pro='MFI';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算PA指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\PA');
PA=num2str( get(handles.checkbox_PA,'Value'));
if PA=='1'
    mkdir(strcat(outputdatapath1,'\PA'));
    pro='PA1';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算RWR0.85指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\RWR0.85');
RWR1=num2str( get(handles.checkbox20,'Value'));
if RWR1=='1'
    mkdir(strcat(outputdatapath1,'\RWR0.85'));
    pro='RWR';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算RWR0.95指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\RWR0.95');
RWR2=num2str( get(handles.checkbox21,'Value'));
if RWR2=='1'
    mkdir(strcat(outputdatapath1,'\RWR0.95'));
    pro='RW9';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

%功能： 计算Salton指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\Salton');
Salton=num2str( get(handles.checkbox_Salton,'Value'));
if Salton=='1'
    mkdir(strcat(outputdatapath1,'\Salton'));
    pro='Sal';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算SimRank指标并返回相似度矩阵,第二参数取0.8

outputdatapath=strcat(outputdatapath1,'\SimRank');
SimRank=num2str( get(handles.checkbox_SimRank,'Value'));
if SimRank=='1'
    mkdir(strcat(outputdatapath1,'\SimRank'));
    pro='Sim';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算Sorenson指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\Sorenson');
Sorenson=num2str( get(handles.checkbox_Sorenson,'Value'));
if Sorenson=='1'
    mkdir(strcat(outputdatapath1,'\Sorenson'));
    pro='Sor';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 功能：计算TSCN指标并返回相似矩阵,第二参数取0.01

outputdatapath=strcat(outputdatapath1,'\TSCN');
TSCN=num2str( get(handles.checkbox_TSCN,'Value'));
if TSCN=='1'
    mkdir(strcat(outputdatapath1,'\TSCN'));
    pro='TSC';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end

% 计算RA指标并返回相似矩阵

outputdatapath=strcat(outputdatapath1,'\RA');
RA=num2str( get(handles.checkbox_RA,'Value'));
if RA=='1'
    mkdir(strcat(outputdatapath1,'\RA'));
    pro='RA1';
    co_pro_simler(inputdatapath,outputdatapath,num,pro)
end




function input_edit_Callback(hObject, eventdata, handles)
% hObject    handle to input_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_edit as text
%        str2double(get(hObject,'String')) returns contents of input_edit as a double


% --- Executes during object creation, after setting all properties.
function input_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_input.
function pushbutton_input_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.input_edit,'String',directoryname);


function out_edit_Callback(hObject, eventdata, handles)
% hObject    handle to out_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out_edit as text
%        str2double(get(hObject,'String')) returns contents of out_edit as a double


% --- Executes during object creation, after setting all properties.
function out_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_out.
function pushbutton_out_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.out_edit,'String',directoryname);

% --- Executes on button press in pushbutton_edcal.
function pushbutton_edcal_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_edcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
nodefile =get(handles.input_edit,'String');
outpath = get(handles.out_edit,'String');
number = get(handles.num_edit,'String');
if length(nodefile)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outpath)<=0;
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    errordlg('Number of ROIs can not be empty !')
 return;
 end
 nodeED(nodefile,number,outpath)


function num_edit_Callback(hObject, eventdata, handles)
% hObject    handle to num_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_edit as text
%        str2double(get(hObject,'String')) returns contents of num_edit as a double


% --- Executes during object creation, after setting all properties.
function num_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_cn.
function checkbox_cn_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_cn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_cn,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_cn,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_cn,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_cn


% --- Executes on button press in checkbox_AA.
function checkbox_AA_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_AA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_AA,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_AA,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_AA,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_AA


% --- Executes on button press in checkbox_ACT.
function checkbox_ACT_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_ACT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_ACT,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_ACT,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_ACT,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_ACT


% --- Executes on button press in checkbox_CosPlus.
function checkbox_CosPlus_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_CosPlus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_CosPlus,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_CosPlus,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_CosPlus,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_CosPlus


% --- Executes on button press in checkbox_HDI.
function checkbox_HDI_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_HDI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_HDI,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_HDI,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_HDI,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_HDI


% --- Executes on button press in checkbox_HPI.
function checkbox_HPI_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_HPI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_HPI,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_HPI,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_HPI,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_HPI


% --- Executes on button press in checkbox_jaccard.
function checkbox_jaccard_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_jaccard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_jaccard,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_jaccard,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_jaccard,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_jaccard


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox8,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox8,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox8,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox9,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox9,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox9,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox_LHN1.
function checkbox_LHN1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_LHN1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_LHN1,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_LHN1,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_LHN1,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_LHN1


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox11,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox11,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox11,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox12,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox12,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox12,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox13,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox13,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox13,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox13


% --- Executes on button press in checkbox_LNBAA.
function checkbox_LNBAA_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_LNBAA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_LNBAA,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_LNBAA,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_LNBAA,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_LNBAA


% --- Executes on button press in checkbox_LNBCN.
function checkbox_LNBCN_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_LNBCN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_LNBCN,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_LNBCN,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_LNBCN,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_LNBCN


% --- Executes on button press in checkbox_LNBRA.
function checkbox_LNBRA_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_LNBRA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_LNBRA,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_LNBRA,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_LNBRA,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_LNBRA


% --- Executes on button press in checkbox_LP.
function checkbox_LP_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_LP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_LP,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_LP,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_LP,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_LP


% --- Executes on button press in checkbox_MFI.
function checkbox_MFI_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_MFI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_MFI,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_MFI,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_MFI,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_MFI


% --- Executes on button press in checkbox_PA.
function checkbox_PA_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_PA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_PA,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_PA,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_PA,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_PA


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox20,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox20,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox20,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox20


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox21,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox21,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox21,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox21


% --- Executes on button press in checkbox_Salton.
function checkbox_Salton_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Salton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_Salton,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_Salton,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_Salton,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_Salton


% --- Executes on button press in checkbox_SimRank.
function checkbox_SimRank_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SimRank (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_SimRank,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_SimRank,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_SimRank,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_SimRank


% --- Executes on button press in checkbox_Sorenson.
function checkbox_Sorenson_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Sorenson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_Sorenson,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_Sorenson,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_Sorenson,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_Sorenson


% --- Executes on button press in checkbox_TSCN.
function checkbox_TSCN_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_TSCN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_TSCN,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_TSCN,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_TSCN,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_TSCN


% --- Executes on button press in checkbox_RA.
function checkbox_RA_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_RA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputdatapath = get(handles.edit_inpu,'String');
outputdatapath = get(handles.edit_out,'String');
number = get(handles.edit_num,'String');
if length(inputdatapath)<=0;
    set(handles.checkbox_RA,'Value',0)
    errordlg('Input parameters Path can not be empty !')
 return;
end
if length(outputdatapath)<=0;
    set(handles.checkbox_RA,'Value',0)
    errordlg('Outdata Path can not be empty !')
 return;
end
 if length(number)<=0;
    set(handles.checkbox_RA,'Value',0)
    errordlg('Number of ROIs can not be empty !')
 return;
 end
% Hint: get(hObject,'Value') returns toggle state of checkbox_RA
