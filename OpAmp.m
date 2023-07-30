function varargout = OpAmp(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OpAmp_OpeningFcn, ...
                   'gui_OutputFcn',  @OpAmp_OutputFcn, ...
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




function OpAmp_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);



function varargout = OpAmp_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function editR1_Callback(hObject, eventdata, handles)
 a double
global R1
R1=str2double(get(handles.editR1,'String'))


function editR1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR2_Callback(hObject, eventdata, handles)
 a double
global R2
R2=str2double(get(handles.editR2,'String'))

% --- Executes during object creation, after setting all properties.
function editR2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton1_Callback(hObject, eventdata, handles)
global R1
global R2
global R3
global R
global Vin
global V1
global V2
global V3


selectedItemIdx = get(handles.popupmenuOpAmp,'Value');

if selectedItemIdx == 1
 
    Vout = -R2/R1 * Vin;  
elseif selectedItemIdx == 2
  
    Vout = (1 + R2/R1) * Vin;
elseif selectedItemIdx == 3
  
    Vout = Vin;
elseif selectedItemIdx == 4
 
    Vout = V1 + V2;
elseif selectedItemIdx == 5
  
    Vout = -R * (V1/R1 + V2/R2 + V3/R3);
end
set(handles.textVout,'String',num2str(Vout));
Vout=[num2str(Vout) 'V'];
set(handles.textVout,'String',Vout);


function editVin_Callback(hObject, eventdata, handles)
 a double
global Vin
Vin=str2double(get(handles.editVin,'String'))


function editVin_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function popupmenuOpAmp_Callback(hObject, eventdata, handles)


w=get(handles.popupmenuOpAmp,'Value');
switch w
    case 1
        axes(handles.axes1); 
        imshow(imread('c2.jpg'),[]);
        % DC part
        set(handles.textR1, 'Visible', 'on');
        set(handles.editR1, 'Visible', 'on');

        set(handles.textR2, 'Visible', 'on');
        set(handles.editR2, 'Visible', 'on');

        set(handles.textVin, 'Visible', 'on');
        set(handles.editVin, 'Visible', 'on');

        set(handles.textR, 'Visible', 'off');
        set(handles.editR, 'Visible', 'off');

        set(handles.textR3, 'Visible', 'off');
        set(handles.editR3, 'Visible', 'off');

        set(handles.textV1, 'Visible', 'off');
        set(handles.editV1, 'Visible', 'off');

        set(handles.textV2, 'Visible', 'off');
        set(handles.editV2, 'Visible', 'off');
        
        set(handles.textV3, 'Visible', 'off');
        set(handles.editV3, 'Visible', 'off');
        % AC part
    set(handles.textA1, 'Visible', 'on');
    set(handles.editA1, 'Visible', 'on');

    set(handles.textf1, 'Visible', 'on');
    set(handles.editf1, 'Visible', 'on');

    set(handles.textA2, 'Visible', 'off');
    set(handles.editA2, 'Visible', 'off');  

    set(handles.textf2, 'Visible', 'off');
    set(handles.editf2, 'Visible', 'off');

    set(handles.textA3, 'Visible', 'on');
    set(handles.editphi1, 'Visible', 'on');

    set(handles.textf3, 'Visible', 'off');
    set(handles.editphi2, 'Visible', 'off'); 

    set(handles.textR0ac, 'Visible', 'off');
    set(handles.editR0ac, 'Visible', 'off'); 

    set(handles.textR1ac, 'Visible', 'on');
    set(handles.editR1ac, 'Visible', 'on');

    set(handles.textR2ac, 'Visible', 'on');
    set(handles.editR2ac, 'Visible', 'on');

    set(handles.textR3ac, 'Visible', 'off');
    set(handles.editR3ac, 'Visible', 'off'); 
