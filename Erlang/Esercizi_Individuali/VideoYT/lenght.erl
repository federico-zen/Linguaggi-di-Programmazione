-module(lenght).
-export([convert_meters/1]). % Interfaccia Pubblica


%1 Meter = 
-define(YARD , 1.0936).
-define(INCHES,39.370).
-define(FOOT,3.28).
%Pre-processor

%func(arg1,arg2...) -> body.

%func() -> 
%     clasue1;
%     clause2;
%     clause3.


%Meters To Yard
convert_meters({yard,Meters})-> 
    Meters * ?YARD;

%Meters To Inches
convert_meters({inch,Meters})-> 
    Meters * ?INCHES;

%Meters To Feet
convert_meters({feet,Meters})-> 
    Meters * ?FOOT.


