function varargout = network_construction(varargin)
% NETWORK_CONSTRUCTION M-file for network_construction.fig
%      NETWORK_CONSTRUCTION, by itself, creates a new NETWORK_CONSTRUCTION or raises the existing
%      singleton*.
%
%      H = NETWORK_CONSTRUCTION returns the handle to a new NETWORK_CONSTRUCTION or the handle to
%      the existing singleton*.
%
%      NETWORK_CONSTRUCTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NETWORK_CONSTRUCTION.M with the given input arguments.
%
%      NETWORK_CONSTRUCTION('Property','Value',...) creates a new NETWORK_CONSTRUCTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before network_construction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to network_construction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help network_construction

% Last Modified by GUIDE v2.5 09-Jun-2014 17:46:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @network_construction_OpeningFcn, ...
                   'gui_OutputFcn',  @network_construction_OutputFcn, ...
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


% --- Executes just before network_construction is made visible.
function network_construction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to network_construction (see VARARGIN)

% Choose default command line output for network_construction
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes network_construction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = network_construction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function aaltc_edit_Callback(hObject, eventdata, handles)
% hObject    handle to aaltc_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aaltc_edit as text
%        str2double(get(hObject,'String')) returns contents of aaltc_edit as a double


% --- Executes during object creation, after setting all properties.
function aaltc_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aaltc_edit (see GCBO)
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
set(handles.aaltc_edit,'String',directoryname);



function result_edit_Callback(hObject, eventdata, handles)
% hObject    handle to result_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_edit as text
%        str2double(get(hObject,'String')) returns contents of result_edit as a double


% --- Executes during object creation, after setting all properties.
function result_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in result_pushbutton.
function result_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to result_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.result_edit,'String',directoryname);


% --- Executes on button press in person_checkbox.
function person_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to person_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number =get(handles.brain_edit,'String');
if length(number)<=0;
    set(handles.person_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of person_checkbox


% --- Executes on button press in spareman_checkbox.
function spareman_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to spareman_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number =get(handles.brain_edit,'String');
if length(number)<=0;
    set(handles.spareman_checkbox,'Value',0)
    errordlg('Parameters can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of spareman_checkbox


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


% --- Executes on button press in execution_pushbutton.
function execution_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to execution_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(handles.aaltc_edit,'String');
%判断用户的输入是否正确
if length(str)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
newname = get(handles.result_edit,'String');
if length(newname)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
number =get(handles.brain_edit,'String');
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
prefix = get(handles.treat_edit,'String');
if length(prefix)==0;
  prefix='Con';
%else if length(prefix)~=3
%     errordlg('Prefix must be 3 or 0 characters!')   
 %     return;
  %  end
end
%assignin('base','number');
%setappdata(0,'number',get(handles.brain_edit,'String'));
part = getAllTimes(str,newname,number,prefix);
s1 =num2str( get(handles.person_checkbox,'Value'));
s2 =num2str( get(handles.spareman_checkbox,'Value'));
s3 =num2str( get(handles.p_checkbox,'Value'));
s4 =num2str( get(handles.sp_checkbox,'Value'));
if s1=='0' && s2=='0' && s3=='0' && s4=='0' 
         errordlg('Select at least one constructor!')   
      return;
    end
s5 =num2str( get(handles.descen_radiobutton,'Value'));
s6 = num2str(get(handles.ascen_radiobutton,'Value'));
s7 =num2str( get(handles.percentage_checkbox,'Value'));
s8 =num2str( get(handles.number_checkbox,'Value'));
if s7=='0' && s8=='0' 
         errordlg('Select at least one interception method!')   
      return;
    end
sparsitysta_number = str2num(get(handles.ft_edit,'String'));
sparsityend_number = str2num(get(handles.lt_edit,'String'));
step_number = str2num(get(handles.st_edit,'String')); 
sparsitysta = str2num(get(handles.first_edit,'String'));
sparsityend = str2num(get(handles.last_edit,'String'));
step = str2num(get(handles.step_edit,'String')); 
if s1=='1'
     c = 'pp';
     part1 = partialcorrectionFisher(part,part,c,prefix,number);
      if s5=='1'
    flag == '1';
    part4 =strcat(part1,'\partialperson\P');
    part5 =strcat(part1,'\partialperson\R');
    mkdir(strcat(part1,'\partialperson\p\sort'));
    part2=strcat(part1,'\partialperson\P\sort');
    mkdir(strcat(part1,'\partialperson\R\sort'));
    part3=strcat(part1,'\partialperson\R\sort');
    spar2 = sparsity(part4,flag,part2,number);  
    spar3 = sparsity(part5,flag,part3,number); 
    if s7=='1' 
mkdir(strcat(part2,'\percentage'));
newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2,prefix,num);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
mkdir(strcat(part2,'\number'));
newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2,prefix); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end
else if s6=='1'
    flag == '0';
    part4 =strcat(part1,'\partialperson\P');
    part5 =strcat(part1,'\partialperson\R');
    mkdir(strcat(part1,'\partialperson\p\sort'));
    part2=strcat(part1,'\partialperson\P\sort');
    mkdir(strcat(part1,'\partialperson\R\sort'));
    part3=strcat(part1,'\partialperson\R\sort');
    spar2 = sparsity(part4,flag,part2,number);  
    spar3 = sparsity(part5,flag,part3,number);
     if s7=='1' 
