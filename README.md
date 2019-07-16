# all-spigot-nms
All NMS versions of spigot in one jar file

# Usage
Add this the `pom.xml` of your minecraft plugin (or any other project) to use it as dependency.
```xml
<repositories>
    <!-- All NMS versions of bukkit/minecraft -->
    <repository>
        <id>all-spigot-nms-repo</id>
        <url>http://maven.jackscode.me/repository/all-spigot-nms/</url>
    </repository>
</repositories>

<dependencies>
    <dependency>
        <groupId>me.jackscode</groupId>
        <artifactId>all-spigot-nms</artifactId>
        <version>1.0</version>
        <scope>provided</scope>
    </dependency>
</dependencies>
```

You can also compile it your self if you don't want to use maven you can clone this repository
and run the [download.sh](./bash/download.sh) and [compile.sh](./bash/compile.sh) commands to get the jar with all the contents.