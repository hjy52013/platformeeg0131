function varargout = normalized(varargin)
% NORMALIZED M-file for normalized.fig
%      NORMALIZED, by itself, creates a new NORMALIZED or raises the existing
%      singleton*.
%
%      H = NORMALIZED returns the handle to a new NORMALIZED or the handle to
%      the existing singleton*.
%
%      NORMALIZED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NORMALIZED.M with the given input arguments.
%
%      NORMALIZED('Property','Value',...) creates a new NORMALIZED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before normalized_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to normalized_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help normalized

% Last Modified by GUIDE v2.5 07-Jun-2014 21:24:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @normalized_OpeningFcn, ...
                   'gui_OutputFcn',  @normalized_OutputFcn, ...
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


% --- Executes just before normalized is made visible.
function normalized_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to normalized (see VARARGIN)

% Choose default command line output for normalized
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes normalized wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = normalized_OutputFcn(hObject, eventdata, handles) 
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


function edit_fname_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fname as text
%        str2double(get(hObject,'String')) returns contents of edit_fname as a double


% --- Executes during object creation, after setting all properties.
function edit_fname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_normalized.
function pushbutton_normalized_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_normalized (see GCBO)
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
filename=get(handles.edit_fname,'String');
if length(filename)<=0;
    errordlg('Parameters can not be empty !')
    return;
end
pfirst1= get(handles.edit_sf,'String');
if length(pfirst1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pfirst=str2num(pfirst1);
plast1= get(handles.edit_sl,'String');
if length(plast1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
plast=str2num(plast1);
pstep1= get(handles.edit_ss,'String');
if length(pstep1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pstep=str2num(pstep1);
guiyi(oinputdata,ooutput,filename,pfirst,plast,pstep);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
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
