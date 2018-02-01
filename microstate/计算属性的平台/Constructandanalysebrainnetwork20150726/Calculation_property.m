function varargout = Calculation_property(varargin)
% CALCULATION_PROPERTY M-file for Calculation_property.fig
%      CALCULATION_PROPERTY, by itself, creates a new CALCULATION_PROPERTY or raises the existing
%      singleton*.
%
%      H = CALCULATION_PROPERTY returns the handle to a new CALCULATION_PROPERTY or the handle to
%      the existing singleton*.
%
%      CALCULATION_PROPERTY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATION_PROPERTY.M with the given input arguments.
%
%      CALCULATION_PROPERTY('Property','Value',...) creates a new CALCULATION_PROPERTY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculation_property_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculation_property_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculation_property

% Last Modified by GUIDE v2.5 05-Jan-2012 14:37:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculation_property_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculation_property_OutputFcn, ...
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


% --- Executes just before Calculation_property is made visible.
function Calculation_property_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calculation_property (see VARARGIN)

% Choose default command line output for Calculation_property
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Calculation_property wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calculation_property_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calcu_pushbutton.
function calcu_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to calcu_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%str1表示全局属性的入口参数
%str2表示全局属性的存放路径
%str3表示全局属性入口的数据经过变形的中间结果的存放地址
str1 = get(handles.input_edit,'String');
str2 = get(handles.results_edit,'String');
prefix = get(handles.pre_edit,'String');
mkdir(strcat(str2,'/',prefix,'Intermediate results'));
str3 =strcat(str2,'/',prefix,'Intermediate results');
prefix = get(handles.pre_edit,'String');
if length(str1)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(str2)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
%prefix= getappdata(0,'prefix');
bform = Bform(str1,str3 );
s1 =num2str( get(handles.short_checkbox,'Value'));
s2 =num2str( get(handles.cluster_checkbox,'Value'));
if s1=='1'
    getNetworkallshortpathproperty(str3,str2,prefix);
end
if s2=='1'
    getNetworkclusteringsproperty(str3,str2,prefix);
end
tishi='Task is completed !'
 msgbox(tishi); 




% --- Executes on button press in finish_pushbutton.
function finish_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to finish_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);


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



function res_edit_Callback(hObject, eventdata, handles)
% hObject    handle to res_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res_edit as text
%        str2double(get(hObject,'String')) returns contents of res_edit as a double


% --- Executes during object creation, after setting all properties.
function res_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in lo_pushbutton.
function lo_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to lo_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.in_edit,'String',directoryname);

% --- Executes on button press in re_pushbutton.
function re_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to re_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.res_edit,'String',directoryname);


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



function results_edit_Callback(hObject, eventdata, handles)
% hObject    handle to results_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of results_edit as text
%        str2double(get(hObject,'String')) returns contents of results_edit as a double


% --- Executes during object creation, after setting all properties.
function results_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to results_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in results_pushbutton.
function results_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to results_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.results_edit,'String',directoryname);

% --- Executes on button press in load_pushbutton.
function load_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to load_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.input_edit,'String',directoryname);

% --- Executes on button press in short_checkbox.
function short_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to short_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of short_checkbox


% --- Executes on button press in cluster_checkbox.
function cluster_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to cluster_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cluster_checkbox


% --- Executes on button press in degree_checkbox.
function degree_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to degree_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of degree_checkbox


% --- Executes on button press in de_checkbox.
function de_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to de_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of de_checkbox



function pre_edit_Callback(hObject, eventdata, handles)
% hObject    handle to pre_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pre_edit as text
%        str2double(get(hObject,'String')) returns contents of pre_edit as a double


% --- Executes during object creation, after setting all properties.
function pre_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pre_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in exe_pushbutton.
function exe_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exe_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str4 =get(handles.in_edit,'String');
str5 =get(handles.res_edit,'String');
s3 =num2str( get(handles.degree_checkbox,'Value'));
s4 =num2str( get(handles.de_checkbox,'Value'));
prefix = get(handles.pre_edit,'String');
if length(str4)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(str5)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
if s3=='1'
     str9 = get(handles.num_edit,'String');
    degree= getNodedegreeproperty (str4,str5,prefix);
     degreesum( degree,degree,str9 )
end
if s4=='1'  
   mkdir(strcat(str5,'/',prefix,'Intermediate results'));
   str6 =strcat(str5,'/',prefix,'Intermediate results');
   bform = Bform(str4,str6);
    getNodeBCproperty (str6,str5,prefix)
end
tishi='Task is completed !'
 msgbox(tishi); 



function get_edit_Callback(hObject, eventdata, handles)
% hObject    handle to get_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of get_edit as text
%        str2double(get(hObject,'String')) returns contents of get_edit as a double


% --- Executes during object creation, after setting all properties.
function get_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to get_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function get_edit2_Callback(hObject, eventdata, handles)
% hObject    handle to get_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of get_edit2 as text
%        str2double(get(hObject,'String')) returns contents of get_edit2 as a double


% --- Executes during object creation, after setting all properties.
function get_edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to get_edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in get_pushbutton.
function get_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to get_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.get_edit,'String',directoryname);


% --- Executes on button press in get_pushbutton9.
function get_pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to get_pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.get_edit2,'String',directoryname);

% --- Executes on button press in get_pushbutton10.
function get_pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to get_pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str7 =get(handles.get_edit,'String');
str8 =get(handles.get_edit2,'String');
str9 = get(handles.num_edit,'String');
getoneDegrees(str7,str8,str9);
tishi='Task is completed !'
 msgbox(tishi);



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
