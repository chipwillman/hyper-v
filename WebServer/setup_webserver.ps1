iwr https://chocolatey.org/install.ps1 | iex


cinst -y totalcommander
cinst -y notepadplusplus
cinst -y googlechrome
add-windowsfeature web-webserver -includeallsubfeature
add-windowsfeature web-mgmt-tools -includeallsubfeature
add-windowsfeature NET-WCF-HTTP-Activation45

cinst -y webpi
cinst -y webdeploy
cinst -y 7zip
cinst -y nuget
nuget install msbuild.microsoft.visualstudio.web.targets
