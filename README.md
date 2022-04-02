# frida-commands

The script contains some frida commands, such as finding and saving the classes of a package to a document, as well as finding the methods of a class and saving it to the output-fridaTxt folder 

# Prerequisite

In the emulator, you should have installed and run the frida server first.

# Instructions

Two folders are created by the shell script: one for the javascript code, the other for the output from the frida server. 
When you exit frida, all the classes or the properties of a package will be stored in a file inside the output-fridaTxt folder.

```
1) Rename the frida server to 'fridaServer' ex. /data/local/tmp/fridaServer
2) Run the command: chmod +x menu.sh
3) Finally run: ./menu 

```

<img width="700" alt="menu" src="https://user-images.githubusercontent.com/4541512/161402511-e2167bfe-edd8-4ff3-b0d4-98db91d06983.png">

<img width="700" alt="package" src="https://user-images.githubusercontent.com/4541512/161402513-814f87de-5b44-4b6f-8530-ff1f004071cb.png">

<img width="700" alt="package" src="https://user-images.githubusercontent.com/4541512/161402645-163b100a-bd21-4cec-8d90-fc5379ac3644.png">

<img width="700" alt="classes" src="https://user-images.githubusercontent.com/4541512/161402522-531743d3-8a7d-4965-bc1b-224c4dadcf80.png">