mkdir(strcat(part2,'\percentage'));
newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2,prefix,num);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
mkdir(strcat(part2,'\number'));
newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2,prefix); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end
    end
end
end
if s2=='1'
       c = 'ps';
    part1 = partialcorrectionFisher(part,part,c,prefix,number);
     if s5=='1'
    flag == '1';
    part4 =strcat(part1,'\partialsparman\P');
    part5 =strcat(part1,'\partialsparman\R');
    mkdir(strcat(part1,'\partialsparman\p\sort'));
    part2=strcat(part1,'\partialsparman\P\sort');
    mkdir(strcat(part1,'\partialsparman\R\sort'));
    part3=strcat(part1,'\partialsparman\R\sort');
    spar2 = sparsity(part4,flag,part2,number);  
    spar3 = sparsity(part5,flag,part3,number); 
     if s7=='1' 
mkdir(strcat(part2,'\percentage'));
newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2,prefix,num);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
mkdir(strcat(part2,'\number'));
newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2,prefix); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end
else if s6=='1'
    flag == '0';
    part4 =strcat(part1,'\partialsparman\P');
    part5 =strcat(part1,'\partialsparman\R');
    mkdir(strcat(part1,'\partialsparman\p\sort'));
    part2=strcat(part1,'\partialsparman\P\sort');
    mkdir(strcat(part1,'\partialsparman\R\sort'));
    part3=strcat(part1,'\partialsparman\R\sort');
    spar2 = sparsity(part4,flag,part2,number);  
    spar3 = sparsity(part5,flag,part3,number); 
     if s7=='1' 
mkdir(strcat(part2,'\percentage'));
newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2,prefix,num);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
mkdir(strcat(part2,'\number'));
newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2,prefix); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end
    end
end
end
if s3=='1'
          c = 'p';
      part1 = correctionFisher(part,part,c,prefix);
      if s5=='1'
    flag == '1';
    part4 =strcat(part1,'\person\P');
    part5 =strcat(part1,'\person\R');
    mkdir(strcat(part1,'\person\p\sort'));
    part2=strcat(part1,'\person\P\sort');
    mkdir(strcat(part1,'\person\R\sort'));
    part3=strcat(part1,'\person\R\sort');
    spar2 = sparsity(part4,flag,part2,number);  
    spar3 = sparsity(part5,flag,part3,number); 
     if s7=='1' 
mkdir(strcat(part2,'\percentage'));
newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2,prefix,num);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
mkdir(strcat(part2,'\number'));
newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2,prefix); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end
else if s6=='1'
    flag == '0';
    part4 =strcat(part1,'\person\P');
    part5 =strcat(part1,'\person\R');
    mkdir(strcat(part1,'\person\p\sort'));
    part2=strcat(part1,'\person\P\sort');
    mkdir(strcat(part1,'\person\R\sort'));
    part3=strcat(part1,'\person\R\sort');
    spar2 = sparsity(part4,flag,part2,number);  
    spar3 = sparsity(part5,flag,part3,number); 
    if s7=='1' 
