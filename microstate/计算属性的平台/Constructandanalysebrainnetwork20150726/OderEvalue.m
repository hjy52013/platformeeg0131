function varargout = OderEvalue(varargin)
% ODEREVALUE M-file for OderEvalue.fig
%      ODEREVALUE, by itself, creates a new ODEREVALUE or raises the existing
%      singleton*.
%
%      H = ODEREVALUE returns the handle to a new ODEREVALUE or the handle to
%      the existing singleton*.
%
%      ODEREVALUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ODEREVALUE.M with the given input arguments.
%
%      ODEREVALUE('Property','Value',...) creates a new ODEREVALUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OderEvalue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OderEvalue_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OderEvalue

% Last Modified by GUIDE v2.5 07-Jun-2014 20:59:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OderEvalue_OpeningFcn, ...
                   'gui_OutputFcn',  @OderEvalue_OutputFcn, ...
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


% --- Executes just before OderEvalue is made visible.
function OderEvalue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OderEvalue (see VARARGIN)

% Choose default command line output for OderEvalue
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OderEvalue wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OderEvalue_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton_input.
function pushbutton_input_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_input (see GCBO)
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



function edit_punm_Callback(hObject, eventdata, handles)
% hObject    handle to edit_punm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_punm as text
%        str2double(get(hObject,'String')) returns contents of edit_punm as a double


% --- Executes during object creation, after setting all properties.
function edit_punm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_punm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_order.
function pushbutton_order_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_order (see GCBO)
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
Parameternumber1=get(handles.edit_punm,'String');
if length(Parameternumber1)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
Parameternumber=str2num(Parameternumber1);
pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pfirst=str2num(pfirst1);
plast1= get(handles.edit_pl,'String');
if length(plast1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
plast=str2num(plast1);
pstep1= get(handles.edit_ps,'String');
if length(pstep1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pstep=str2num(pstep1);
paixu(oinputdata,ooutput,Parameternumber,pfirst,pstep);

% --- Executes on button press in pushbutton_finish.
function pushbutton_finish_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf)


function edit_pf_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pf as text
%        str2double(get(hObject,'String')) returns contents of edit_pf as a double


% --- Executes during object creation, after setting all properties.
function edit_pf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ps_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ps as text
%        str2double(get(hObject,'String')) returns contents of edit_ps as a double


% --- Executes during object creation, after setting all properties.
function edit_ps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pl as text
%        str2double(get(hObject,'String')) returns contents of edit_pl as a double


% --- Executes during object creation, after setting all properties.
function edit_pl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
