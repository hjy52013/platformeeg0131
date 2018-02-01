function varargout = Order(varargin)
% ORDER M-file for Order.fig
%      ORDER, by itself, creates a new ORDER or raises the existing
%      singleton*.
%
%      H = ORDER returns the handle to a new ORDER or the handle to
%      the existing singleton*.
%
%      ORDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ORDER.M with the given input arguments.
%
%      ORDER('Property','Value',...) creates a new ORDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Order_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Order_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Order

% Last Modified by GUIDE v2.5 26-Mar-2012 14:30:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Order_OpeningFcn, ...
                   'gui_OutputFcn',  @Order_OutputFcn, ...
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


% --- Executes just before Order is made visible.
function Order_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Order (see VARARGIN)

% Choose default command line output for Order
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Order wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Order_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in load_pushbutton.
function load_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to load_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.input_edit,'String',directoryname);



function adress_edit_Callback(hObject, eventdata, handles)
% hObject    handle to adress_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of adress_edit as text
%        str2double(get(hObject,'String')) returns contents of adress_edit as a double


% --- Executes during object creation, after setting all properties.
function adress_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adress_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in adress_pushbutton.
function adress_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to adress_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.adress_edit,'String',directoryname);


% --- Executes on button press in pexe_ushbutton.
function pexe_ushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pexe_ushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global number;
 time1=datestr(now,'HHMMSS');
s1 =num2str( get(handles.des_radiobutton,'Value'));
s2 =num2str( get(handles.asc_radiobutton,'Value'));
str = get(handles.input_edit,'String');
newname = get(handles.adress_edit,'String');
if length(str)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(newname)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
%number = get(handles.area_edit,'String');
%number=get(handles.figure1,'userdata');
%%%%number = getappdata(0,'number');
%number = get(findobj('Tag','fist'),'userdata');
number= get(handles.number,'String');
if s1=='1'
     flag == '1';
 spar = sparsity(str,flag,newname,number); 
else if s2 == '1'
         flag == '0';
 spar = sparsity(str,flag,newname,number); 
    end
end
time2=datestr(now,'HHMMSS');
 time4= datenum(num2str(time1),'HHMMSS');
 time5= datenum(num2str(time2),'HHMMSS');
 time3=datestr((time5-time4),'HH:MM:SS');
 tishi='Task is completed !'
 msgbox(strcat(tishi,time3)); 


% --- Executes on button press in pnext_ushbutton.
function pnext_ushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pnext_ushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Intercepted.fig;
close(gcf);
delete(gcf);
set(0,'currentfigure',Intercepted);


% --- Executes on button press in pre_pushbutton.
function pre_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pre_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Create_method.fig;
close(gcf);
delete(gcf);
set(0,'currentfigure',Create_method);



function number_Callback(hObject, eventdata, handles)
% hObject    handle to number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number as text
%        str2double(get(hObject,'String')) returns contents of number as a double


% --- Executes during object creation, after setting all properties.
function number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
