*###########################################################################*
#                   Copyright (C) 2015  LinArch                             #
#									    #
#    This program is free software: you can redistribute it and/or modify   #
#    it under the terms of the GNU General Public License as published by   #
#    the Free Software Foundation, either version 3 of the License, or      #
#    (at your option) any later version.				    #
#									    #
#    This program is distributed in the hope that it will be useful,        #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of         #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          #
#    GNU General Public License for more details.		            #
#									    #
#    You should have received a copy of the GNU General Public License      #
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.  #
*###########################################################################*

############################################################################*
##             Iranian Arch Users Conky(I.AUC.ver2)                        ##
##             Developed By:          LinArch                              ##
##	       Visit Me:           www.stack.blog.ir                       ##
##             Visit Us:          www.bbs.archusers.ir                     ##
##             Conky-Tut:					           ##
##             Lua-Tut:                                                    ##
############################################################################*
#!/bin/bash
#to call a function from bash use this patter:
#source bashScript.sh;funcName
#for example:if the script name is service and the function is test so:
#source weather.sh;test

#Wheather API
#Wunderground.com----http://api.wunderground.com/api/26115e7fb6edfe1b/conditions/q/iran/tehran.xmlns

function location ()
{
curl -s "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20%28select%20woeid%20from%20geo.places%281%29%20where%20text%3D%22tehran%2Cir%22%29&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys" -o ~/.cache/weather.xml
}

function country ()
{
grep "yweather:location" ~/.cache/weather.xml | grep -o "country=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"
}

function city ()
{
grep "yweather:location" ~/.cache/weather.xml | grep -o "city=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"
}

wind ()
{
M=$(grep "yweather:wind" ~/.cache/weather.xml | grep -o "speed=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tail -1);
awk "BEGIN {printf \"%.0f\n\", ($M*0.44704)}";
}

humidity ()
{
grep "yweather:atmosphere" ~/.cache/weather.xml | grep -o "humidity=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"
}

atmosphere()
{
grep "yweather:atmosphere" ~/.cache/weather.xml | grep -o "humidity=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"
}

sunrise()
{
grep "yweather:astronomy" ~/.cache/weather.xml | grep -o "sunrise=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"
}

sunset()
{
grep "yweather:astronomy" ~/.cache/weather.xml | grep -o "sunset=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"
}

status1 ()
{
grep "yweather:condition" ~/.cache/weather.xml | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '[a-z]' '[A-Z]' | awk 'NR==1'
}

todayTemp ()
{
F=$(grep "yweather:condition" ~/.cache/weather.xml | grep -o "temp=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*");
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayHigh1()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==1');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayHigh2()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==2');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayHigh3()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==3');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayHigh4()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==4');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayHigh5()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==5');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayHigh6()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==6');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayLow1()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==1');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayLow2()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==2');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayLow3()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==3');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayLow4()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==4');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayLow5()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==5');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

dayLow6()
{
F=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==6');
awk "BEGIN {printf \"%.0f\n\", ($F-32)*5/9}";
}

day1 ()
{
grep "yweather:forecast" ~/.cache/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==1'
}


day2 ()
{
grep "yweather:forecast" ~/.cache/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==2'
}

day3 ()
{
grep "yweather:forecast" ~/.cache/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==3'
}

day4 ()
{
grep "yweather:forecast" ~/.cache/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==4'
}

day5 ()
{
grep "yweather:forecast" ~/.cache/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==5'
}

day6 ()
{
grep "yweather:forecast" ~/.cache/weather.xml | grep -o "code=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk 'NR==6'
}

miToKm()
{
mi=0.62137 km;
}

inToCm()
{
1 inches= 2.54 centimeter;
}
