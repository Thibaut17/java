#!/bin/bash

################################################################################
#                              java.sh                                         #
#                                                                              #
# Use this template as the beginning of a new program. Place a short           #
# description of the script here.                                              #
#                                                                              #
# Change History                                                               #
# 02/11/2021  Thibaut Jolive        Original code. This is a template for      #
#                                   creating new Bash shell scripts.           #
#                                   Add new history entries as needed.         #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C)       2021 Thibaut Jolive                                     #
#                                                                              #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 2 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################
################################################################################
################################################################################

Help(){
   # Display Help
   echo "Syntax: ~/java.sh [-h|N|w|c|e] -p <project> -s <sourcefile>"
   echo "p and s options are required see below."
   echo
   echo "options:"
   echo "h     Print this Help."
   echo "p     Name of the project. Always required."
   echo "s     Java sourcefile. Not required only if the N option is used alone."
   echo "N     Create the arborescence of a new project."
   echo "w     Edit the source file."
   echo "c     Compile the program."
   echo "e     Execute the program in the jvm."
   echo
}
compil(){
	javac -sourcepath ~/java/$1/src -d ~/java/$1/classes -classpath ~/java/$1/classes ~/java/$1/src/$2.java

}
doc(){
	javadoc -d ~/java/$1/doc -sourcepath ~/java/$1/src ~/java/$1/src/$2.java
}
execute(){
	java -classpath ~/java/$1/classes $2
}

new_project(){
    mkdir ~/java/$1
    mkdir ~/java/$1/doc
    mkdir ~/java/$1/classes
    mkdir ~/java/$1/src
}
edit(){
    vim ~/java/$1/src/$2.java
}

pflag=1
sflag=1
execution=false
compilation=false
documentation=false
newproject=false
write=false
while getopts ":hecdNwp:s:" option; do
	case $option in
		h) # display Help
			Help
			exit;;
		p)# directory of the project
			p=${OPTARG}
			pflag=0;;
		s)# name of the java sourcefile
			s=${OPTARG}
			sflag=0;;
		c) #compilation
			compilation=true;;
		e) # execution
			#execution $p $s;;
			execution=true;;
		d) #documentation
			documentation=true;;
		N) #new project
			newproject=true;;
		w) #new project
			write=true;;
		:)
			echo "L'option $OPTARG requiert un argument"
			exit 1
			;;
		\?) # incorrect option
			echo "Error: Invalid option"
			Help
			exit;;
	esac
done
shift $((OPTIND-1))

if [ $pflag -eq 1 ]
then
	echo "L'option p est obligatoire"
	exit
	
fi

if [ $newproject = true ]
then
	new_project $p
fi

if [ $write = true ]
then
	edit $p $s
	if [ $sflag -eq 1 ]
    then
        echo "L'option s est obligatoire"
        exit
        
    fi
fi

if [ $compilation = true ]
then
	compil $p $s
	if [ $sflag -eq 1 ]
    then
        echo "L'option s est obligatoire"
        exit
        
    fi
fi

if [ $execution = true ]
then
	execute $p $s
	if [ $sflag -eq 1 ]
    then
        echo "L'option s est obligatoire"
        exit
        
    fi
fi

if [ $documentation = true ]
then
	doc $p $s
	if [ $sflag -eq 1 ]
    then
        echo "L'option s est obligatoire"
        exit
        
    fi
fi

