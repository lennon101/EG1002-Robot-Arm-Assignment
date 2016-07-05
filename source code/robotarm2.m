

function varargout = robotarm2(varargin)
% ROBOTARM2 MATLAB code for robotarm2.fig
%      ROBOTARM2, by itself, creates a new ROBOTARM2 or raises the existing
%      singleton*.
%
%      H = ROBOTARM2 returns the handle to a new ROBOTARM2 or the handle to
%      the existing singleton*.
%
%      ROBOTARM2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOTARM2.M with the given input arguments.
%
%      ROBOTARM2('Property','Value',...) creates a new ROBOTARM2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before robotarm2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to robotarm2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help robotarm2

% Last Modified by GUIDE v2.5 16-May-2012 19:03:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @robotarm2_OpeningFcn, ...
                   'gui_OutputFcn',  @robotarm2_OutputFcn, ...
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


% --- Executes just before robotarm2 is made visible.
function robotarm2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to robotarm2 (see VARARGIN)

clc

% Choose default command line output for robotarm2
handles.output = hObject;

handles.oncethru = 0

    set(handles.axes, 'xlim', [-10 10])
    set(handles.axes, 'ylim', [-10 10])

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes robotarm2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = robotarm2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in graph_button.
function graph_button_Callback(hObject, eventdata, handles)


%clear current axis
cla


x = get(handles.x_edit, 'string')
y = get(handles.y_edit, 'string')

object_handle = hObject;

if handles.oncethru == 0 
    handles.x1 = str2num(x);
    handles.y1 = str2num(y);
    [handles.x11,handles.y11,handles.x21,handles.y21] = calculate(object_handle,handles);
else
    handles.x2 = str2num(x);
    handles.y2 = str2num(y);
    [x12,y12,x22,y22] = calculate(object_handle,handles);
end

%step size of movement of arm
s= 60;
if handles.oncethru == 0
    hold all
    plot([0, handles.x11],[0,handles.y11],'b','linewidth',4,'Marker', 'o','MarkerEdgeColor','r','MarkerSize',6);
    plot([handles.x11, handles.x21],[handles.y11,handles.y21],'b','linewidth',4, 'Marker', 'o','MarkerEdgeColor','r','MarkerSize',6);
    plot([handles.x21, handles.x1], [handles.y21, handles.y1],'b','linewidth',4,'Marker', 'o','MarkerEdgeColor','r','MarkerSize',6);
    set_range(handles,object_handle)

else
    x1vec = linspace(handles.x11,x12,s);
    y1vec = linspace(handles.y11,y12,s);
    
    x2vec = linspace(handles.x21,x22,s);
    y2vec = linspace(handles.y21,y22,s);
    
    x3vec = linspace(handles.x1,handles.x2,s);
    y3vec = linspace(handles.y1,handles.y2,s);
    
    for i = 1:s
        cla
        %plot the three lengths
        plot([0,x1vec(i),x2vec(i),x3vec(i)],[0,y1vec(i),y2vec(i),y3vec(i)],'b','linewidth',3,'Marker', 'o','MarkerEdgeColor','r','MarkerSize',6)
        pause(.05)
        set_range(handles,object_handle)
        hold all
        
    end
    
    %the second values of x,y are now saved into old structure to be
    %used as starting point for next movement of arm
    handles.x1 = handles.x2
    handles.y1 = handles.y2
    [handles.x11,handles.y11,handles.x21,handles.y21] = calculate(object_handle,handles);
end

set_range(handles,object_handle)

handles.oncethru = 1;

% Update handles structure
guidata(hObject, handles);

function set_range(handles,object_handle)
%get the values of two sides for the first triangle
L1 = str2num(get(handles.edita, 'string'));
L2 = str2num(get(handles.editb, 'string'));
L3 = str2num(get(handles.editc, 'string'));

handles.Radius = L1 + L2 + L3;

hold all

    [x,y] = cylinder(handles.Radius,200);
    plot(x(1,:),y(1,:))
    %axis equal    
if handles.Radius > 10
    set(handles.axes, 'xlim', [-handles.Radius handles.Radius])
    set(handles.axes, 'ylim', [-handles.Radius handles.Radius])
else
    set(handles.axes, 'xlim', [-10 10])
    set(handles.axes, 'ylim', [-10 10])
end
% Update handles structure
guidata(object_handle, handles);

function [x1,y1,x2,y2] = calculate(object_handle,handles)

%get the values of two sides for the first triangle
L1 = str2num(get(handles.edita, 'string'));
L2 = str2num(get(handles.editb, 'string'));
L3 = str2num(get(handles.editc, 'string'));

handles.Radius = L1 + L2 + L3;

%calc the hypotenuse 
H = calc_hyp(handles);

%lenght of hypotenuse between L2 and L3
h2 = H - L1;

