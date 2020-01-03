workspace "template-project"
	architecture "x86_64"
	language "C++"
	startproject "example-project"

	configurations {
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"]     = "vendors/GLFW/include"
IncludeDir["glad"]     = "vendors/glad/include"
IncludeDir["imgui"]    = "vendors/imgui"
IncludeDir["glm"]      = "vendors/glm"
IncludeDir["jsoncpp"]  = "vendors/jsoncpp/include"
IncludeDir["stbi"]     = "vendors/stbi"

include "vendors/GLFW"
include "vendors/glad"
include "vendors/imgui"
include "vendors/jsoncpp"

project "example-project"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
		"source/**.h",
		"source/**.cpp",
		"vendors/glm/glm/**.hpp",
		"vendors/glm/glm/**.inl",
		"vendors/jsoncpp/include/json/**.h",
		"vendors/stbi/**.h",
		"vendors/stbi/**.cpp"
	}

	includedirs
	{
		"source",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.glad}",
		"%{IncludeDir.imgui}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.jsoncpp}",
		"%{IncludeDir.stbi}"
	}

	links
	{
		"glad",
		"GLFW",
		"opengl32.lib",
		"imgui",
		"jsoncpp"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		buildoptions "/MD"
		optimize "On"