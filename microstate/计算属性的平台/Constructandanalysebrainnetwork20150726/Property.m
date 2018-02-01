function varargout = Property(varargin)
% PROPERTY M-file for Property.fig
%      PROPERTY, by itself, creates a new PROPERTY or raises the existing
%      singleton*.
%
%      H = PROPERTY returns the handle to a new PROPERTY or the handle to
%      the existing singleton*.
%
%      PROPERTY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROPERTY.M with the given input arguments.
%
%      PROPERTY('Property','Value',...) creates a new PROPERTY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Property_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Property_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Property

% Last Modified by GUIDE v2.5 04-Jun-2014 19:05:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Property_OpeningFcn, ...
                   'gui_OutputFcn',  @Property_OutputFcn, ...
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


% --- Executes just before Property is made visible.
function Property_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Property (see VARARGIN)

% Choose default command line output for Property
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Property wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Property_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_intput_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intput as text
%        str2double(get(hObject,'String')) returns contents of edit_intput as a double


% --- Executes during object creation, after setting all properties.
function edit_intput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in pushbutton_intput.
function pushbutton_intput_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_intput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_intput,'String',directoryname);

% --- Executes on button press in pushbutton_out.
function pushbutton_out_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_out,'String',directoryname);


function edit_number_Callback(hObject, eventdata, handles)
% hObject    handle to edit_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_number as text
%        str2double(get(hObject,'String')) returns contents of edit_number as a double


% --- Executes during object creation, after setting all properties.
function edit_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sfn_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sfn as text
%        str2double(get(hObject,'String')) returns contents of edit_sfn as a double


% --- Executes during object creation, after setting all properties.
function edit_sfn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pfn_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pfn as text
%        str2double(get(hObject,'String')) returns contents of edit_pfn as a double


% --- Executes during object creation, after setting all properties.
function edit_pfn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_fn_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fn as text
%        str2double(get(hObject,'String')) returns contents of edit_fn as a double


