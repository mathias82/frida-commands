# frida-commands

The script contains some frida commands, such as finding and saving the classes of a package to a document, as well as finding the methods of a class and saving it to the output-fridaTxt folder 

# Prerequisite

In the emulator, you should have installed and run the frida server first.

# Instructions

Two folders are created by the shell script: one for the javascript code, the other for the output from the frida server. 
Upon exiting frida, all classes or properties for a package will be stored in the output-fridaTxt folder. After that you can search from the application if the specific class or method you are looking for exist.

```
1) Start frida server
2) Run the command: chmod +x main.sh
3) Finally run: ./main 

```

<img width="700" alt="menu" src="https://user-images.githubusercontent.com/4541512/161402511-e2167bfe-edd8-4ff3-b0d4-98db91d06983.png">

You will see all the installed packages from the emulator and you should choose the package in order to see all the classes.

<img width="700" alt="package" src="https://user-images.githubusercontent.com/4541512/161402513-814f87de-5b44-4b6f-8530-ff1f004071cb.png">

You are inside frida terminal, you shoud enter %resume to see all the classes, after you enter exit the classes will be store in a file inside the folder output-fridaTxt.

<img width="700" alt="package" src="https://user-images.githubusercontent.com/4541512/161402645-163b100a-bd21-4cec-8d90-fc5379ac3644.png">

<img width="700" alt="classes" src="https://user-images.githubusercontent.com/4541512/161402522-531743d3-8a7d-4965-bc1b-224c4dadcf80.png">
