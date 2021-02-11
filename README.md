# java
## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [Collaboration](#collaboration)
5. [FAQs](#faqs)
### General Info
***
This bash script is made to create project, edit java source files, compile them, create the javadoc associate to the file and execute class files.
### Screenshot
![Image text](https://github.com/Thibaut17/java/blob/main/java_help.png)
## Technologies
***
A list of technologies used within the project:
* [Bash](https://www.gnu.org/software/bash): Any
* [JVM](https://www.oracle.com/fr/java/technologies/javase-downloads.html): Version 8 or more
## Installation
***
A little intro about the installation. 
```
$ git clone https://www.github.com/Thibaut17/java
$ cd java
$ mv java.sh ~/java.sh
$ chmod 755 ~/java.sh
```
## Usage
```
Syntax: ~/java.sh [-h|N|w|c|e] -p <project> -s <sourcefile>
p and s options are required see below.

options:
h     Print this Help.
p     Name of the project. Always required.
s     Java sourcefile. Not required only if the N option is used alone.
N     Create the arborescence of a new project.
w     Edit the source file.
c     Compile the program.
e     Execute the program in the jvm.
```
## Collaboration
***
Anyone can collaborate to ameliorate it
## FAQs
***
None at the moment
