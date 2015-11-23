:: This script will:
::   1) Rebuild MSBuild source tree.
::   2) Create a copy of the build output in bin\MSBuild
::   3) Build the source tree again with the MSBuild.exe in step 2.

@echo off
setlocal

set MSBuildTempPath=%~dp0bin\MSBuild

:: Check prerequisites
if not defined VS140COMNTOOLS (
    echo Error: This script should be run from a Visual Studio 2015 Command Prompt.  
    echo        Please see https://github.com/Microsoft/msbuild/wiki/Building-Testing-and-Debugging for build instructions.
    exit /b 1
)

:: Build and run tests on CoreCLR
"%~dp0build.cmd" /t:RebuildAndTest /p:Configuration=Debug-NetCore