mkdir(strcat(part2,'\percentage'));
newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2,prefix,num);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
mkdir(strcat(part2,'\number'));
newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2,prefix); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end 
    end
end
end
if s4=='1'
       c = 's';
      part1 = correctionFisher(part,part,c,prefix);
       if s5=='1'
    flag == '1';
   % part4 =strcat(part1,'\person\P');
    part5 =strcat(part1,'\sparman\R');
  % mkdir(strcat(part1,'\person\p\sort'));
   %part2=strcat(part1,'\person\P\sort');
    mkdir(strcat(part1,'\sparman\R\sort'));
    part3=strcat(part1,'\sparman\R\sort');
  %  spar2 = sparsity(part4,flag,part2);  
    spar3 = sparsity(part5,flag,part3,number); 
     if s7=='1' 
%mkdir(strcat(part2,'\percentage'));
%newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
%ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
%mkdir(strcat(part2,'\number'));
%newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
%ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end
else if s6=='1'
    flag == '0';
    %part4 =strcat(part1,'\person\P');
    part5 =strcat(part1,'\sparman\R');
   % mkdir(strcat(part1,'\person\p\sort'));
   % part2=strcat(part1,'\person\P\sort');
    mkdir(strcat(part1,'\sparman\R\sort'));
    part3=strcat(part1,'\sparman\R\sort');
    %spar2 = sparsity(part4,flag,part2);  
    spar3 = sparsity(part5,flag,part3,number); 
     if s7=='1' 
%mkdir(strcat(part2,'\percentage'));
%newname2=strcat(part2,'\percentage');
mkdir(strcat(part3,'\percentage'));
newname3=strcat(part3,'\percentage');
%ptob = PtoB(part2,sparsitysta,sparsityend,step,newname2);
ptob1 = PtoB(part3,sparsitysta,sparsityend,step,newname3,prefix,num);
end
if s8=='1' 
%mkdir(strcat(part2,'\number'));
%newname2=strcat(part2,'\number');
mkdir(strcat(part3,'\number'));
newname3=strcat(part3,'\number');
%ptob = PtoB_tiao(part2,sparsitysta_number,sparsityend_number,step_number,newname2); 
ptob1 = PtoB_tiao(part3,sparsitysta_number,sparsityend_number,step_number,newname3,prefix); 
end
    end
end
end
%if s7=='1' 
%mkdir(strcat(part2,'\percentage'));
%newname=strcat(part2,'\percentage');
%ptob = PtoB(dataPath,sparsitysta,sparsityend,step,newname);
%end
%if s8=='1' 
%mkdir(strcat(part2,'\number'));
%newname=strcat(part2,'\number');
%ptob = PtoB_tiao(dataPath,sparsitysta,sparsityend,step,newname); 
%end
tishi='Task is completed !'
 msgbox(tishi);




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


% --------------------------------------------------------------------
function allCon_Sub_AALTC_Callback(hObject, eventdata, handles)
% hObject    handle to allCon_Sub_AALTC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in per_radiobutton.
function per_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to per_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of per_radiobutton


% --- Executes on button press in nuber_radiobutton.
function nuber_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to nuber_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nuber_radiobutton


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
number=get(handles.brain_edit,'String');
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


% --- Executes on button press in fin_pushbutton.
function fin_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to fin_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);



% --------------------------------------------------------------------
function first_step_Callback(hObject, eventdata, handles)
% hObject    handle to first_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open allCon_Sub_AALTC.fig;
close(gcf);
set(0,'currentfigure',allCon_Sub_AALTC);


% --------------------------------------------------------------------
function Create_method_step_Callback(hObject, eventdata, handles)
% hObject    handle to Create_method_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Create_method.fig;
close(gcf);
set(0,'currentfigure',Create_method);


% --------------------------------------------------------------------
function Order_step_Callback(hObject, eventdata, handles)
% hObject    handle to Order_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Order.fig;
close(gcf);
set(0,'currentfigure',Order);