%------------------------------------------------------------
    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'off');
    set(handles.axes3, 'Visible', 'off');

    legend(handles.axes11,'off'); 
    legend(handles.axes2, 'off');
    legend(handles.axes3, 'off');

    cla(handles.axes11);
    cla(handles.axes2);
    cla(handles.axes3);
    case 2
        axes(handles.axes1);
        imshow(imread('c3.jpg'),[]);
        % DC
        set(handles.textR1, 'Visible', 'on');
        set(handles.editR1, 'Visible', 'on');

        set(handles.textR2, 'Visible', 'on');
        set(handles.editR2, 'Visible', 'on');

        set(handles.textVin, 'Visible', 'on');
        set(handles.editVin, 'Visible', 'on');

        set(handles.textR, 'Visible', 'off');
        set(handles.editR, 'Visible', 'off');

        set(handles.textR3, 'Visible', 'off');
        set(handles.editR3, 'Visible', 'off');

        set(handles.textV1, 'Visible', 'off');
        set(handles.editV1, 'Visible', 'off');

        set(handles.textV2, 'Visible', 'off');
        set(handles.editV2, 'Visible', 'off');
        
        set(handles.textV3, 'Visible', 'off');
        set(handles.editV3, 'Visible', 'off');
        % AC
    set(handles.textA1, 'Visible', 'on');
    set(handles.editA1, 'Visible', 'on');

    set(handles.textf1, 'Visible', 'on');
    set(handles.editf1, 'Visible', 'on');

    set(handles.textA2, 'Visible', 'off');
    set(handles.editA2, 'Visible', 'off');  

    set(handles.textf2, 'Visible', 'off');
    set(handles.editf2, 'Visible', 'off');

    set(handles.textA3, 'Visible', 'on');
    set(handles.editphi1, 'Visible', 'on');

    set(handles.textf3, 'Visible', 'off');
    set(handles.editphi2, 'Visible', 'off'); 

    set(handles.textR0ac, 'Visible', 'off');
    set(handles.editR0ac, 'Visible', 'off'); 

    set(handles.textR1ac, 'Visible', 'on');
    set(handles.editR1ac, 'Visible', 'on');

    set(handles.textR2ac, 'Visible', 'on');
    set(handles.editR2ac, 'Visible', 'on');

    set(handles.textR3ac, 'Visible', 'off');
    set(handles.editR3ac, 'Visible', 'off'); 
%-----------------------------------------------------------------
    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'off');
    set(handles.axes3, 'Visible', 'off');

    legend(handles.axes11,'off'); 
    legend(handles.axes2, 'off');
    legend(handles.axes3, 'off');

    cla(handles.axes11);
    cla(handles.axes2);
    cla(handles.axes3);
    case 3
        axes(handles.axes1); 
        imshow(imread('c4.jpg'),[]);
        % DC
        set(handles.textR1, 'Visible', 'off');
        set(handles.editR1, 'Visible', 'off');

        set(handles.textR2, 'Visible', 'off');
        set(handles.editR2, 'Visible', 'off');

        set(handles.textVin, 'Visible', 'on');
        set(handles.editVin, 'Visible', 'on');

        set(handles.textR, 'Visible', 'off');
        set(handles.editR, 'Visible', 'off');

        set(handles.textR3, 'Visible', 'off');
        set(handles.editR3, 'Visible', 'off');

        set(handles.textV1, 'Visible', 'off');
        set(handles.editV1, 'Visible', 'off');

        set(handles.textV2, 'Visible', 'off');
        set(handles.editV2, 'Visible', 'off');
        
        set(handles.textV3, 'Visible', 'off');
        set(handles.editV3, 'Visible', 'off');
        % AC
    set(handles.textA1, 'Visible', 'on');
    set(handles.editA1, 'Visible', 'on');

    set(handles.textf1, 'Visible', 'on');
    set(handles.editf1, 'Visible', 'on');

    set(handles.textA2, 'Visible', 'off');
    set(handles.editA2, 'Visible', 'off');  

    set(handles.textf2, 'Visible', 'off');
    set(handles.editf2, 'Visible', 'off');

    set(handles.textA3, 'Visible', 'on');
    set(handles.editphi1, 'Visible', 'on');

    set(handles.textf3, 'Visible', 'off');
    set(handles.editphi2, 'Visible', 'off'); 

    set(handles.textR0ac, 'Visible', 'off');
    set(handles.editR0ac, 'Visible', 'off'); 

    set(handles.textR1ac, 'Visible', 'off');
    set(handles.editR1ac, 'Visible', 'off');

    set(handles.textR2ac, 'Visible', 'off');
    set(handles.editR2ac, 'Visible', 'off');

    set(handles.textR3ac, 'Visible', 'off');
    set(handles.editR3ac, 'Visible', 'off'); 
