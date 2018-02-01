function varargout = fisher_z_tran(varargin)
% FISHER_Z_TRAN M-file for fisher_z_tran.fig
%      FISHER_Z_TRAN, by itself, creates a new FISHER_Z_TRAN or raises the existing
%      singleton*.
%
%      H = FISHER_Z_TRAN returns the handle to a new FISHER_Z_TRAN or the handle to
%      the existing singleton*.
%
%      FISHER_Z_TRAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FISHER_Z_TRAN.M with the given input arguments.
%
%      FISHER_Z_TRAN('Property','Value',...) creates a new FISHER_Z_TRAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fisher_z_tran_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fisher_z_tran_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fisher_z_tran

% Last Modified by GUIDE v2.5 18-Apr-2013 22:05:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fisher_z_tran_OpeningFcn, ...
                   'gui_OutputFcn',  @fisher_z_tran_OutputFcn, ...
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


% --- Executes just before fisher_z_tran is made visible.
function fisher_z_tran_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fisher_z_tran (see VARARGIN)

% Choose default command line output for fisher_z_tran
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fisher_z_tran wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fisher_z_tran_OutputFcn(hObject, eventdata, handles) 
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



function number_edit_Callback(hObject, eventdata, handles)
% hObject    handle to number_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_edit as text
%        str2double(get(hObject,'String')) returns contents of number_edit as a double


% --- Executes during object creation, after setting all properties.
function number_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_edit (see GCBO)
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

% --- Executes on button press in fisher_zpushbutton.
function fisher_zpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to fisher_zpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = get(handles.input_edit,'String');
output=get(handles.output_edit,'String');
numb = get(handles.number_edit,'String');
if length(input)<=0;
    errordlg('input data can not be empty !')
 return;
end
if length(output)<=0;
    errordlg('output data can not be empty !')
 return;
end
if length(numb)<=0;
    errordlg('number of ROIs can not be empty !')
 return;
end
Fisher_z(input,output,numb)
tishi='Task is completed !'

% --- Executes on button press in finish_pushbutton.
function finish_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to finish_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);
