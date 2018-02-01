function varargout = non_paramentic_pt(varargin)
% NON_PARAMENTIC_PT M-file for non_paramentic_pt.fig
%      NON_PARAMENTIC_PT, by itself, creates a new NON_PARAMENTIC_PT or raises the existing
%      singleton*.
%
%      H = NON_PARAMENTIC_PT returns the handle to a new NON_PARAMENTIC_PT or the handle to
%      the existing singleton*.
%
%      NON_PARAMENTIC_PT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NON_PARAMENTIC_PT.M with the given input arguments.
%
%      NON_PARAMENTIC_PT('Property','Value',...) creates a new NON_PARAMENTIC_PT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before non_paramentic_pt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to non_paramentic_pt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help non_paramentic_pt

% Last Modified by GUIDE v2.5 15-Apr-2013 20:17:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @non_paramentic_pt_OpeningFcn, ...
                   'gui_OutputFcn',  @non_paramentic_pt_OutputFcn, ...
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


% --- Executes just before non_paramentic_pt is made visible.
function non_paramentic_pt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to non_paramentic_pt (see VARARGIN)

% Choose default command line output for non_paramentic_pt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes non_paramentic_pt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = non_paramentic_pt_OutputFcn(hObject, eventdata, handles) 
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



function rest_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rest_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rest_edit as text
%        str2double(get(hObject,'String')) returns contents of rest_edit as a double


% --- Executes during object creation, after setting all properties.
function rest_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rest_edit (see GCBO)
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

% --- Executes on button press in re_pushbutton.
function re_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to re_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.rest_edit,'String',directoryname);

% --- Executes on button press in analy_pushbutton.
function analy_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to analy_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1 = get(handles.input_edit,'String');
str2 = get(handles.in_edit,'String');
str3 = get(handles.rest_edit,'String');
str6 = get(handles.file_edit,'String');
auc =num2str( get(handles.auc_checkbox,'Value'));
Smaller=num2str(get(handles.Smaller_checkbox,'Value'));
larger=num2str(get(handles.larger_checkbox,'Value'));  
if length(str1)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(str2)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(str3)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
%s1,s2,str4,str5等参数存在是为了统一局部与全局属性
%由于后来已经在getoneDegree中统一所以注销各部分
%s1 =num2str( get(handles.Global_radiobutton,'Value'));
%s2 =num2str( get(handles.Node_radiobutton,'Value'));
%if s1=='1'
%end
%if s2=='1'
%str4=strcat(str3,'\1');
%str5=strcat(str3,'\2');
%mkdir(str4);
%mkdir(str5);
%getoneDegrees(str1,str4);
%getoneDegrees(str2,str5);
%Statistics(str4,str5,str3,str6);
%end
 number=str2num(get(handles.number_edit,'String')); %稀疏度的个数
if auc=='1'  %判断是否做auc
    subCount=str2num(get(handles.subcount_edit,'String'));%第一类的被试数
    subcount2=str2num(get(handles.count_edit,'String'));%第二类的被试数
    %建立第一类数据AUC所得到结果的存放路径，并进行AUC
    aucresult1=strcat(str3,'\aucresult\1');
    mkdir(aucresult1);
   AUC(str1,aucresult1,subCount,number) ;
    %建立第二类数据AUC所得到结果的存放路径，并进行AUC
   aucresult2=strcat(str3,'\aucresult\2');
    mkdir(aucresult2);
   AUC(str2,aucresult2,subcount2,number) ;
   %进行非参数检验
   number=1;
   if larger=='1'
     Statistics( aucresult1,aucresult2,str3,str6,number,'larger');   
   end
   if Smaller=='1'
    Statistics( aucresult1,aucresult2,str3,str6,number,'Smalle');  
   end
   Statistics( aucresult1,aucresult2,str3,str6,number,'emport');
   %Statistics_ttest2( aucresult1,aucresult2,str3,str6,number);
else
    if larger=='1'
     Statistics( str1,str2,str3,str6,number,'larger');  
   end
   if Smaller=='1'
    Statistics( str1,str2,str3,str6,number,'Smalle');
   end
    Statistics( str1,str2,str3,str6,number,'emport');
end

tishi='Task is completed !'
 msgbox(tishi);



% --- Executes on button press in finish_pushbutton.
function finish_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to finish_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);

% --- Executes on button press in input_pushbutton.
function input_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to input_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.input_edit,'String',directoryname);



function file_edit_Callback(hObject, eventdata, handles)
% hObject    handle to file_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_edit as text
%        str2double(get(hObject,'String')) returns contents of file_edit as a double


% --- Executes during object creation, after setting all properties.
function file_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in auc_checkbox.
function auc_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to auc_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
subCount=get(handles.subcount_edit,'String');
    number=get(handles.number_edit,'String');
    if length(subCount)<=0;
        set(handles.auc_checkbox,'Value',0)
    errordlg('subCount1 can not be empty !')
 return;
end
if length(number)<=0;
    set(handles.auc_checkbox,'Value',0)
    errordlg('Sparsity number can not be empty !')
 return;
end
 subcount2=get(handles.count_edit,'String');
 if length(subcount2)<=0;
    set(handles.auc_checkbox,'Value',0)
    errordlg('subCount2 can not be empty !')
 return;
end
 
% Hint: get(hObject,'Value') returns toggle state of auc_checkbox



function subcount_edit_Callback(hObject, eventdata, handles)
% hObject    handle to subcount_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subcount_edit as text
%        str2double(get(hObject,'String')) returns contents of subcount_edit as a double


% --- Executes during object creation, after setting all properties.
function subcount_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subcount_edit (see GCBO)
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



function count_edit_Callback(hObject, eventdata, handles)
% hObject    handle to count_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of count_edit as text
%        str2double(get(hObject,'String')) returns contents of count_edit as a double


% --- Executes during object creation, after setting all properties.
function count_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to count_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in larger_checkbox.
function larger_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to larger_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of larger_checkbox


% --- Executes on button press in Smaller_checkbox.
function Smaller_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to Smaller_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Smaller_checkbox
