function varargout = Maxdifferentmodel(varargin)
% MAXDIFFERENTMODEL M-file for Maxdifferentmodel.fig
%      MAXDIFFERENTMODEL, by itself, creates a new MAXDIFFERENTMODEL or raises the existing
%      singleton*.
%
%      H = MAXDIFFERENTMODEL returns the handle to a new MAXDIFFERENTMODEL or the handle to
%      the existing singleton*.
%
%      MAXDIFFERENTMODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAXDIFFERENTMODEL.M with the given input arguments.
%
%      MAXDIFFERENTMODEL('Property','Value',...) creates a new MAXDIFFERENTMODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Maxdifferentmodel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Maxdifferentmodel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Maxdifferentmodel

% Last Modified by GUIDE v2.5 06-Jun-2014 12:43:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Maxdifferentmodel_OpeningFcn, ...
                   'gui_OutputFcn',  @Maxdifferentmodel_OutputFcn, ...
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


% --- Executes just before Maxdifferentmodel is made visible.
function Maxdifferentmodel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Maxdifferentmodel (see VARARGIN)

% Choose default command line output for Maxdifferentmodel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Maxdifferentmodel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Maxdifferentmodel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_input_Callback(hObject, eventdata, handles)
% hObject    handle to edit_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_input as text
%        str2double(get(hObject,'String')) returns contents of edit_input as a double


% --- Executes during object creation, after setting all properties.
function edit_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_input (see GCBO)
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
set(handles.edit_input,'String',directoryname);


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


function edit_sfn_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sfn as text
%        str2double(get(hObject,'String')) returns contents of edit_sfn as a double


% --- Executes during object creation, after setting all properties.
function edit_sfn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_snum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_snum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_snum as text
%        str2double(get(hObject,'String')) returns contents of edit_snum as a double


% --- Executes during object creation, after setting all properties.
function edit_snum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_snum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit_subnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_subnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_subnum as text
%        str2double(get(hObject,'String')) returns contents of edit_subnum as a double


% --- Executes during object creation, after setting all properties.
function edit_subnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_subnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_cal.
function pushbutton_cal_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_input,'String');
if length(oinputdata)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
sparsityfilename=get(handles.edit_sfn,'String');
if length(sparsityfilename)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
sparsitynumber1=get(handles.edit_snum,'String');
if length(sparsitynumber1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
sparsitynumber=str2num(sparsitynumber1);
Parameternumber1=get(handles.edit_pnum,'String');
if length(Parameternumber1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
Parameternumber=str2num(Parameternumber1);
subjectnumber1=get(handles.edit_subnum,'String');
if length(subjectnumber1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
subjectnumber=str2num(subjectnumber1);
first1= get(handles.edit_sf,'String');
if length(first1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
first=str2num(first1);
last1= get(handles.edit_sl,'String');
if length(last1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
last=str2num(last1);
step1= get(handles.edit_ss,'String');
if length(step1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
step=str2num(step1);
outputdata=ooutput;
AUC_diferent(oinputdata,outputdata,sparsitynumber,sparsityfilename,'assortativity',first,last,step,Parameternumber,subjectnumber);
AUC_diferent(oinputdata,outputdata,sparsitynumber,sparsityfilename,'Cluster cofficient',first,last,step,Parameternumber,subjectnumber);
AUC_diferent(oinputdata,outputdata,sparsitynumber,sparsityfilename,'Global efficiency',first,last,step,Parameternumber,subjectnumber);
AUC_diferent(oinputdata,outputdata,sparsitynumber,sparsityfilename,'local efficiency',first,last,step,Parameternumber,subjectnumber);
AUC_diferent(oinputdata,outputdata,sparsitynumber,sparsityfilename,'shortpath',first,last,step,Parameternumber,subjectnumber);

% --- Executes on button press in pushbutton_finish.
function pushbutton_finish_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf)



function edit_sf_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sf as text
%        str2double(get(hObject,'String')) returns contents of edit_sf as a double


% --- Executes during object creation, after setting all properties.
function edit_sf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ss_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ss as text
%        str2double(get(hObject,'String')) returns contents of edit_ss as a double


% --- Executes during object creation, after setting all properties.
function edit_ss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sl as text
%        str2double(get(hObject,'String')) returns contents of edit_sl as a double


% --- Executes during object creation, after setting all properties.
function edit_sl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_max.
function pushbutton_max_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_input,'String');
if length(oinputdata)<=0;
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
 E_value(oinputdata,ooutput,Parameternumber);
