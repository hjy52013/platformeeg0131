function varargout = Cal_property(varargin)
%牛会兰，2015-8-5
% CAL_PROPERTY M-file for Cal_property.fig
%      CAL_PROPERTY, by itself, creates a new CAL_PROPERTY or raises the existing
%      singleton*.
%
%      H = CAL_PROPERTY returns the handle to a new CAL_PROPERTY or the handle to
%      the existing singleton*.
%
%      CAL_PROPERTY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAL_PROPERTY.M with the given input arguments.
%
%      CAL_PROPERTY('Property','Value',...) creates a new CAL_PROPERTY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Cal_property_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Cal_property_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cal_property

% Last Modified by GUIDE v2.5 03-Jan-2015 09:43:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cal_property_OpeningFcn, ...
                   'gui_OutputFcn',  @Cal_property_OutputFcn, ...
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


% --- Executes just before Cal_property is made visible.
function Cal_property_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cal_property (see VARARGIN)

% Choose default command line output for Cal_property
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Cal_property wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Cal_property_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function type_Callback(hObject, eventdata, handles)
% hObject    handle to type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of type as text
%        str2double(get(hObject,'String')) returns contents of type as a double


% --- Executes during object creation, after setting all properties.
function type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input as text
%        str2double(get(hObject,'String')) returns contents of input as a double


% --- Executes during object creation, after setting all properties.
function input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inputbutton.
function inputbutton_Callback(hObject, eventdata, handles)
% hObject    handle to inputbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.input,'String',directoryname);


function results_Callback(hObject, eventdata, handles)
% hObject    handle to results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of results as text
%        str2double(get(hObject,'String')) returns contents of results as a double


% --- Executes during object creation, after setting all properties.
function results_CreateFcn(hObject, eventdata, handles)
% hObject    handle to results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resultsbutton.
function resultsbutton_Callback(hObject, eventdata, handles)
% hObject    handle to resultsbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.results,'String',directoryname);

% --- Executes on button press in Calulation.
function Calulation_Callback(hObject, eventdata, handles)
% hObject    handle to Calulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in finish.
first=str2num(get(handles.first_edit,'String'));
last=str2num(get(handles.last_edit,'String'));
step=str2num(get(handles.step_edit,'String'));
%%
% NetMes_Bin=cell(22,2);
str1 = get(handles.input,'String');
str2 = get(handles.results,'String');
prefix = get(handles.type,'String');

