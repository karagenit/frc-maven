# Maven Repository for FRC Libraries

> NOTE: all of the libraries are tested with the WPIlib plugins version `alpha4`, *not* `beta0`.

## Usage with Gradle (VSCode)

Including the libraries (such as those for the TalonSRX) in your project is relatively simple. Within the `build.gradle` file in the root of the project directory, add the following snippet:

```
repositories {
    maven {
        url "https://raw.githubusercontent.com/karagenit/frc-maven/master/maven/"
    }
}
```

This tells gradle to look in this repository for the required files. Then, to include a specific library, add the following to the `dependencies` section of `build.gradle`:

```
dependencies {
  ...
  compile "com.ctre.phoenix:CTRE_Phoenix:5.8.1.0"
  ...
}
```

This, for example, includes the CTRE Phoenix library, version 5.8.1.0. Look in the `maven/` directory in this repo to find the proper path name (aka groupId), library name (aka artifactId), and version for the library you want.

## FAQ

### Error: Could not parse POM, Already Seen Doctype

Most likely you have linked the maven repository to https://github.com/karagenit/frc-maven/tree/master/maven, which is not correct. Use the exact URL provided above (at the raw.githubusercontent.com domain). 