% --------------------------------------------------------------------
function Intercepted_step_Callback(hObject, eventdata, handles)
% hObject    handle to Intercepted_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Intercepted.fig;
close(gcf);
set(0,'currentfigure',Intercepted);



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



function brain_edit_Callback(hObject, eventdata, handles)
% hObject    handle to brain_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of brain_edit as text
%        str2double(get(hObject,'String')) returns contents of brain_edit as a double


% --- Executes during object creation, after setting all properties.
function brain_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brain_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Property_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to Property_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Cal_property_Callback(hObject, eventdata, handles)
% hObject    handle to Cal_property (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Cal_property.fig;
close(gcf);
set(0,'currentfigure',Cal_property);


% --------------------------------------------------------------------
function non_paramentic_pt_Callback(hObject, eventdata, handles)
% hObject    handle to non_paramentic_pt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open non_paramentic_pt.fig;
close(gcf);
set(0,'currentfigure',non_paramentic_pt);


% --------------------------------------------------------------------
function participution_Callback(hObject, eventdata, handles)
% hObject    handle to participution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open participution.fig;
close(gcf);
set(0,'currentfigure',participution);


% --------------------------------------------------------------------
function Mod_Callback(hObject, eventdata, handles)
% hObject    handle to Mod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Make_mod_Callback(hObject, eventdata, handles)
% hObject    handle to Make_mod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Mod.fig;
close(gcf);
set(0,'currentfigure',Mod);


% --------------------------------------------------------------------
function ReadTimeCourse_Callback(hObject, eventdata, handles)
% hObject    handle to ReadTimeCourse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function ReadTime_Course_Callback(hObject, eventdata, handles)
% hObject    handle to ReadTime_Course (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Read_TimeCourse.fig;
close(gcf);
set(0,'currentfigure',Read_TimeCourse);


% --------------------------------------------------------------------
function independet_Callback(hObject, eventdata, handles)
% hObject    handle to independet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open independent.fig;
close(gcf);
set(0,'currentfigure',independent);


% --------------------------------------------------------------------
function fisher_z_tran_Callback(hObject, eventdata, handles)
% hObject    handle to fisher_z_tran (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open fisher_z_tran.fig;
close(gcf);
set(0,'currentfigure',fisher_z_tran);


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EDandsimler_Callback(hObject, eventdata, handles)
% hObject    handle to EDandsimler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open EDandsimler.fig;
close(gcf);
set(0,'currentfigure',EDandsimler);


% --------------------------------------------------------------------
function model_Callback(hObject, eventdata, handles)
% hObject    handle to model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Model.fig;
close(gcf);
set(0,'currentfigure',Model);


% --------------------------------------------------------------------
function property_Callback(hObject, eventdata, handles)
% hObject    handle to property (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Property.fig;
close(gcf);
set(0,'currentfigure',Property);


% --------------------------------------------------------------------
function Similarityofnetwork_Callback(hObject, eventdata, handles)
% hObject    handle to Similarityofnetwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Similarityofnetwork.fig;
close(gcf);
set(0,'currentfigure',Similarityofnetwork);


% --------------------------------------------------------------------
function Maxdifferentmodel_Callback(hObject, eventdata, handles)
% hObject    handle to Maxdifferentmodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Maxdifferentmodel.fig;
close(gcf);
set(0,'currentfigure',Maxdifferentmodel);


% --------------------------------------------------------------------
function svc_Callback(hObject, eventdata, handles)
% hObject    handle to svc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open svc.fig;
close(gcf);
set(0,'currentfigure',svc);


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open OderEvalue.fig;
close(gcf);
set(0,'currentfigure',OderEvalue);


% --------------------------------------------------------------------
function Normalized_Callback(hObject, eventdata, handles)
% hObject    handle to Normalized (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open normalized.fig;
close(gcf);
set(0,'currentfigure',normalized);


% --------------------------------------------------------------------
function TTest_Callback(hObject, eventdata, handles)
% hObject    handle to TTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open Ttest.fig;
close(gcf);
set(0,'currentfigure',Ttest);
