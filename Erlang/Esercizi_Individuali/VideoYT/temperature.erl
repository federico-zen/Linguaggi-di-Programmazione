-module(temperature).
-export([check_temperature/1]).


check_temperature(Temp) -> 
    if
        Temp < 40 -> 
            io:format("Temperature is ok ~n");
        Temp > 40 -> 
            io:format("It's getting hot ~n");

        true -> io:format("It's 40°~n")
    end. 