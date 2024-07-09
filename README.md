# All Spigot NMS
This is a tool I created to create a single jar file that contains all of spigot NMS 
versions, for easy import while creating a plugin that needs to support multiple versions of the Minecraft server libraries.

> ## Important
> Since version `1.17.1` Spigot changed the layout and obfucation mapping method, so this tool only compiles from version *1.8* to *1.17*.
> If you need support for version `1.18` and above please check out [tekanaka](https://github.com/zlataovce/takenaka).\
> *I will try to find a way to include everything but nothing is promised.*

## Usage
NOTE: This tool uses the `jar` command.
It uses the `JAVA_HOME` or `$PATH` environmental variable to find the command.
If you dont have that variable set, go to your JDK folder and copy the path then on your terminal run:

<details>

#### Set JDK to `$PATH`
```shell
echo 'export PATH="{JDK_PATH}/bin:$PATH"' >> ~/.zshrc
```
*`~/.zshrc` is your shell profile file*

#### Set JDK to `$JAVA_HOME`
```shell
set JAVA_HOME="{JDK_PATH}"
```

</details>

### Compilation:

* Download or clone this repository:
```
git clone https://github.com/Jacxk/all-spigot-nms
```

* To compile the Jar file is as easy as runing the [run.sh](run.sh) script and select one of  options.

  <details>
  <summary>Options:</summary>

  *If no flags are found while executing the script an interactive menu will appear. Available flags are: `-d | -e | -c | -a`*

  * Download `-d` - Downloads all the spigot jar files.
  * Extract `-e` - Extracts all the needed files from the downloaded files for compilation.
  * Compile `-c` - Compiles the Jar file from the extracted files.
  * All the above `-a` - Does all the above sequentially.
  * Exit - Closes everything and exits of course.

    *Use the arrows and enter key to navigate through the menu.*

  ***Extra Flags:***
  * `-t` - Tests that the tool works as expected and everything is included on the out jar file.
  * `-k` - Removes title printout
  * `-x` - Disables verbose out put. Only important info will be displayed.
  </details>

#


![Build Test](https://github.com/Jacxk/all-spigot-nms/workflows/Build%20Test/badge.svg)

# Importing
### Maven:
```xml
<dependency>
    <groupId>local.spigot.nms</groupId>
    <artifactId>AllSpigotNMS</artifactId>
    <version>LATEST</version>
    <scope>system</scope>
    <systemPath>${project.basedir}/PATH TO FILE HERE</systemPath>
</dependency>
```
### Gradle:
```groovy
dependencies {
    implementation(files("/path/to/file.jar"))
}
```
You can now install it using the [github package](https://github.com/Jacxk?tab=packages&repo_name=all-spigot-nms)
#

*I'm not distributing anything, please don't sue me Mojang.*

#### Spigot NMS and Minecraft Versions:
* 1.8 and 1.9 Look at [this page](https://www.spigotmc.org/wiki/spigot-nms-and-minecraft-versions-legacy/)
* 1.10 up Look at [this page](https://www.spigotmc.org/wiki/spigot-nms-and-minecraft-versions-1-10-1-15/)
* 1.16 and up Look at [this page](https://www.spigotmc.org/wiki/spigot-nms-and-minecraft-versions-1-16/)

<details>

<summary>NMS Versions with its latest minecraft version.</summary>

*Each version as a link to its download.*

| Version | R1                                                                                | R2                                                                              | R3                                                                              |
|---------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| 1.8     | [1.8](https://cdn.getbukkit.org/spigot/spigot-1.8-R0.1-SNAPSHOT-latest.jar)       | [1.8.3](https://cdn.getbukkit.org/spigot/spigot-1.8.3-R0.1-SNAPSHOT-latest.jar) | [1.8.8](https://cdn.getbukkit.org/spigot/spigot-1.8.8-R0.1-SNAPSHOT-latest.jar) |
| 1.9     | [1.9.2](https://cdn.getbukkit.org/spigot/spigot-1.9.2-R0.1-SNAPSHOT-latest.jar)   | [1.9.4](https://cdn.getbukkit.org/spigot/spigot-1.9.4-R0.1-SNAPSHOT-latest.jar) |                                                                                 |
| 1.10    | [1.10.2](https://cdn.getbukkit.org/spigot/spigot-1.10.2-R0.1-SNAPSHOT-latest.jar) |                                                                                 |                                                                                 |
| 1.11    | [1.11.2](https://cdn.getbukkit.org/spigot/spigot-1.11.2.jar)                      |                                                                                 |                                                                                 |
| 1.12    | [1.12](https://cdn.getbukkit.org/spigot/spigot-1.12.2.jar)                        |                                                                                 |                                                                                 |
| 1.13    | [1.13](https://cdn.getbukkit.org/spigot/spigot-1.13.jar)                          | [1.13.2](https://cdn.getbukkit.org/spigot/spigot-1.13.2.jar)                    |                                                                                 |
| 1.14    | [1.14.4](https://cdn.getbukkit.org/spigot/spigot-1.14.4.jar)                      |                                                                                 |                                                                                 |
| 1.15    | [1.15.2](https://cdn.getbukkit.org/spigot/spigot-1.15.2.jar)                      |                                                                                 |                                                                                 |
| 1.16    | [1.16.1](https://cdn.getbukkit.org/spigot/spigot-1.16.1.jar)                      | [1.16.3](https://cdn.getbukkit.org/spigot/spigot-1.16.3.jar)                    | [1.16.5](https://cdn.getbukkit.org/spigot/spigot-1.16.5.jar)                    |
| 1.17    | [1.17.1](https://download.getbukkit.org/spigot/spigot-1.17.1.jar)                 |                                                                                 |                                                                                 |
| 1.18    | [1.18.1](https://download.getbukkit.org/spigot/spigot-1.18.1.jar)                 | [1.18.2](https://download.getbukkit.org/spigot/spigot-1.18.2.jar)               |                                                                                 |
| 1.19    | [1.19.2](https://download.getbukkit.org/spigot/spigot-1.19.2.jar)                 | [1.19.3](https://download.getbukkit.org/spigot/spigot-1.19.3.jar)               | [1.19.4](https://download.getbukkit.org/spigot/spigot-1.19.4.jar)               |
| 1.20    | [1.20.1](https://download.getbukkit.org/spigot/spigot-1.20.1.jar)                 | [1.20.2](https://download.getbukkit.org/spigot/spigot-1.20.2.jar)               | [1.20.4](https://download.getbukkit.org/spigot/spigot-1.20.4.jar)               |
</details>

#
