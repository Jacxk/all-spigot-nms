# all-spigot-nms
All nms versions of bukkit in one jar file

# Usage
Add the following code to your `pom.xml` for the latest release:
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