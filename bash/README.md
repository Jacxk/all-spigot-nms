# Commands

These are the different commands to make it easier if you wanna build the NMS jar file your self.
You just have to run one of these commands.

* [download.sh](./download.sh) wil download all the need jar files to begin extraction and compilation.
(Run this first)
  * Usage: `bash ./download.sh [-d]` (Use `-d` [optional] to enable cURL output)
* [extract](./extract.sh) Only extracts the jar files from [spigot_versions/](../spigot_versions) 
and saves it on [extracted_files/](../extracted_files)
  * Usage: `bash ./extract.sh`
* [compile.sh](./compile.sh) will extract all the jar file from [spigot_versions/](../spigot_versions)
and create a jar file containing all the code.
  * Usage: `bash ./compile.sh`