%---------------------------------------------------------
    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'off');
    set(handles.axes3, 'Visible', 'off');

    legend(handles.axes11,'off'); 
    legend(handles.axes2, 'off');
    legend(handles.axes3, 'off');

    cla(handles.axes11);
    cla(handles.axes2);
    cla(handles.axes3); 
    case 4
        axes(handles.axes1); 
        imshow(imread('c1.jpg'),[]);
        % DC
        set(handles.textR1, 'Visible', 'off');
        set(handles.editR1, 'Visible', 'off');

        set(handles.textR2, 'Visible', 'off');
        set(handles.editR2, 'Visible', 'off');

        set(handles.textVin, 'Visible', 'off');
        set(handles.editVin, 'Visible', 'off');

        set(handles.textR, 'Visible', 'off');
        set(handles.editR, 'Visible', 'off');

        set(handles.textR3, 'Visible', 'off');
        set(handles.editR3, 'Visible', 'off');

        set(handles.textV1, 'Visible', 'on');
        set(handles.editV1, 'Visible', 'on');

        set(handles.textV2, 'Visible', 'on');
        set(handles.editV2, 'Visible', 'on');
        
        set(handles.textV3, 'Visible', 'off');
        set(handles.editV3, 'Visible', 'off');
        % AC
    set(handles.textA1, 'Visible', 'on');
    set(handles.editA1, 'Visible', 'on');

    set(handles.textf1, 'Visible', 'on');
    set(handles.editf1, 'Visible', 'on');

    set(handles.textA2, 'Visible', 'on');
    set(handles.editA2, 'Visible', 'on');  

    set(handles.textf2, 'Visible', 'on');
    set(handles.editf2, 'Visible', 'on');

    set(handles.textA3, 'Visible', 'on');
    set(handles.editphi1, 'Visible', 'on');

    set(handles.textf3, 'Visible', 'on');
    set(handles.editphi2, 'Visible', 'on'); 

    set(handles.textR0ac, 'Visible', 'on');
    set(handles.editR0ac, 'Visible', 'on'); 

    set(handles.textR1ac, 'Visible', 'on');
    set(handles.editR1ac, 'Visible', 'on');

    set(handles.textR2ac, 'Visible', 'on');
    set(handles.editR2ac, 'Visible', 'on');

    set(handles.textR3ac, 'Visible', 'on');
    set(handles.editR3ac, 'Visible', 'on');
%---------------------------------------------------------------
    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'off');
    set(handles.axes3, 'Visible', 'off');

    legend(handles.axes11,'off'); 
    legend(handles.axes2, 'off');
    legend(handles.axes3, 'off');

    cla(handles.axes11);
    cla(handles.axes2);
    cla(handles.axes3);
    case 5
        axes(handles.axes1);
        imshow(imread('c5.jpg'),[]);
        % DC
        set(handles.textR1, 'Visible', 'on');
        set(handles.editR1, 'Visible', 'on');

        set(handles.textR2, 'Visible', 'on');
        set(handles.editR2, 'Visible', 'on');

        set(handles.textVin, 'Visible', 'off');
        set(handles.editVin, 'Visible', 'off');

        set(handles.textR, 'Visible', 'on');
        set(handles.editR, 'Visible', 'on');

        set(handles.textR3, 'Visible', 'on');
        set(handles.editR3, 'Visible', 'on');

        set(handles.textV1, 'Visible', 'on');
        set(handles.editV1, 'Visible', 'on');

        set(handles.textV2, 'Visible', 'on');
        set(handles.editV2, 'Visible', 'on');
        
        set(handles.textV3, 'Visible', 'on');
        set(handles.editV3, 'Visible', 'on');
        % AC
    set(handles.textA1, 'Visible', 'off');
    set(handles.editA1, 'Visible', 'off');

    set(handles.textf1, 'Visible', 'off');
    set(handles.editf1, 'Visible', 'off');

    set(handles.textA2, 'Visible', 'off');
    set(handles.editA2, 'Visible', 'off');  

    set(handles.textf2, 'Visible', 'off');
    set(handles.editf2, 'Visible', 'off');

    set(handles.textA3, 'Visible', 'off');
    set(handles.editphi1, 'Visible', 'off');

    set(handles.textf3, 'Visible', 'off');
    set(handles.editphi2, 'Visible', 'off'); 

    set(handles.textR0ac, 'Visible', 'off');
    set(handles.editR0ac, 'Visible', 'off'); 

    set(handles.textR1ac, 'Visible', 'off');
    set(handles.editR1ac, 'Visible', 'off');

    set(handles.textR2ac, 'Visible', 'off');
    set(handles.editR2ac, 'Visible', 'off');

    set(handles.textR3ac, 'Visible', 'off');
    set(handles.editR3ac, 'Visible', 'off');  