str3 =strcat(str2,'\',prefix,'Intermediate results');
number = get(handles.number,'String');
a = str2num(number);
filename= get(handles.filename_edit,'String');
if length(str1)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(str2)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
s1 =num2str( get(handles.degree,'Value'));
s2 =num2str( get(handles.strength,'Value'));
s3 =num2str( get(handles.assortativity,'Value'));
s4 =num2str( get(handles.density,'Value'));
s5 =num2str( get(handles.cluster,'Value'));
s6 =num2str( get(handles.transitivity,'Value'));
s7 = num2str( get(handles.globle,'Value'));
s8 = num2str( get(handles.local,'Value'));
s9 =num2str( get(handles.Node,'Value'));
s10 =num2str( get(handles.modularity,'Value'));
s11 =num2str( get(handles.modullou,'Value'));
s12 =num2str( get(handles.charpath,'Value'));
s13 =num2str( get(handles.nodebet,'Value'));
s14 =num2str( get(handles.edgebet,'Value'));
s15 = num2str( get(handles.lam,'Value'));
% count = 0;
num = 0;
if s9=='1'  
      bform = Bform(str1,str3,number );  
      effciency_node (str3,str2,prefix,filename,first,last,step,number);
end

if (s1=='1' | s2=='1' | s3=='1' | s4=='1' | s5=='1' | s6=='1' | s7=='1' | s8=='1' | s10=='1' | s11=='1' | s12=='1' | s13=='1' | s14=='1' | s15=='1')
%%
% mkdir(strcat(str2,'/',prefix,'property/intermaediate1'));%二值矩阵存储路径
str11 = strcat(str2,'\',prefix,'intermaediate1');%二值矩阵的保存路径
str12 =strcat(str2,'\',prefix,'property');%属性的保存路径
 BCTpropertydataform( str1 ,str11,number); %生成二值矩阵

a1 = dir(str11);
b1 = length(a1);

for i1=1:b1   %被试文件夹
    filename1=[a1(i1).name];
    str51='.';str52='..';
    if strcmp(filename1,str51)==1 
    elseif strcmp(filename1,str52)==1 
    else 
        inPath1 = strcat(str11,'\',filename1); 
        a2=dir(inPath1);
        b2 = length(a2);
        for i2=1:b2   %稀疏度文件
            filename2=[a2(i2).name];%n
            if strcmp(filename2,str51)==1 
            elseif strcmp(filename2,str52)==1 
            else                                                        
                inPath2 = strcat(inPath1,'\',filename2); 
                display(inPath2);               
                R=importdata(inPath2); %读取二值矩阵
   
                count = num;%控制属性存储的行
                              
                
            
if s1=='1'
    count = count + 1;             
                    NetMes_Bin{count,1}=degrees_und(R);
                    NetMes_Bin{count,2}='degrees';
                    count = count + 1;
                    NetMes_Bin{count,1}=mean(NetMes_Bin{count-1,1});
                    NetMes_Bin{count,2}='mean-degree';
                    NetMes_Bin{count-1,3}=NetMes_Bin{count-1,1}/NetMes_Bin{count,1};
                     %     degree= getNodedegreeproperty (str1,str2,prefix,filename,first,last,step);
end
if s2=='1'
   count = count + 1;             
                    NetMes_Bin{count,1}=sum(R);
                    NetMes_Bin{count,2}='strengths';
                    count = count + 1;
                    NetMes_Bin{count,1}=mean(NetMes_Bin{count-1,1});
                    NetMes_Bin{count,2}='mean-strengths';
                    NetMes_Bin{count-1,3}=NetMes_Bin{count-1,1}/NetMes_Bin{count,1};
end
if s3=='1'
     count = count + 1;             
                   NetMes_Bin{count,1}=assortativity(R,0);
                   NetMes_Bin{count,2}='assortativity';
end
if s4=='1'  
     count = count + 1;
     NetMes_Bin{count,1}=density_und(R);
     NetMes_Bin{count,2}='density';
end
if s5=='1'
     count = count + 1;
     NetMes_Bin{count,1}=clustering_coef_bu(R);
     NetMes_Bin{count,2}='clustering-coefs'; 
     count = count + 1;
     NetMes_Bin{count,1}=mean(NetMes_Bin{count-1,1});
     NetMes_Bin{count,2}='mean-clustering-coef';
     NetMes_Bin{count-1,3}=NetMes_Bin{count-1,1}/NetMes_Bin{count,1};
end
if s6=='1'
      count = count + 1;
      NetMes_Bin{count,1}=transitivity_bu(R);
      NetMes_Bin{count,2}='transitivity';
end
if  s7 == '1'
      count = count + 1;
      NetMes_Bin{count,1}=efficiency(R);
      NetMes_Bin{count,2}='global-efficiency';
end
if s8=='1'
    count = count + 1;
     NetMes_Bin{count,1}=efficiency(R,1);
     NetMes_Bin{count,2}='local-efficiency'; 
     count = count + 1;
     NetMes_Bin{count,1}=mean(NetMes_Bin{count-1,1});
     NetMes_Bin{count,2}='mean-local-efficiency';
     NetMes_Bin{count-1,3}=NetMes_Bin{count-1,1}/NetMes_Bin{count,1};
end

%将节点效率与其他属性合并
if s9=='1'
    nodePath = strcat(str2,'\',prefix,'effciency_node','\',prefix,'EN',filename1,'\',filename2);
    file11=importdata(nodePath); %读取节点效率稀疏度文件
    count = count + 1;
    NetMes_Bin{count,1}=file11;
    NetMes_Bin{count,2}='node-efficiency';
end

if s10=='1'
     count = count + 1;  
     [Mi,NetMes_Bin{count,1}]=modularity_und(R);
      NetMes_Bin{count,2}='modularity';      
end
if s11=='1'
    count = count + 1;  
                  [Mi_L,NetMes_Bin{count,1}]=modularity_louvain_und(R);
                 %  NetMes_Bin{count,1}=modularity_louvain_und(R);
                   NetMes_Bin{count,2}='modularity-louvain';
end
if s12=='1'
    count = count + 1;
    NetMes_Bin{count,1}=charpath(distance_bin(R));
    NetMes_Bin{count,2}='characteristic-path-length';
end
if s13=='1'
     count = count + 1;             
                    NetMes_Bin{count,1}=betweenness_bin(R);
                    NetMes_Bin{count,2}='node-betweenness';
                    count = count + 1;
                    NetMes_Bin{count,1}=mean(NetMes_Bin{count-1,1});
                    NetMes_Bin{count,2}='mean-node-betweenness';
                    NetMes_Bin{count-1,3}=NetMes_Bin{count-1,1}/NetMes_Bin{count,1};
end
if s14=='1'
    count = count + 1;             
                    NetMes_Bin{count,1}=edge_betweenness_bin(R);
                    NetMes_Bin{count,2}='edge-betweenness';
                    count = count + 1;
                    NetMes_Bin{count,1}=mean(mean(NetMes_Bin{count-1,1}));
                    NetMes_Bin{count,2}='mean-edge-betweenness';
                    NetMes_Bin{count-1,3}=NetMes_Bin{count-1,1}/NetMes_Bin{count,1};
end



if s15=='1'
         Iter=str2num(get(handles.iter,'String'));
         count = count + 1; 
         [NetMes_Bin{count+1,1},NetMes_Bin{count,1},NetMes_Bin{count+2,1}] = RandomNetGen_SameDeg(R,Iter);
         NetMes_Bin{count ,2}='lambda_N';
         NetMes_Bin{count + 1 ,2}='gamma_N';
         NetMes_Bin{count + 2,2}='sigma_N';
end




outPath1 = strcat(str12,'\',filename1,'\',filename2);
%                 display(outPath1);
                mkdir(outPath1);
                GroupName = prefix; %文件名
                save(strcat(outPath1,'\',['NetMesBin_f_' GroupName],'.mat'),'NetMes_Bin');
            end
        end
    end
end
end

tishi='Task is completed !'
msgbox(tishi); 

function finish_Callback(hObject, eventdata, handles)
% hObject    handle to finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);


function path1_Callback(hObject, eventdata, handles)
% hObject    handle to path1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path1 as text
%        str2double(get(hObject,'String')) returns contents of path1 as a double


% --- Executes during object creation, after setting all properties.
function path1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inbutton.
function inbutton_Callback(hObject, eventdata, handles)
% hObject    handle to inbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.input1,'String',directoryname);

% --- Executes on button press in pathbutton.
function pathbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pathbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directoryname = uigetdir('C:\Users');
set(handles.path1,'String',directoryname);

% --- Executes on button press in getonedegree.
function getonedegree_Callback(hObject, eventdata, handles)
% hObject    handle to getonedegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1 = get(handles.input1,'String');
str2 = get(handles.path1,'String');
str3 = get(handles.number,'String');
first=str2num(get(handles.first_edit,'String'));
last=str2num(get(handles.last_edit,'String'));
step=str2num(get(handles.step_edit,'String'));
filename= get(handles.filename_edit,'String');
first1=get(handles.first_edit,'String');
%first，last，step与first1，last1，step1的区别在于一个代表数字一个代表字符串
if length(first1)<=0;
    errordlg('first can not be empty !')
    return;
end
last1=get(handles.last_edit,'String');
if length(last1)<=0;
    errordlg('last can not be empty !')
    return;
end
step1=get(handles.step_edit,'String');
if length(step1)<=0;
    errordlg('step can not be empty !')
    return;
end
if length(str1)<=0;
    errordlg('Input parameters can not be empty !')
 return;
end
if length(str2)<=0;
    errordlg('Storage address can not be empty !')
 return;
end
if length(str3)<=0;
    errordlg('Number of ROIs  can not be empty !')
 return;
end
if length(filename)<=0;
    errordlg('file name can not be empty !')
 return;
end
getoneDegrees(str1,str2,str3,first,step,last,filename);
tishi='Task is completed !'
 msgbox(tishi);

% --- Executes on button press in strength.
function strength_Callback(hObject, eventdata, handles)
% hObject    handle to strength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.strength,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.strength,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of strength


% --- Executes on button press in cluster.
function cluster_Callback(hObject, eventdata, handles)
% hObject    handle to cluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.cluster,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.cluster,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of cluster


% --- Executes on button press in degree.
function degree_Callback(hObject, eventdata, handles)
% hObject    handle to degree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.degree,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.degree,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of degree


% --- Executes on button press in charpath.
function charpath_Callback(hObject, eventdata, handles)
% hObject    handle to charpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.charpath,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.charpath,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of charpath


% --- Executes on button press in globle.
function globle_Callback(hObject, eventdata, handles)
% hObject    handle to globle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.globle,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.globle,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of globle


% --- Executes on button press in local.
function local_Callback(hObject, eventdata, handles)
% hObject    handle to local (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.local,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.local,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of local


% --- Executes on button press in assortativity.
function assortativity_Callback(hObject, eventdata, handles)
% hObject    handle to assortativity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.assortativity,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.assortativity,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of assortativity




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



function filename_edit_Callback(hObject, eventdata, handles)
% hObject    handle to filename_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filename_edit as text
%        str2double(get(hObject,'String')) returns contents of filename_edit as a double


% --- Executes during object creation, after setting all properties.
function filename_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename_edit (see GCBO)
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


% --- Executes on button press in Node.
function Node_Callback(hObject, eventdata, handles)
% hObject    handle to Node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.Node,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
first=get(handles.first_edit,'String');
if length(first)<=0;
    set(handles.Node,'Value',0)
    errordlg('first can not be empty !')
    return;
end
last=get(handles.last_edit,'String');
if length(last)<=0;
    set(handles.Node,'Value',0)
    errordlg('last can not be empty !')
    return;
end
step=get(handles.step_edit,'String');
if length(step)<=0;
    set(handles.Node,'Value',0)
    errordlg('step can not be empty !')
    return;
end
filename= get(handles.filename_edit,'String');
if length(filename)<=0;
    set(handles.Node,'Value',0)
    errordlg('filename can not be empty !')
    return;
end
% Hint: get(hObject,'Value') returns toggle state of Node


% --- Executes on button press in density.
function density_Callback(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.density,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.density,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end

% Hint: get(hObject,'Value') returns toggle state of density


% --- Executes on button press in transitivity.
function transitivity_Callback(hObject, eventdata, handles)
% hObject    handle to transitivity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.transitivity,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.transitivity,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end

% Hint: get(hObject,'Value') returns toggle state of transitivity


% --- Executes on button press in modularity.
function modularity_Callback(hObject, eventdata, handles)
% hObject    handle to modularity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.modularity,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.modularity,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end

% Hint: get(hObject,'Value') returns toggle state of modularity


% --- Executes on button press in modullou.
function modullou_Callback(hObject, eventdata, handles)
% hObject    handle to modullou (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.modullou,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.modullou,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end

% Hint: get(hObject,'Value') returns toggle state of modullou


% --- Executes on button press in nodebet.
function nodebet_Callback(hObject, eventdata, handles)
% hObject    handle to nodebet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.nodebet,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.nodebet,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end

% Hint: get(hObject,'Value') returns toggle state of nodebet


% --- Executes on button press in edgebet.
function edgebet_Callback(hObject, eventdata, handles)
% hObject    handle to edgebet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.edgebet,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.edgebet,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end

% Hint: get(hObject,'Value') returns toggle state of edgebet


% --- Executes on button press in lam.
function lam_Callback(hObject, eventdata, handles)
% hObject    handle to lam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
number=get(handles.number,'String');
if length(number)<=0;
    set(handles.lam,'Value',0)
    errordlg('Number of ROIs can not be empty !')
    return;
end
treatment=get(handles.type,'String');
if length(treatment)<=0;
    set(handles.lam,'Value',0)
    errordlg('Treatment type can not be empty !')
    return;
end
Iter=get(handles.iter,'String');
if length(Iter)<=0;
    set(handles.lam,'Value',0)
    errordlg('null_Iter can not be empty !')
    return;
end

% Hint: get(hObject,'Value') returns toggle state of lam



function iter_Callback(hObject, eventdata, handles)
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iter as text
%        str2double(get(hObject,'String')) returns contents of iter as a double


% --- Executes during object creation, after setting all properties.
function iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