% --- Executes during object creation, after setting all properties.
function edit_fn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_property.
function pushbutton_property_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_property (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_intput,'String');
if length(oinputdata)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
number1= get(handles.edit_number,'String');
if length(number1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
number=str2num(number1);
mkdir(strcat(ooutput,'\afterorder'));
ooutputdata=strcat(ooutput,'\afterorder');
%ÅÅÐò
sparsity_all(oinputdata,ooutputdata,number);
sparsityfilename=get(handles.edit_sfn,'String');
if length(sparsityfilename)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
first1= get(handles.edit_sf,'String');
if length(first1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
first=str2num(first1);
last1= get(handles.edit_sl,'String');
if length(last1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
last=str2num(last1);
step1= get(handles.edit_ss,'String');
if length(step1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
step=str2num(step1);
%½ØÈ¡Ï¡Êè¶È
mkdir(strcat(ooutput,'\afterinter'));
outputdata=strcat(ooutput,'\afterinter');
ptoB_all(ooutputdata,outputdata,number,first,last,step,sparsityfilename);
parameterfilename=get(handles.edit_pfn,'String');
if length(parameterfilename)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
filename=get(handles.edit_fn,'String');
if length(filename)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pfirst=str2num(pfirst1);
plast1= get(handles.edit_lp,'String');
if length(plast1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
plast=str2num(plast1);
pstep1= get(handles.edit_sp,'String');
if length(pstep1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pstep=str2num(pstep1);
%¼ÆËãÊôÐÔ
mkdir(strcat(ooutput,'\property'));
ooutput1=strcat(ooutput,'\property');
s1 =num2str( get(handles.checkbox_as,'Value'));
if s1=='1'
pro='as';
shortpa_all (outputdata,ooutput1,sparsityfilename,parameterfilename,filename,first1,last1,step1,number1,pfirst,plast,pstep,pro);
end
s2 =num2str( get(handles.checkbox_cc,'Value'));
if s2=='1'
pro='cc';
shortpa_all (outputdata,ooutput1,sparsityfilename,parameterfilename,filename,first1,last1,step1,number1,pfirst,plast,pstep,pro);
end
s3 =num2str( get(handles.checkbox_s,'Value'));
if s3=='1'
pro='s';
shortpa_all (outputdata,ooutput1,sparsityfilename,parameterfilename,filename,first1,last1,step1,number1,pfirst,plast,pstep,pro);
end
s4 =num2str( get(handles.checkbox_g,'Value'));
if s4=='1'
pro='g';
shortpa_all (outputdata,ooutput1,sparsityfilename,parameterfilename,filename,first1,last1,step1,number1,pfirst,plast,pstep,pro);
end
s5 =num2str( get(handles.checkbox_l,'Value'));
if s5=='1'
pro='l';
shortpa_all (outputdata,ooutput1,sparsityfilename,parameterfilename,filename,first1,last1,step1,number1,pfirst,plast,pstep,pro);
end


% --- Executes on button press in pushbutton_finish.
function pushbutton_finish_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf)

% --- Executes on button press in checkbox_as.
function checkbox_as_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_as (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_intput,'String');
if length(oinputdata)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
number1= get(handles.edit_number,'String');
if length(number1)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
sparsityfilename=get(handles.edit_sfn,'String');
if length(sparsityfilename)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
first1= get(handles.edit_sf,'String');
if length(first1)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
last1= get(handles.edit_sl,'String');
if length(last1)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
step1= get(handles.edit_ss,'String');
if length(step1)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
parameterfilename=get(handles.edit_pfn,'String');
if length(parameterfilename)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
filename=get(handles.edit_fn,'String');
if length(filename)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
plast1= get(handles.edit_lp,'String');
if length(plast1)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pstep1= get(handles.edit_sp,'String');
if length(pstep1)<=0;
    set(handles.checkbox_as,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end


% Hint: get(hObject,'Value') returns toggle state of checkbox_as


% --- Executes on button press in checkbox_cc.
function checkbox_cc_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_cc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_intput,'String');
if length(oinputdata)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
number1= get(handles.edit_number,'String');
if length(number1)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
sparsityfilename=get(handles.edit_sfn,'String');
if length(sparsityfilename)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
first1= get(handles.edit_sf,'String');
if length(first1)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
last1= get(handles.edit_sl,'String');
if length(last1)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
step1= get(handles.edit_ss,'String');
if length(step1)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
parameterfilename=get(handles.edit_pfn,'String');
if length(parameterfilename)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
filename=get(handles.edit_fn,'String');
if length(filename)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
plast1= get(handles.edit_lp,'String');
if length(plast1)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pstep1= get(handles.edit_sp,'String');
if length(pstep1)<=0;
    set(handles.checkbox_cc,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox_cc


% --- Executes on button press in checkbox_s.
function checkbox_s_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_intput,'String');
if length(oinputdata)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
number1= get(handles.edit_number,'String');
if length(number1)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
sparsityfilename=get(handles.edit_sfn,'String');
if length(sparsityfilename)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
first1= get(handles.edit_sf,'String');
if length(first1)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
last1= get(handles.edit_sl,'String');
if length(last1)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
step1= get(handles.edit_ss,'String');
if length(step1)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
parameterfilename=get(handles.edit_pfn,'String');
if length(parameterfilename)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
filename=get(handles.edit_fn,'String');
if length(filename)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
plast1= get(handles.edit_lp,'String');
if length(plast1)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pstep1= get(handles.edit_sp,'String');
if length(pstep1)<=0;
    set(handles.checkbox_s,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox_s


% --- Executes on button press in checkbox_l.
function checkbox_l_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_intput,'String');
if length(oinputdata)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
number1= get(handles.edit_number,'String');
if length(number1)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
sparsityfilename=get(handles.edit_sfn,'String');
if length(sparsityfilename)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
first1= get(handles.edit_sf,'String');
if length(first1)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
last1= get(handles.edit_sl,'String');
if length(last1)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
step1= get(handles.edit_ss,'String');
if length(step1)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
parameterfilename=get(handles.edit_pfn,'String');
if length(parameterfilename)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
filename=get(handles.edit_fn,'String');
if length(filename)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
plast1= get(handles.edit_lp,'String');
if length(plast1)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pstep1= get(handles.edit_sp,'String');
if length(pstep1)<=0;
    set(handles.checkbox_l,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox_l


% --- Executes on button press in checkbox_g.
function checkbox_g_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata=get(handles.edit_intput,'String');
if length(oinputdata)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
number1= get(handles.edit_number,'String');
if length(number1)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
sparsityfilename=get(handles.edit_sfn,'String');
if length(sparsityfilename)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
first1= get(handles.edit_sf,'String');
if length(first1)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
last1= get(handles.edit_sl,'String');
if length(last1)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
step1= get(handles.edit_ss,'String');
if length(step1)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
parameterfilename=get(handles.edit_pfn,'String');
if length(parameterfilename)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
filename=get(handles.edit_fn,'String');
if length(filename)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
plast1= get(handles.edit_lp,'String');
if length(plast1)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
pstep1= get(handles.edit_sp,'String');
if length(pstep1)<=0;
    set(handles.checkbox_g,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox_g



function edit_pf_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pf as text
%        str2double(get(hObject,'String')) returns contents of edit_pf as a double


% --- Executes during object creation, after setting all properties.
function edit_pf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sp as text
%        str2double(get(hObject,'String')) returns contents of edit_sp as a double


% --- Executes during object creation, after setting all properties.
function edit_sp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_lp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_lp as text
%        str2double(get(hObject,'String')) returns contents of edit_lp as a double


% --- Executes during object creation, after setting all properties.
function edit_lp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_lp (see GCBO)
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

function edit_sf_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sl as text
%        str2double(get(hObject,'String')) returns contents of edit_sl as a double


% --- Executes during object creation, after setting all properties.
function edit_sf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
