function varargout = ReadTimeCourse(varargin)
% READTIMECOURSE M-file for ReadTimeCourse.fig
%      READTIMECOURSE, by itself, creates a new READTIMECOURSE or raises the existing
%      singleton*.
%
%      H = READTIMECOURSE returns the handle to a new READTIMECOURSE or the handle to
%      the existing singleton*.
%
%      READTIMECOURSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in READTIMECOURSE.M with the given input arguments.
%
%      READTIMECOURSE('Property','Value',...) creates a new READTIMECOURSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReadTimeCourse_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReadTimeCourse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReadTimeCourse

% Last Modified by GUIDE v2.5 06-Mar-2013 13:20:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReadTimeCourse_OpeningFcn, ...
                   'gui_OutputFcn',  @ReadTimeCourse_OutputFcn, ...
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


% --- Executes just before ReadTimeCourse is made visible.
function ReadTimeCourse_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReadTimeCourse (see VARARGIN)

% Choose default command line output for ReadTimeCourse
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ReadTimeCourse wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ReadTimeCourse_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function output_edit_Callback(hObject, eventdata, handles)
% hObject    handle to output_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of output_edit as text
%        str2double(get(hObject,'String')) returns contents of output_edit as a double


% --- Executes during object creation, after setting all properties.
function output_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input_pushbutton.
function input_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to input_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.input_edit,'String',directoryname);


% --- Executes on button press in output_pushbutton.
function output_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to output_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.output_edit,'String',directoryname);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1 = get(handles.input_edit,'String');
str2 = get(handles.output_edit,'String');
if length(str1)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(str2)<=0;
    errordlg('OutputPath can not be empty !')
 return;
end
template=ROITemplate_forAVG('Fun_200_3mm.nii');
ReadTimeCourse(str1,template,str2);
tishi='Task is completed !'



% --- Executes on button press in finish.
function finish_Callback(hObject, eventdata, handles)
% hObject    handle to finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);



function mod_edit_Callback(hObject, eventdata, handles)
% hObject    handle to mod_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mod_edit as text
%        str2double(get(hObject,'String')) returns contents of mod_edit as a double


% --- Executes during object creation, after setting all properties.
function mod_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mod_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
