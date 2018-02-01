function varargout = Similarityofnetwork(varargin)
% SIMILARITYOFNETWORK M-file for Similarityofnetwork.fig
%      SIMILARITYOFNETWORK, by itself, creates a new SIMILARITYOFNETWORK or raises the existing
%      singleton*.
%
%      H = SIMILARITYOFNETWORK returns the handle to a new SIMILARITYOFNETWORK or the handle to
%      the existing singleton*.
%
%      SIMILARITYOFNETWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMILARITYOFNETWORK.M with the given input arguments.
%
%      SIMILARITYOFNETWORK('Property','Value',...) creates a new SIMILARITYOFNETWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Similarityofnetwork_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Similarityofnetwork_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Similarityofnetwork

% Last Modified by GUIDE v2.5 05-Jun-2014 10:28:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Similarityofnetwork_OpeningFcn, ...
                   'gui_OutputFcn',  @Similarityofnetwork_OutputFcn, ...
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


% --- Executes just before Similarityofnetwork is made visible.
function Similarityofnetwork_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Similarityofnetwork (see VARARGIN)

% Choose default command line output for Similarityofnetwork
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Similarityofnetwork wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Similarityofnetwork_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_in_Callback(hObject, eventdata, handles)
% hObject    handle to edit_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_in as text
%        str2double(get(hObject,'String')) returns contents of edit_in as a double


% --- Executes during object creation, after setting all properties.
function edit_in_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_in.
function pushbutton_in_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_in (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_in,'String',directoryname);


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


% --- Executes on button press in pushbutton_intput.
function pushbutton_intput_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_intput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_intput,'String',directoryname);


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


% --- Executes on button press in pushbutton_out.
function pushbutton_out_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.edit_out,'String',directoryname);


function edit_Pnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Pnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Pnum as text
%        str2double(get(hObject,'String')) returns contents of edit_Pnum as a double


% --- Executes during object creation, after setting all properties.
function edit_Pnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Pnum (see GCBO)
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



function edit_pt_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pt as text
%        str2double(get(hObject,'String')) returns contents of edit_pt as a double


% --- Executes during object creation, after setting all properties.
function edit_pt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pl_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pl as text
%        str2double(get(hObject,'String')) returns contents of edit_pl as a double


% --- Executes during object creation, after setting all properties.
function edit_pl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sf_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sf as text
%        str2double(get(hObject,'String')) returns contents of edit_sf as a double


