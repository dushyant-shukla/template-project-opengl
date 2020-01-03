# template-project-opengl
A template project for working in OpenGL.

This project has been configured with following libraries:
* opengl32.lib
* glad
* glfw
* glm
* jsoncpp
* imgui
* stbi

### How to generate the prject?
1. Open **premake5.lua** in the root folder and update below lines to change the solution and project name:

 ```
workspace "template-project" // update the solution name
```

```
project "example-project" // update the project name
```

2. Execute the **generate-project.bat** file. This will generate a visual studio solution configured with the above libraries.
