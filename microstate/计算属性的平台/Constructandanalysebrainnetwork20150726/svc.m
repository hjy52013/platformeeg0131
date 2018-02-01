function varargout = svc(varargin)
% SVC M-file for SVC.fig
%      SVC, by itself, creates a new SVC or raises the existing
%      singleton*.
%
%      H = SVC returns the handle to a new SVC or the handle to
%      the existing singleton*.
%
%      SVC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SVC.M with the given input arguments.
%
%      SVC('Property','Value',...) creates a new SVC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SVC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SVC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SVC

% Last Modified by GUIDE v2.5 07-Jun-2014 20:36:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SVC_OpeningFcn, ...
                   'gui_OutputFcn',  @SVC_OutputFcn, ...
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


% --- Executes just before SVC is made visible.
function SVC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SVC (see VARARGIN)

% Choose default command line output for SVC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SVC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SVC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_intput_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intput as text
%        str2double(get(hObject,'String')) returns contents of edit_intput as a double


% --- Executes during object creation, after setting all properties.
function edit_intput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_intput.
function pushbutton_intput_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_intput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_intput,'String',directoryname);


function edit_in_Callback(hObject, eventdata, handles)
% hObject    handle to edit_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_in as text
%        str2double(get(hObject,'String')) returns contents of edit_in as a double


% --- Executes during object creation, after setting all properties.
function edit_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_in.
function pushbutton_in_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_in,'String',directoryname);


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


% --- Executes on button press in pushbutton_out.
function pushbutton_out_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_out,'String',directoryname);


function edit_pnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pnum as text
%        str2double(get(hObject,'String')) returns contents of edit_pnum as a double


% --- Executes during object creation, after setting all properties.
function edit_pnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_s1num_Callback(hObject, eventdata, handles)
% hObject    handle to edit_s1num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_s1num as text
%        str2double(get(hObject,'String')) returns contents of edit_s1num as a double


% --- Executes during object creation, after setting all properties.
function edit_s1num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_s1num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_s2num_Callback(hObject, eventdata, handles)
% hObject    handle to edit_s2num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_s2num as text
%        str2double(get(hObject,'String')) returns contents of edit_s2num as a double


% --- Executes during object creation, after setting all properties.
function edit_s2num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_s2num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_filename_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filename as text
%        str2double(get(hObject,'String')) returns contents of edit_filename as a double


% --- Executes during object creation, after setting all properties.
function edit_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_svm_Callback(hObject, eventdata, handles)
% hObject    handle to edit_svm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_svm as text
%        str2double(get(hObject,'String')) returns contents of edit_svm as a double


% --- Executes during object creation, after setting all properties.
function edit_svm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_svm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_SVM.
function pushbutton_SVM_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_SVM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata1=get(handles.edit_intput,'String');
if length(oinputdata1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
oinputdata2=get(handles.edit_in,'String');
if length(oinputdata2)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
Parameternumber1=get(handles.edit_pnum,'String');
if length(Parameternumber1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
Parameternumber=str2num(Parameternumber1);
testnumber1=get(handles.edit_testnum,'String');
if length(testnumber1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
testnumber=str2num(testnumber1);
subjectnumber11=get(handles.edit_s1num,'String');
if length(subjectnumber11)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
subjectnumber1=str2num(subjectnumber11);
subjectnumber12=get(handles.edit_s2num,'String');
if length(subjectnumber12)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
subjectnumber2=str2num(subjectnumber12);
svmnumber1=get(handles.edit_svm,'String');
if length(svmnumber1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
svmnumber=str2num(svmnumber1);
mkdir(strcat(ooutput,'\geshizhengli1'));
mkdir(strcat(ooutput,'\geshizhengli2'));
output1=strcat(ooutput,'\geshizhengli1');
All_Breake(oinputdata1,output1,Parameternumber);
output2=strcat(ooutput,'\geshizhengli2');
All_Breake(oinputdata2,output2,Parameternumber);
mkdir(strcat(ooutput,'\beforeSVM'));
outbeforesvm=strcat(ooutput,'\beforeSVM');
Attribute_classisy(output1,output2,outbeforesvm,subjectnumber1,subjectnumber2,Parameternumber,5);
SVC (outbeforesvm,ooutput,Parameternumber,svmnumber,'Att_Classfy',subjectnumber1,subjectnumber2,testnumber);





% --- Executes on button press in pushbutton_finish.
function pushbutton_finish_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf)



function edit_testnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_testnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_testnum as text
%        str2double(get(hObject,'String')) returns contents of edit_testnum as a double


% --- Executes during object creation, after setting all properties.
function edit_testnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_testnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
