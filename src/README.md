### To Compile
To compile the Jar file you must run [run.sh](run.sh) and select one of  options.

#### Options:
*These are for the interactive menu*
* Download - Downloads all the spigot jar files.
* Extract - Extracts all the needed files from the downloaded files for compilation.
* Compile - Compiles the Jar file from the extracted files.
* All the above - Does all the above sequentially.
* Exit - Closes everything and exits of course.

*Use the arrows and enter key to navigate through the menu*

#### Flags:
*If you just want to execute the command without the interactive menu, use these flags*
* `-d` - Downloads all the spigot jar files.
* `-e` - Extracts all the needed files from the downloaded files for compilation.
* `-c` - Compiles the Jar file from the extracted files.
* `-a` - Does all the above sequentially.

#

*If you use Linux or  Mac you can skip this.*

NOTE: This tool uses the `jar` and uses the `JAVA_HOME` environmental variable.
If you dont have that variable set, go to your JDK folder and copy the path then on your terminal run:
```shell script
set JAVA_HOME="PATH OF JDK"
```
**Example**: 
```shell script
 set JAVA_HOME="C:\Program Files\Java\jdk-13.0.2"
 ```