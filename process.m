function varargout = process(varargin)
% PROCESS MATLAB code for process.fig
%      PROCESS, by itself, creates a new PROCESS or raises the existing
%      singleton*.
%
%      H = PROCESS returns the handle to a new PROCESS or the handle to
%      the existing singleton*.
%
%      PROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESS.M with the given input arguments.
%
%      PROCESS('Property','Value',...) creates a new PROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before process_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to process_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help process

% Last Modified by GUIDE v2.5 20-May-2022 11:55:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @process_OpeningFcn, ...
                   'gui_OutputFcn',  @process_OutputFcn, ...
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


% --- Executes just before process is made visible.
function process_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to process (see VARARGIN)

% Choose default command line output for process
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes process wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = process_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
publish('process.m');



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
normOrDiff=get(handles.edit3, 'String');
points=getappdata(0,'points');
K = menu('Choose a process','Create a fourth degree equation','Create a third degree equation');
points=readtable(points);
points = table2array(points);
fprintf("x\t\t\ty\n");
for i=1:length(points(:,1))
    fprintf('%f\t%f\n',points(i,1),points(i,2));
end
if(K==1)
    polyNom = polyfit(points(:,1),points(:,2),4);
    difPolyNom = diff(polyNom);
    if strcmp(normOrDiff,"Normal")
        set(handles.edit2,'string',num2str(polyNom(1))+"x^4 + "+num2str(polyNom(2))+"x^3 + "+num2str(polyNom(3))+"x^2 +"+num2str(polyNom(4))+ "x +"+num2str(polyNom(5)));
    else
        set(handles.edit2,'string',num2str(difPolyNom(1))+"x^3 + "+num2str(difPolyNom(2))+"x^2 +"+num2str(difPolyNom(3))+ "x +"+num2str(difPolyNom(4)));
    end
else
    polyNom = polyfit(points(:,1),points(:,2),3);
    difPolyNom = diff(polyNom);
    if strcmp(normOrDiff,"Normal")
        set(handles.edit2,'string',num2str(polyNom(1))+"x^3 + "+num2str(polyNom(2))+"x^2 +"+num2str(polyNom(3))+ "x +"+num2str(polyNom(4)));
    else
        set(handles.edit2,'string',num2str(difPolyNom(1))+"x^2 +"+num2str(difPolyNom(2))+ "x +"+num2str(difPolyNom(3)));
    end
end

newVal = polyval(polyNom,points(:,1));
newDifVal = polyval(difPolyNom,points(:,1));
axes(handles.axes1);
plot(points(:,1),points(:,2));
axes(handles.axes2);
plot(points(:,1),points(:,2));
axes(handles.axes5);
plot(points(:,1),newVal);
axes(handles.axes6);
plot(points(:,1),newDifVal);