%calulate the angle needed between the two given lengths Ll and L2
ang_L1L2 = acosd((L2^2 + h2^2 - L3^2)/(2*L2*h2));
set(handles.angB_txt, 'string', ['size of angle between L1 & L2 is: ', num2str(ang_L1L2)])


%perform a variety of error checks in order to force user to input correct
%lenghts
if (L1 + L2 + L3) <= H
    msgbox('error: co-ordinate (x,y) is outside the range of the given lengths')
elseif abs(h2) >= L2 + L3
    msgbox('error: Length 1 is too long!')
 elseif ang_L1L2 >= 180 
     msgbox('error: Length 3 is too long!')
elseif ang_L1L2 <= 0
    msgbox('error: Lenght 1 is too long!')
elseif L2 >= H
    msgbox('error: Length 2 is too long!')
else
    if handles.oncethru == 0
        ang_A = atand(handles.y1/handles.x1);
        set(handles.angA_txt, 'string', ['size of angle between 0 & L1 is: ', num2str(ang_A)])
        
        %force x values to be negative if required
        if handles.x1 < 0
            %find (x,y) coordinates of Joint at A and B
            x1 = -(L1 * (cosd(ang_A)));
            y1 = -(L1 * (sind(ang_A)));
            %find (x,y) coordinates of Joint at B and C
            x2 = -(L1*(cosd(ang_A)) + L2*(cosd(ang_A + ang_L1L2)));
            y2 = -(L1*(sind(ang_A)) + L2*(sind(ang_A + ang_L1L2)));
        else
            %find (x,y) coordinates of Joint at A and B
            x1 = (L1 * (cosd(ang_A)));
            y1 = (L1 * (sind(ang_A)));
            %find (x,y) coordinates of Joint at B and C
            x2 = L1*(cosd(ang_A)) + L2*(cosd(ang_A + ang_L1L2));
            y2 = L1*(sind(ang_A)) + L2*(sind(ang_A + ang_L1L2));
        end
    else
        %calulate the angle needed between the two given lengths L1
        %and L2
        ang_A = atand(handles.y2/handles.x2);
        set(handles.angA_txt, 'string', ['size of angle between 0 & L1 is: ', num2str(ang_A)])
        
        %force x values to be negative if required
        if handles.x2 < 0
            %find (x,y) coordinates of Joint at A and B
            x1 = -(L1 * (cosd(ang_A)));
            y1 = -(L1 * (sind(ang_A)));
            %find (x,y) coordinates of Joint at B and C
            x2 = -(L1*(cosd(ang_A)) + L2*(cosd(ang_A + ang_L1L2)));
            y2 = -(L1*(sind(ang_A)) + L2*(sind(ang_A + ang_L1L2)));
        else
            %find (x,y) coordinates of Joint at A and B
            x1 = (L1 * (cosd(ang_A)));
            y1 = (L1 * (sind(ang_A)));
            %find (x,y) coordinates of Joint at B and C
            x2 = L1*(cosd(ang_A)) + L2*(cosd(ang_A + ang_L1L2));
            y2 = L1*(sind(ang_A)) + L2*(sind(ang_A + ang_L1L2));
        end
    end
        
    
end

% Update handles structure
guidata(object_handle, handles);



function [length_hyp] = calc_hyp(handles)
if handles.oncethru == 0
length_hyp = (handles.x1^2 + handles.y1^2)^(1/2);
else
length_hyp = (handles.x2^2 + handles.y2^2)^(1/2);
end    
set(handles.disphyp, 'string', ['size of hyp is: ', num2str(length_hyp)])


function edita_Callback(hObject, eventdata, handles)

a = get(hObject, 'string')
% hObject    handle to edita (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edita as text
%        str2double(get(hObject,'String')) returns contents of edita as a double


% --- Executes during object creation, after setting all properties.
function edita_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edita (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editb_Callback(hObject, eventdata, handles)

b = get(hObject, 'string')
% hObject    handle to editb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editb as text
%        str2double(get(hObject,'String')) returns contents of editb as a double


% --- Executes during object creation, after setting all properties.
function editb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editc_Callback(hObject, eventdata, handles)

c = get(hObject, 'string')
% hObject    handle to editc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editc as text
%        str2double(get(hObject,'String')) returns contents of editc as a double


% --- Executes during object creation, after setting all properties.
function editc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_edit_Callback(hObject, eventdata, handles)
% hObject    handle to x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_edit as text
%        str2double(get(hObject,'String')) returns contents of x_edit as a double




% --- Executes during object creation, after setting all properties.
function x_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_edit_Callback(hObject, eventdata, handles)
% hObject    handle to y_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_edit as text
%        str2double(get(hObject,'String')) returns contents of y_edit as a double


% --- Executes during object creation, after setting all properties.
function y_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in range_button.
function range_button_Callback(hObject, eventdata, handles)
% hObject    handle to range_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%get the values of two sides for the first triangle
object_handle = hObject;
cla

set_range(handles,object_handle)
