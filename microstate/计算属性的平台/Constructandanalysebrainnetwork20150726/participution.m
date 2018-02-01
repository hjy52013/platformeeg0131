function varargout = participution(varargin)
% PARTICIPUTION M-file for participution.fig
%      PARTICIPUTION, by itself, creates a new PARTICIPUTION or raises the existing
%      singleton*.
%
%      H = PARTICIPUTION returns the handle to a new PARTICIPUTION or the handle to
%      the existing singleton*.
%
%      PARTICIPUTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARTICIPUTION.M with the given input arguments.
%
%      PARTICIPUTION('Property','Value',...) creates a new PARTICIPUTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before participution_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to participution_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help participution

% Last Modified by GUIDE v2.5 04-May-2012 11:33:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @participution_OpeningFcn, ...
                   'gui_OutputFcn',  @participution_OutputFcn, ...
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


% --- Executes just before participution is made visible.
function participution_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to participution (see VARARGIN)

% Choose default command line output for participution
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes participution wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = participution_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function datapathfile_Callback(hObject, eventdata, handles)
% hObject    handle to datapathfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of datapathfile as text
%        str2double(get(hObject,'String')) returns contents of datapathfile as a double


% --- Executes during object creation, after setting all properties.
function datapathfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to datapathfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nodeofmod_Callback(hObject, eventdata, handles)
% hObject    handle to nodeofmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodeofmod as text
%        str2double(get(hObject,'String')) returns contents of nodeofmod as a double


% --- Executes during object creation, after setting all properties.
function nodeofmod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodeofmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nodeofmodfile_Callback(hObject, eventdata, handles)
% hObject    handle to nodeofmodfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nodeofmodfile as text
%        str2double(get(hObject,'String')) returns contents of nodeofmodfile as a double


% --- Executes during object creation, after setting all properties.
function nodeofmodfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodeofmodfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in datapath.
function datapath_Callback(hObject, eventdata, handles)
% hObject    handle to datapath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.datapathfile,'String',directoryname);



% --- Executes on button press in node2.
function node2_Callback(hObject, eventdata, handles)
% hObject    handle to node2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.nodeofmodfile,'String',directoryname);

% --- Executes on button press in result1.
function result1_Callback(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1= get(handles.datapathfile,'String');
if length(str1)<=0;
    errordlg('Datapathfile can not be empty !')
 return;
end
str2 = get(handles.nodeofmod,'String');
str3 =get(handles.nodeofmodfile,'String');
s1 =num2str( get(handles.paticipution1,'Value'));
s2 =num2str( get(handles.Partcipution2,'Value'));
if s1=='1'
   if length(str2)<=0;
    errordlg('nodeofmod can not be empty !')
 return;
end 
   BatNodeDegreeCompute(str1,str2) ;
end
if s2=='1'
    if length(str3)<=0;
    errordlg('nodeofmodfile can not be empty !')
 return;
end
    BatNodeDegreeCompute2(str1,str3);
end
tishi='Task is completed !'
 msgbox(tishi);
