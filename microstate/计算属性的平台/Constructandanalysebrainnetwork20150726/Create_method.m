function varargout = Create_method(varargin)
% CREATE_METHOD M-file for Create_method.fig
%      CREATE_METHOD, by itself, creates a new CREATE_METHOD or raises the existing
%      singleton*.
%
%      H = CREATE_METHOD returns the handle to a new CREATE_METHOD or the handle to
%      the existing singleton*.
%
%      CREATE_METHOD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATE_METHOD.M with the given input arguments.
%
%      CREATE_METHOD('Property','Value',...) creates a new CREATE_METHOD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Create_method_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Create_method_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Create_method

% Last Modified by GUIDE v2.5 05-Mar-2013 22:29:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Create_method_OpeningFcn, ...
                   'gui_OutputFcn',  @Create_method_OutputFcn, ...
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


% --- Executes just before Create_method is made visible.
function Create_method_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Create_method (see VARARGIN)

% Choose default command line output for Create_method
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Create_method wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Create_method_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function all_edit_Callback(hObject, eventdata, handles)
% hObject    handle to all_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of all_edit as text
%        str2double(get(hObject,'String')) returns contents of all_edit as a double


% --- Executes during object creation, after setting all properties.
function all_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to all_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function adr_edit_Callback(hObject, eventdata, handles)
% hObject    handle to adr_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of adr_edit as text
%        str2double(get(hObject,'String')) returns contents of adr_edit as a double


% --- Executes during object creation, after setting all properties.
function adr_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to adr_edit (see GCBO)
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
set(handles.all_edit,'String',directoryname);


% --- Executes on button press in adr_pushbutton.
function adr_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to adr_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.adr_edit,'String',directoryname);


% --- Executes on button press in exe_pushbutton.
function exe_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exe_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%h = waitbar(0,'Please wait...');
       % for i=1:1000,
            % computation here %
          %  waitbar(i/1000,h)
        %end
       %close(h);
       time1=datestr(now,'HHMMSS');
s1 =num2str( get(handles.parperson_checkbox,'Value'));
s2 =num2str( get(handles.sparman_checkbox,'Value'));
s3 =num2str( get(handles.p_checkbox,'Value'));
s4 =num2str( get(handles.sp_checkbox,'Value'));
str = get(handles.all_edit,'String');
newname = get(handles.adr_edit,'String');
str1 = get(handles.num_edit,'String');
if length(str)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(newname)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
prefix= getappdata(0,'prefix');
if s1=='0' && s2=='0' && s3=='0' && s4=='0' 
         errordlg('Select at least one constructor!')   
      return;
    end
if s1=='1'
     c = 'pp';
     part = partialcorrectionFisher(str,newname,c,prefix,str1);
   % set(handles.chuko_text,'String',part);
end
if s2=='1'
       c = 'ps';
    part = partialcorrectionFisher(str,newname,c,prefix,str1);
   % set(handles.chuko_text,'String',part);
end
if s3=='1'
          c = 'p';
      part = correctionFisher(str,newname,c,prefix);
     % set(handles.chuko_text,'String',part);
end
if s4=='1'
       c = 's';
      part = correctionFisher(str,newname,c,prefix);
     % set(handles.chuko_text,'String',part);
end
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
open Order.fig;
close(gcf);
delete(gcf);
set(0,'currentfigure',Order);

% --- Executes on button press in parperson_checkbox.
function parperson_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to parperson_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.num_edit,'String');
if length(number)<=0;
    set(handles.parperson_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of parperson_checkbox


% --- Executes on button press in sparman_checkbox.
function sparman_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to sparman_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.num_edit,'String');
if length(number)<=0;
    set(handles.sparman_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of sparman_checkbox


% --- Executes on button press in p_checkbox.
function p_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to p_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of p_checkbox


% --- Executes on button press in sp_checkbox.
function sp_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to sp_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sp_checkbox


% --- Executes on button press in pre_pushbutton.
function pre_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pre_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open allCon_Sub_AALTC.fig;
close(gcf);
delete(gcf);
set(0,'currentfigure',allCon_Sub_AALTC);



function mateix_edit_Callback(hObject, eventdata, handles)
% hObject    handle to mateix_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mateix_edit as text
%        str2double(get(hObject,'String')) returns contents of mateix_edit as a double


% --- Executes during object creation, after setting all properties.
function mateix_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mateix_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
