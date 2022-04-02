#!/bin/bash
# Automate frida commands
# Copyright (C) 2022 mstavrou
# Last revised 01/04/2022

clear

START=$(date +"%s")

function ShowElapsedTime {
echo '' 
end=$(date +"%s")
elapsed=$(($end-$START))
echo "$(($elapsed / 60)) minutes $(($elapsed % 60)) seconds"
echo '' 
}

echo '' 
echo '' 
echo '' 
echo '|||||||||||||||||||||||||||||||' 
echo '|                             |' 
echo '|          Frida Commands     |' 
echo '|                             |' 
echo '|                             |' 
echo '|||||||||||||||||||||||||||||||' 
echo ''
echo ''
echo ''
echo ''
echo '1 – Java classes of the apk'
echo '2 – Search java class'
echo '3 – Java class properties of the apk'
echo '4 – Search property of a class'
echo '5 – Fake Location'
echo '' 
echo '' 
read -n 1 -s -r -p 'Select operation type, ESC to cancel...' key
echo ''
if [ "$key" == $'\e' ]; then
echo '' 
echo '' 
echo 'Operation canceled!'
echo '' 
echo '' 
exit 1
fi
clear
case $key in
1)
echo '' 
echo '' 
echo 'Enter app package name to retrieve classes and press Enter, Ctrl+C to cancel...'
echo '' 
echo 'Packages Latest List of Installed Application'
echo '' 
adb shell pm list packages -3 | cut -f 2 -d ":"
echo ''
read -e -p 'Package Name: ' packageName
echo ''
echo '' 
echo ''
echo '
if(Java.available){

Java.perform(function() {    

	Java.enumerateLoadedClasses({


		onMatch : function(className){
			console.log(className);
		},
		onComplete : function(){
			console.log("thank you");
		}
	})
});

} else{

	console.log("java is not available");
}' > ./js/${packageName}_class.js

echo '-------------------------'
echo ''
echo 'Frida connected hit %resume to see the classes, when you exit it will produce output to a folder output-fridaTxt'
echo ''
echo '-------------------------'
echo ''
echo ''
frida -U -f ${packageName} -l ./js/${packageName}_class.js
echo ''
echo ''
echo '-------------------------'
echo ''
echo ''
echo ''
echo ''
frida -U -f ${packageName} -l ./js/${packageName}_class.js --no-pause > ./output-fridaTxt/${packageName}_class.txt
echo ''
echo ''
echo ''
echo ''
;;

2)
echo '' 
echo '' 
echo 'Enter app package name and class to search and press Enter, Ctrl+C to cancel...'
echo '' 
echo 'Packages Latest List of Installed Application'
echo '' 
adb shell pm list packages -3 | cut -f 2 -d ":"
echo ''
echo ''
read -e -p 'Package Name: ' packageName
echo ''
echo '' 
read -e -p 'Class to see if exists - %like: ' classSearch
echo ''
echo ''
echo '-------------------------'
echo ''
echo 'Results.......'
echo ''
echo ''
cat ./output-fridaTxt/${packageName}_class.txt | grep "${classSearch}"
echo ''
echo ''
echo '-------------------------'
echo ''
echo ''
;;

3)
echo '' 
echo '' 
echo 'Enter app package name and class to retrieve methods and press Enter, Ctrl+C to cancel...'
echo '' 
echo 'Packages Latest List of Installed Application'
echo '' 
adb shell pm list packages -3 | cut -f 2 -d ":"
echo ''
echo '-------------------------'
echo ''
echo ''
read -e -p 'Package Name: ' packageName
echo ''
echo ''
echo '-------------------------'
echo '' 
read -e -p 'Class Name: ' className
echo ''
echo ''
echo '
if(Java.available){    

//"com.jaotech.manage.yourbp.MyApp"

Java.perform(function() {    
	var t = Java.use("'${className}'");
    console.log(Object.getOwnPropertyNames(t).join("\n"));
		
});
} else{
	console.log("java is not available");
}' > ./js/${packageName}_properties.js
echo ''
echo '-------------------------'
echo ''
echo 'Frida connected hit %resume to see the method, when you exit it will produce output to a folder output-fridaTxt'
echo ''
echo '-------------------------'
echo ''
echo ''
frida -U -f ${packageName} -l ./js/${packageName}_properties.js
echo ''
echo ''
echo '-------------------------'
frida -U -f ${packageName} -l ./js/${packageName}_properties.js --no-pause > ./output-fridaTxt/${packageName}_properties.txt
echo ''
echo ''
echo ''
echo ''
;;

4)
echo '' 
echo '' 
echo 'Enter app package name and property of a class to search and press Enter, Ctrl+C to cancel...'
echo '' 
echo 'Packages Latest List of Installed Application'
echo '' 
adb shell pm list packages -3 | cut -f 2 -d ":"
echo ''
echo ''
read -e -p 'Package Name: ' packageName
echo ''
echo '' 
read -e -p 'Property of a class to see if exists - %like: ' propertySearch
echo ''
echo ''
echo '-------------------------'
echo ''
echo 'Results.......'
echo ''
echo ''
cat ./output-fridaTxt/${packageName}_properties.txt | grep "${propertySearch}"
echo ''
echo ''
echo '-------------------------'
echo ''
echo ''
;;
5)
echo '' 
echo '' 
echo 'Enter app package name to start fake location and press Enter, Ctrl+C to cancel...'
echo '' 
echo 'Packages Latest List of Installed Application'
echo '' 
adb shell pm list packages -3 | cut -f 2 -d ":"
echo '' 
read -e -p 'Package name: ' packageName
echo ''
echo 'Frida started'
echo '-------------------------'
frida -U -f $packageName -l js/fakeLocation.js --no-pause
;;
*)
echo '' 
echo '' 
echo 'Unknown operation type!'
echo '' 
echo '' 
exit 1
;;
esac
ShowElapsedTime
