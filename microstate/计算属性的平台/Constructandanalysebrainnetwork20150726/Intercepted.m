function varargout = Intercepted(varargin)
% INTERCEPTED M-file for Intercepted.fig
%      INTERCEPTED, by itself, creates a new INTERCEPTED or raises the existing
%      singleton*.
%
%      H = INTERCEPTED returns the handle to a new INTERCEPTED or the handle to
%      the existing singleton*.
%
%      INTERCEPTED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERCEPTED.M with the given input arguments.
%
%      INTERCEPTED('Property','Value',...) creates a new INTERCEPTED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Intercepted_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Intercepted_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Intercepted

% Last Modified by GUIDE v2.5 05-Mar-2013 23:42:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Intercepted_OpeningFcn, ...
                   'gui_OutputFcn',  @Intercepted_OutputFcn, ...
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


% --- Executes just before Intercepted is made visible.
function Intercepted_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Intercepted (see VARARGIN)

% Choose default command line output for Intercepted
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Intercepted wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Intercepted_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function in_edit_Callback(hObject, eventdata, handles)
% hObject    handle to in_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in_edit as text
%        str2double(get(hObject,'String')) returns contents of in_edit as a double


% --- Executes during object creation, after setting all properties.
function in_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in_edit (see GCBO)
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
set(handles.in_edit,'String',directoryname);



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


% --- Executes on button press in ad_pushbutton.
function ad_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ad_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.adress_edit,'String',directoryname);


% --- Executes on button press in exe_pushbutton.
function exe_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exe_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
time1=datestr(now,'HHMMSS');
s1 =num2str( get(handles.percentage_checkbox,'Value'));
s2 =num2str( get(handles.number_checkbox,'Value'));
str = get(handles.in_edit,'String');
%str1 = get(handles.num_edit,'String');
newname = get(handles.adress_edit,'String');
if length(str)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(newname)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
if s1=='0' && s2=='0' 
         errordlg('Select at least one interception method!')   
      return;
end
    num=str2num(get(handles.num_edit,'String'));
sparsitysta_number = str2num(get(handles.ft_edit,'String'));
sparsityend_number = str2num(get(handles.lt_edit,'String'));
step_number = str2num(get(handles.st_edit,'String')); 
sparsitysta = str2num(get(handles.first_edit,'String'));
sparsityend = str2num(get(handles.last_edit,'String'));
step = str2num(get(handles.step_edit,'String')); 
prefix= getappdata(0,'prefix');
if s1=='1' 
mkdir(strcat(newname,'\percentage'));
newname1=strcat(newname,'\percentage');
ptob = PtoB(str,sparsitysta,sparsityend,step,newname1,prefix,num);
end
if s2=='1' 
mkdir(strcat(newname,'\number'));
newname2=strcat(newname,'\number');
ptob = PtoB_tiao(str,sparsitysta_number,sparsityend_number,step_number,newname2,prefix); 
end
time2=datestr(now,'HHMMSS');
 time4= datenum(num2str(time1),'HHMMSS');
 time5= datenum(num2str(time2),'HHMMSS');
 time3=datestr((time5-time4),'HH:MM:SS');
tishi='Task is completed !'
msgbox(strcat(tishi,time3)); 


% --- Executes on button press in percentage_checkbox.
function percentage_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to percentage_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sparsitysta = get(handles.first_edit,'String');
if length(sparsitysta)<=0;
    set(handles.percentage_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
 return;
end
sparsityend = get(handles.last_edit,'String');
if length(sparsityend)<=0;
    set(handles.percentage_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
 return;
end
step = get(handles.step_edit,'String'); 
if length(step)<=0;
    set(handles.percentage_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
 return;
end
number=get(handles.num_edit,'String');
if length(number)<=0;
    set(handles.percentage_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of percentage_checkbox


% --- Executes on button press in number_checkbox.
function number_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to number_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sparsitysta_number = get(handles.ft_edit,'String');
if length(sparsitysta_number)<=0;
    set(handles.number_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
 return;
end
sparsityend_number = get(handles.lt_edit,'String');
if length(sparsityend_number)<=0;
    set(handles.number_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
 return;
end
step_number = get(handles.st_edit,'String');
if length(step_number)<=0;
    set(handles.number_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
 return;
end
% Hint: get(hObject,'Value') returns toggle state of number_checkbox



function ft_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ft_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ft_edit as text
%        str2double(get(hObject,'String')) returns contents of ft_edit as a double


% --- Executes during object creation, after setting all properties.
function ft_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ft_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lt_edit_Callback(hObject, eventdata, handles)
% hObject    handle to lt_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lt_edit as text
%        str2double(get(hObject,'String')) returns contents of lt_edit as a double


% --- Executes during object creation, after setting all properties.
function lt_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lt_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function st_edit_Callback(hObject, eventdata, handles)
% hObject    handle to st_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of st_edit as text
%        str2double(get(hObject,'String')) returns contents of st_edit as a double


% --- Executes during object creation, after setting all properties.
function st_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to st_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function first_edit_Callback(hObject, eventdata, handles)
% hObject    handle to first_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of first_edit as text
%        str2double(get(hObject,'String')) returns contents of first_edit as a double


% --- Executes during object creation, after setting all properties.
function first_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to first_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function last_edit_Callback(hObject, eventdata, handles)
% hObject    handle to last_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of last_edit as text
%        str2double(get(hObject,'String')) returns contents of last_edit as a double


% --- Executes during object creation, after setting all properties.
function last_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to last_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_edit_Callback(hObject, eventdata, handles)
% hObject    handle to step_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_edit as text
%        str2double(get(hObject,'String')) returns contents of step_edit as a double


% --- Executes during object creation, after setting all properties.
function step_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finish_pushbutton.
function finish_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to finish_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);


% --- Executes on button press in pre_pushbutton.
function pre_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pre_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Order.fig;
close(gcf);
delete(gcf);
set(0,'currentfigure',Order);



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