%-------------------------------------------------------------
    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'off');
    set(handles.axes3, 'Visible', 'off');

    legend(handles.axes11,'off'); 
    legend(handles.axes2, 'off');
    legend(handles.axes3, 'off');

    cla(handles.axes11);
    cla(handles.axes2);
    cla(handles.axes3);
end    



function popupmenuOpAmp_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR3_Callback(hObject, eventdata, handles)
global R3
R3=str2double(get(handles.editR3,'String'))


function editR3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editR_Callback(hObject, eventdata, handles)

global R
R=str2double(get(handles.editR,'String'))


function editR_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editV2_Callback(hObject, eventdata, handles)

global V2
V2=str2double(get(handles.editV2,'String'))


function editV2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editV3_Callback(hObject, eventdata, handles)

global V3
V3=str2double(get(handles.editV3,'String'))


function editV3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editV1_Callback(hObject, eventdata, handles)

global V1
V1=str2double(get(handles.editV1,'String'))


function editV1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function uipanelDC_CreateFcn(hObject, eventdata, handles)



function edit52_Callback(hObject, eventdata, handles)



function edit52_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)




function edit53_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit54_Callback(hObject, eventdata, handles)




function edit54_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit55_Callback(hObject, eventdata, handles)




function edit55_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit56_Callback(hObject, eventdata, handles)

function edit56_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)



function edit57_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit58_Callback(hObject, eventdata, handles)



function edit58_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit59_Callback(hObject, eventdata, handles)



function edit59_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA_Callback(hObject, eventdata, handles)
global A
A=str2double(get(handles.editA,'String'))

function editA_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editf0_Callback(hObject, eventdata, handles)
global f0
f0=str2double(get(handles.editf0,'String'))


function editf0_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR1ac_Callback(hObject, eventdata, handles)

global R1ac
R1ac=str2double(get(handles.editR1ac,'String'))



function editR1ac_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR2ac_Callback(hObject, eventdata, handles)

global R2ac
R2ac=str2double(get(handles.editR2ac,'String'))



function editR2ac_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function togglebutton1_Callback(hObject, eventdata, handles)

valo=get(hObject,'Value');
if(valo==1)
    Strings= {'Inverting Op Amp' 'Non-inverting Op Amp' 'Voltage Follower' 'Non-inverting Summing Amplifier' ' '};
    set(handles.popupmenuOpAmp, 'String', Strings);
    set(handles.textV3, 'Visible', 'off');
    set(handles.editV3, 'Visible', 'off');
    % AC part    
    set(handles.uipanelDC, 'Visible', 'off');
    set(handles.uipanel1, 'Visible', 'off');
    set(handles.pushbutton1, 'Visible', 'off');
    set(handles.textFrame, 'Visible', 'off');
    set(handles.textVout, 'Visible', 'off');
    set(handles.uipanelAC, 'Visible', 'on');

elseif(valo==0)
    newstring= {'Inverting Op Amp' 'Non-inverting Op Amp' 'Voltage Follower' 'Non-inverting Summing Amplifier' 'Inverting Summing Amplifier'};
    set(handles.popupmenuOpAmp, 'String', newstring); 
    set(handles.uipanelAC, 'Visible', 'off');
        set(handles.uipanelDC, 'Visible', 'on');
    set(handles.textR1, 'Visible', 'on');
        set(handles.editR1, 'Visible', 'on');
    set(handles.textR2, 'Visible', 'on');
        set(handles.editR2, 'Visible', 'on');
    set(handles.textVin, 'Visible', 'on');
        set(handles.editVin, 'Visible', 'on');
    set(handles.uipanel1, 'Visible', 'on');  
        set(handles.pushbutton1, 'Visible', 'on');
    set(handles.textFrame, 'Visible', 'on');
        set(handles.textVout, 'Visible', 'on');
    set(handles.uipanelAC, 'Visible', 'off');
        set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'off');
        set(handles.axes3, 'Visible', 'off');

    legend(handles.axes11,'off'); 
    legend(handles.axes2, 'off');
    legend(handles.axes3, 'off');

    cla(handles.axes11);
    cla(handles.axes2);
    cla(handles.axes3);

    set(handles.textAK, 'Visible', 'off');
    set(handles.textw3, 'Visible', 'off');
    set(handles.textphi, 'Visible', 'off');
end  


function uipanelAC_CreateFcn(hObject, eventdata, handles)



function pushbuttonPlot_Callback(hObject, eventdata, handles)


% AC Input
global A
global phi
global A1
global A2
global phi1
global w1
global w2
global AK

