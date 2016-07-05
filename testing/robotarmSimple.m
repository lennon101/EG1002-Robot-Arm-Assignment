function varargout = robotarmSimple(varargin)
% ROBOTARMSIMPLE MATLAB code for robotarmSimple.fig
%      ROBOTARMSIMPLE, by itself, creates a new ROBOTARMSIMPLE or raises the existing
%      singleton*.
%
%      H = ROBOTARMSIMPLE returns the handle to a new ROBOTARMSIMPLE or the handle to
%      the existing singleton*.
%
%      ROBOTARMSIMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOTARMSIMPLE.M with the given input arguments.
%
%      ROBOTARMSIMPLE('Property','Value',...) creates a new ROBOTARMSIMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before robotarmSimple_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to robotarmSimple_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help robotarmSimple

% Last Modified by GUIDE v2.5 09-May-2012 20:03:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @robotarmSimple_OpeningFcn, ...
                   'gui_OutputFcn',  @robotarmSimple_OutputFcn, ...
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


% --- Executes just before robotarmSimple is made visible.
function robotarmSimple_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to robotarmSimple (see VARARGIN)

% Choose default command line output for robotarmSimple
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes robotarmSimple wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc


% --- Outputs from this function are returned to the command line.
function varargout = robotarmSimple_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function A_edit_Callback(hObject, eventdata, handles)
% hObject    handle to A_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A_edit as text
%        str2double(get(hObject,'String')) returns contents of A_edit as a double


% --- Executes during object creation, after setting all properties.
function A_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B_edit_Callback(hObject, eventdata, handles)
% hObject    handle to B_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B_edit as text
%        str2double(get(hObject,'String')) returns contents of B_edit as a double


% --- Executes during object creation, after setting all properties.
function B_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_edit_Callback(hObject, eventdata, handles)
% hObject    handle to C_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_edit as text
%        str2double(get(hObject,'String')) returns contents of C_edit as a double


% --- Executes during object creation, after setting all properties.
function C_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to L1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L1_edit as text
%        str2double(get(hObject,'String')) returns contents of L1_edit as a double


% --- Executes during object creation, after setting all properties.
function L1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to L2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L2_edit as text
%        str2double(get(hObject,'String')) returns contents of L2_edit as a double


% --- Executes during object creation, after setting all properties.
function L2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L3_edit_Callback(hObject, eventdata, handles)
% hObject    handle to L3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L3_edit as text
%        str2double(get(hObject,'String')) returns contents of L3_edit as a double


% --- Executes during object creation, after setting all properties.
function L3_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L3_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calc_Button.
function Calc_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Calc_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
hold all

A = str2num(get(handles.A_edit, 'string'));
B = str2num(get(handles.B_edit, 'string'));
C = str2num(get(handles.C_edit, 'string'));

L1 = str2num(get(handles.L1_edit, 'string'));
L2 = str2num(get(handles.L2_edit, 'string'));
L3 = str2num(get(handles.L3_edit, 'string'));

%find (x,y) coordinates of Joint at A and B
x1 = (L1 * (cosd(A)));
y1 = (L1 * (sind(A)));

plot([0, x1],[0,y1]);

%find (x,y) coordinates of Joint at B and C
x2 = L1*(cosd(A)) + L2*(cosd(A +B));
y2 = L1*(sind(A)) + L2*(sind(A +B));

plot([x1, x2],[y1,y2]);

%find (x,y) coordinates of tip of L3
x3 = L1*(cosd(A)) + L2*(cosd(A +B)) + L3*(cosd(A+B+C));
y3 = L1*(sind(A)) + L2*(sind(A +B)) + L3*(sind(A+B+C));

plot([x2, x3],[y2,y3]);

%set(handles.axes, 'xlim', [0,max(x3,y3)]);
%set(handles.axes, 'ylim', [0,max(x3,y3)]);
