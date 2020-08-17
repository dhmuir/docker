# escape=`

#
# Dockerfile for Microsoft Windows Image
# Author: dhm@davidmuir.co.uk
#

ARG FROM_IMAGE
FROM ${FROM_IMAGE}

SHELL ["powershell.exe"]
USER ContainerAdministrator
COPY .\profile.ps1 C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1

USER ContainerUser
ENTRYPOINT powershell.exe