global f0
global f1 
global f2 
global phi2

global R0ac
global R1ac
global R2ac
global R3ac

global t
global x
global y 

selectedItemIdx = get(handles.popupmenuOpAmp,'Value');

if selectedItemIdx == 1
% AC output
    t=linspace(-2/f1, 2/f1, 100);
        x=A1*cos(2*pi*f1*t);
        axes(handles.axes2);
        plot(t,x, '-r'); hold on;
    legend('A*cos(2*pi*f0*t)');
        y=-R2ac/R1ac * x;
        axes(handles.axes3);
        plot(t,y, '-b'); hold on;
    legend('-R2/R1 * x');

    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'on');
    set(handles.axes3, 'Visible', 'on');

    legend(handles.axes11,'off'); 

    AK=A1*(-R2ac/R1ac)
    phi = phi1
set(handles.textw3,'String','*cos(2pif1*t +');

set(handles.textAK,'String',num2str(AK));
AK=['Vs =' num2str(AK)];
set(handles.textphi,'String',num2str(phi));
phi=[num2str(phi) ')'];
set(handles.textAK,'String',AK);
set(handles.textphi,'String',phi);

    set(handles.textAK, 'Visible', 'on');
    set(handles.textw3, 'Visible', 'on');
    set(handles.textphi, 'Visible', 'on');

elseif selectedItemIdx == 2   
% AC output
    t=linspace(-2/f1, 2/f1, 100);
        x=A1*cos(2*pi*f1*t);
        axes(handles.axes2);
        plot(t,x, '-r'); hold on;
    legend('A*cos(2*pi*f*t)');
        y=(1 + R2ac/R1ac) * x;
        axes(handles.axes3);
        plot(t,y, '-b'); hold on;
    legend('(1 + R2/R1) * x');

    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'on');
    set(handles.axes3, 'Visible', 'on');

    legend(handles.axes11,'off'); 

    AK=A1*(1+R2ac/R1ac)
    phi = phi1
set(handles.textw3,'String','*cos(2pif1*t +');

set(handles.textAK,'String',num2str(AK));
AK=['Vs =' num2str(AK)];
set(handles.textphi,'String',num2str(phi));
phi=[num2str(phi) ')'];
set(handles.textAK,'String',AK);
set(handles.textphi,'String',phi);

    set(handles.textAK, 'Visible', 'on');
    set(handles.textw3, 'Visible', 'on');
    set(handles.textphi, 'Visible', 'on');

elseif selectedItemIdx == 3
% AC output
    t=linspace(-2/f1, 2/f1, 100);
        x=A1*cos(2*pi*f1*t);
        axes(handles.axes2);
        plot(t,x, '-r'); hold on;
    legend('A*cos(2*pi*f0*t)');
        y= x;
        axes(handles.axes3);
        plot(t,y, '-b'); hold on;
    legend('Vout = Vin');

    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'on');
    set(handles.axes3, 'Visible', 'on');

    legend(handles.axes11,'off'); 

    AK=A1
    phi = phi1
set(handles.textw3,'String','*cos(2pif1*t +');

set(handles.textAK,'String',num2str(AK));
AK=['Vs =' num2str(AK)];
set(handles.textphi,'String',num2str(phi));
phi=[num2str(phi) ')'];
set(handles.textAK,'String',AK);
set(handles.textphi,'String',phi);

    set(handles.textAK, 'Visible', 'on');
    set(handles.textw3, 'Visible', 'on');
    set(handles.textphi, 'Visible', 'on');

elseif selectedItemIdx == 4   
    t=linspace(-2/f1, 2/f1, 100);
        j=A1*cos(2*pi*f1*t);
        k=A2*cos(2*pi*f2*t);
        axes(handles.axes2);
        plot(t,j, '--c'); hold on;
        plot(t,k, ':m'); hold on;
    legend('A1*cos(2*pi*f1*t)','A2*cos(2*pi*f2*t)');
        y= j + k;
        axes(handles.axes3);
        plot(t,y); hold on;
    legend('Vout = V1 + V2');
    AK=sqrt(A1^2 + A2^2 + 2*A1*A2)
    phi= atan((A1*sin(phi1)+A2*sin(phi2))/(A1*cos(phi1)+A2*cos(phi2)))

