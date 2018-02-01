function varargout = allCon_Sub_AALTC(varargin)
% ALLCON_SUB_AALTC M-file for allCon_Sub_AALTC.fig
%      ALLCON_SUB_AALTC, by itself, creates a new ALLCON_SUB_AALTC or raises the existing
%      singleton*.
%
%      H = ALLCON_SUB_AALTC returns the handle to a new ALLCON_SUB_AALTC or the handle to
%      the existing singleton*.
%
%      ALLCON_SUB_AALTC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALLCON_SUB_AALTC.M with the given input arguments.
%
%      ALLCON_SUB_AALTC('Property','Value',...) creates a new ALLCON_SUB_AALTC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before allCon_Sub_AALTC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to allCon_Sub_AALTC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help allCon_Sub_AALTC

% Last Modified by GUIDE v2.5 21-Dec-2011 17:27:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @allCon_Sub_AALTC_OpeningFcn, ...
                   'gui_OutputFcn',  @allCon_Sub_AALTC_OutputFcn, ...
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


% --- Executes just before allCon_Sub_AALTC is made visible.
function allCon_Sub_AALTC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to allCon_Sub_AALTC (see VARARGIN)

% Choose default command line output for allCon_Sub_AALTC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes allCon_Sub_AALTC wait for user response (see UIRESUME)
% uiwait(handles.fist);


% --- Outputs from this function are returned to the command line.
function varargout = allCon_Sub_AALTC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function allcon_edit_Callback(hObject, eventdata, handles)
% hObject    handle to allcon_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of allcon_edit as text
%        str2double(get(hObject,'String')) returns contents of allcon_edit as a double


% --- Executes during object creation, after setting all properties.
function allcon_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to allcon_edit (see GCBO)
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
set(handles.allcon_edit,'String',directoryname);



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


% --- Executes on button press in exe_pushbutton.
function exe_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exe_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
time1=datestr(now,'HHMMSS');
display(time1);
number = get(handles.area_edit,'String');
str = get(handles.allcon_edit,'String');
newname = get(handles.adress_edit,'String');
if length(str)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(newname)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
if length(number)<=0;
    errordlg('Number of brain regions can not be empty !')
 return;
end
num = str2double(number);
if isnan(num)
errordlg('Number must be a number of brain areas')
return
end
if  num<=0
    errordlg('Number of brain regions can not be less than 0  !')
 return;
end  
%global number ;
setappdata(0,'number',number);
%set(gcf,'userdata',number);
%number = getappdata(0,'number');
prefix = get(handles.treat_edit,'String');
if length(prefix)==0;
  prefix='Con';
%else if length(prefix)~=3
 %    errordlg('Prefix must be 3 or 0 characters!')   
  %    return;
   %end
end
setappdata(0,'prefix',prefix);
 part = getAllTimes(str,newname,number,prefix);
 time2=datestr(now,'HHMMSS');
 time4= datenum(num2str(time1),'HHMMSS');
 time5= datenum(num2str(time2),'HHMMSS');
 time3=datestr((time5-time4),'HH:MM:SS');
 %time3=datestr(time2-time1 ,'dd-mmm-yyyy HH:MM:SS');
 tishi='Task is completed !'
 msgbox(strcat(tishi,time3));


% --- Executes on button press in next_pushbutton.
function next_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to next_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Create_method.fig;
close(gcf);
delete(gcf);
set(0,'currentfigure',Create_method);



function treat_edit_Callback(hObject, eventdata, handles)
% hObject    handle to treat_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of treat_edit as text
%        str2double(get(hObject,'String')) returns contents of treat_edit as a double


% --- Executes during object creation, after setting all properties.
function treat_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to treat_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function area_edit_Callback(hObject, eventdata, handles)
% hObject    handle to area_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of area_edit as text
%        str2double(get(hObject,'String')) returns contents of area_edit as a double


% --- Executes during object creation, after setting all properties.
function area_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to area_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