% --- Executes during object creation, after setting all properties.
function edit_sf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_st_Callback(hObject, eventdata, handles)
% hObject    handle to edit_st (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_st as text
%        str2double(get(hObject,'String')) returns contents of edit_st as a double


% --- Executes during object creation, after setting all properties.
function edit_st_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_st (see GCBO)
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



function edit_rnfn_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rnfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rnfn as text
%        str2double(get(hObject,'String')) returns contents of edit_rnfn as a double


% --- Executes during object creation, after setting all properties.
function edit_rnfn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rnfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_mnfn_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mnfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mnfn as text
%        str2double(get(hObject,'String')) returns contents of edit_mnfn as a double


% --- Executes during object creation, after setting all properties.
function edit_mnfn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mnfn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit_snumber_Callback(hObject, eventdata, handles)
% hObject    handle to edit_snumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_snumber as text
%        str2double(get(hObject,'String')) returns contents of edit_snumber as a double


% --- Executes during object creation, after setting all properties.
function edit_snumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_snumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_cn.
function pushbutton_cn_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
oinputdata1=get(handles.edit_in,'String');
if length(oinputdata1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end

oinputdata2=get(handles.edit_intput,'String');
if length(oinputdata2)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end

ooutput=get(handles.edit_out,'String');
if length(ooutput)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end

Pnumber1= get(handles.edit_Pnum,'String');
if length(Pnumber1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
Pnumber=str2num(Pnumber1);

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

step1= get(handles.edit_st,'String');
if length(step1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
step=str2num(step1);

pfirst1= get(handles.edit_pf,'String');
if length(pfirst1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pfirst=str2num(pfirst1);

plast1= get(handles.edit_pl,'String');
if length(plast1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
plast=str2num(plast1);

pstep1= get(handles.edit_pt,'String');
if length(pstep1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
pstep=str2num(pstep1);

sparsitynumber1= get(handles.edit_snumber,'String');
if length(sparsitynumber1)<=0;
    errordlg('Input parameters Path can not be empty !')
 return;
end
sparsitynumber=str2num(sparsitynumber1);

%属性比较方法
s1 =num2str( get(handles.radiobutton_pc,'Value'));
if s1=='1'
    mkdir(strcat(ooutput,'\Properties Comparative\E value'));
    ooutputdata=strcat(ooutput,'\Properties Comparative\E value');
    EDmodelcalpro(oinputdata1,oinputdata2,ooutputdata,Pnumber,sparsityfilename,first,step,last);
    
    mkdir(strcat(ooutput,'\Properties Comparative\E value order'));
    orderoutputdata=strcat(ooutput,'\Properties Comparative\E value order');
    paixu(ooutputdata,orderoutputdata,Pnumber,pfirst,pstep);
    
     mkdir(strcat(ooutput,'\Properties Comparative\E value AUC'));
     AUCoutputdata=strcat(ooutput,'\Properties Comparative\E value AUC');
     AUC_corr2(ooutputdata,AUCoutputdata,sparsitynumber,sparsityfilename,'calresult',first,last,step,Pnumber);
end

%共同边所占的比例比较方法
s2 =num2str( get(handles.radiobutton_pse,'Value'));
if s2=='1'
    parameterfilename=get(handles.edit_pfn,'String');
    if length(parameterfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    realfilename=get(handles.edit_rnfn,'String');
    if length(realfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    modelfilename=get(handles.edit_mnfn,'String');
    if length(modelfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    mkdir(strcat(ooutput,'\The Proportion of Same Edge\E value'));
    ooutputdata=strcat(ooutput,'\The Proportion of Same Edge\E value');
    tongbian(oinputdata1,oinputdata2,ooutputdata,sparsityfilename,parameterfilename,realfilename,modelfilename,first,last,step,pfirst,plast,pstep,Pnumber);
    
     mkdir(strcat(ooutput,'\The Proportion of Same Edge\E value order'));
    orderoutputdata=strcat(ooutput,'\The Proportion of Same Edge\E value order');
    paixu(ooutputdata,orderoutputdata,Pnumber,pfirst,pstep);
    
     mkdir(strcat(ooutput,'\The Proportion of Same Edge\E value AUC'));
     AUCoutputdata=strcat(ooutput,'\The Proportion of Same Edge\E value AUC');
     AUC_corr2(ooutputdata,AUCoutputdata,sparsitynumber,sparsityfilename,'same',first,last,step,Pnumber);   
end

%pearson比较法
s3 =num2str( get(handles.radiobutton_p,'Value'));
if s3=='1'
     parameterfilename=get(handles.edit_pfn,'String');
    if length(parameterfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    realfilename=get(handles.edit_rnfn,'String');
    if length(realfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    modelfilename=get(handles.edit_mnfn,'String');
    if length(modelfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    mkdir(strcat(ooutput,'\pearson\Epearson value'));
    ooutputdata=strcat(ooutput,'\pearson\pearson value');
    wx_corr2_all(oinputdata1,oinputdata2,ooutputdata,sparsityfilename,parameterfilename,realfilename,modelfilename,first,last,step,pfirst,plast,pstep,Pnumber);
    
    mkdir(strcat(ooutput,'\pearson\pearson value order'));
    orderoutputdata=strcat(ooutput,'\pearson\pearson value order');
    paixu(ooutputdata,orderoutputdata,Pnumber,pfirst,pstep);
    
     mkdir(strcat(ooutput,'\pearson\pearson value AUC'));
     AUCoutputdata=strcat(ooutput,'\pearson\pearson value AUC');
     AUC_corr2(ooutputdata,AUCoutputdata,sparsitynumber,sparsityfilename,'similarJZ',first,last,step,Pnumber);   
end

%Jaccard比较法
s4 =num2str( get(handles.radiobutton_Jaccard,'Value'));
if s4=='1'
     parameterfilename=get(handles.edit_pfn,'String');
    if length(parameterfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    realfilename=get(handles.edit_rnfn,'String');
    if length(realfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    modelfilename=get(handles.edit_mnfn,'String');
    if length(modelfilename)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    
    number1= get(handles.edit_number,'String');
    if length(number1)<=0;
        errordlg('Input parameters Path can not be empty !')
        return;
    end
    number=str2num(number1);

    mkdir(strcat(ooutput,'\Jaccard\Jaccard value'));
    ooutputdata=strcat(ooutput,'\Jaccard\Jaccard value');
    Jaccard_all(oinputdata1,oinputdata2,ooutputdata,sparsityfilename,parameterfilename,realfilename,modelfilename,first,last,step,pfirst,plast,pstep,Pnumber,number);
    
    mkdir(strcat(ooutput,'\Jaccard\Jaccard value order'));
    orderoutputdata=strcat(ooutput,'\Jaccard\Jaccard value order');
    paixu(ooutputdata,orderoutputdata,Pnumber,pfirst,pstep);
    
     mkdir(strcat(ooutput,'\Jaccard\Jaccard value AUC'));
     AUCoutputdata=strcat(ooutput,'\Jaccard\Jaccard value AUC');
     AUC_corr2(ooutputdata,AUCoutputdata,sparsitynumber,sparsityfilename,'Jaccard',first,last,step,Pnumber);   
end

% --- Executes on button press in pushbutton_finish.
function pushbutton_finish_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf)