set(handles.textAK,'String',num2str(AK));
AK=['Vs =' num2str(AK)];
set(handles.textphi,'String',num2str(phi));
phi=[num2str(phi) ')'];
set(handles.textAK,'String',AK);
set(handles.textphi,'String',phi);

    set(handles.textAK, 'Visible', 'on');
    set(handles.textw3, 'Visible', 'on');
    set(handles.textphi, 'Visible', 'on');

    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'on');
    set(handles.axes3, 'Visible', 'on');

    legend(handles.axes11,'off'); 

    set(handles.textw3,'String','*cos(w3*t +');

end 


function togglebutton2_Callback(hObject, eventdata, handles)

global A
global phi
global A1
global A2
global phi1
global w1
global w2
global AK

global f0
global f1 
global f2 
global phi2

global R0ac
global R1ac
global R2ac
global R3ac

global t
global x
global y 
val=get(hObject,'Value');
selectedItemIdx = get(handles.popupmenuOpAmp,'Value');
% ------------------Case 1 for MERGE----------------------------
if(val==1)
    legend('boxon'); 
    set(handles.axes11, 'Visible', 'on');
    set(handles.axes2, 'Visible', 'off');
    set(handles.axes3, 'Visible', 'off');
if selectedItemIdx == 1
% AC output
    t=linspace(-2/f1, 2/f1, 100);
        x=A1*cos(2*pi*f1*t);
        axes(handles.axes11);
        plot(t,x, '-r'); 
    hold on
        y=-R2ac/R1ac * x;
        plot(t,y, '--b');
    legend('A*cos(2*pi*f*t)','-R2/R1 * Vin');

elseif selectedItemIdx == 2   
% AC output
    t=linspace(-2/f1, 2/f1, 100);
        x=A1*cos(2*pi*f1*t);
        axes(handles.axes11);
        plot(t,x, '-r');
    hold on
        y=(1 + R2ac/R1ac) * x;
        plot(t,y, '--b');
    legend('A*cos(2*pi*f*t)','(1 + R2/R1) * Vin');

elseif selectedItemIdx == 3  
    t=linspace(-2/f1, 2/f1, 100);
        x=A1*cos(2*pi*f1*t);
        axes(handles.axes11);
        plot(t,x, '-r'); hold on;
        y= x;
        plot(t,y, '-.b'); hold on;
    legend('A*cos(2*pi*f*t)','Vout = Vin');

elseif selectedItemIdx == 4
% AC output
    t=linspace(-2/f1, 2/f1, 100);
        j=A1*cos(2*pi*f1*t);
        k=A2*cos(2*pi*f2*t);
        axes(handles.axes11);
        plot(t,j, '--c'); hold on;
        plot(t,k, ':m'); hold on;
        y= j + k;
        plot(t,y, '-.b'); hold on;
    legend('A1*cos(2*pi*f1*t)','A2*cos(2*pi*f2*t)','Vout = V1 + V2');
end 
% ------------------Case 2 for MERGE----------------------------
elseif(val==0)
    set(handles.axes11, 'Visible', 'off');
    set(handles.axes2, 'Visible', 'on');
    set(handles.axes3, 'Visible', 'on');
    legend('boxoff') 
    cla(handles.axes11);
end    
    


function axes12_CreateFcn(hObject, eventdata, handles)

hold on
imshow('logoHCMUT.png');



function axes13_CreateFcn(hObject, eventdata, handles)

hold on
imshow('manual.png');




function editA1_Callback(hObject, eventdata, handles)
global A1
A1=str2double(get(handles.editA1,'String'))

% --- Executes during object creation, after setting all properties.
function editA1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editf1_Callback(hObject, eventdata, handles)
global f1
global w1
f1=str2double(get(handles.editf1,'String'))
w1=2*pi*f1


function editf1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editA2_Callback(hObject, eventdata, handles)

global A2
A2=str2double(get(handles.editA2,'String'))

function editA2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editf2_Callback(hObject, eventdata, handles)

global f2
global w2
f2=str2double(get(handles.editf2,'String'))
w2=2*pi*f2


function editf2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editphi1_Callback(hObject, eventdata, handles)
global phi1
phi1=str2double(get(handles.editphi1,'String'))

function editphi1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editphi2_Callback(hObject, eventdata, handles)
global phi2
phi2=str2double(get(handles.editphi2,'String'))


function editphi2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR0ac_Callback(hObject, eventdata, handles)
global R0ac
R0ac=str2double(get(handles.editR0ac,'String'))


function editR0ac_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editR3ac_Callback(hObject, eventdata, handles)
global R3ac
R3ac=str2double(get(handles.editR3ac,'String'))

% --- Executes during object creation, after setting all properties.
function editR3ac_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
