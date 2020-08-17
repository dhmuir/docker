# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_prompts?view=powershell-6

# Customise Powershell Prompt
function prompt
{
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity

    if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    {        
        Write-Host -ForegroundColor Red -NoNewline "Powershell [ADMIN] "
    }
    else
    {
        Write-Host -NoNewline "Powershell "
    }

    "$env:USERNAME@$env:COMPUTERNAME.$env:USERDOMAIN in $($ExecutionContext.SessionState.Path.CurrentLocation)`n$(get-date) > "
}

# Set Window Title.
$host.ui.RawUI.WindowTitle="Windows Powershell [$env:USERNAME@$env:COMPUTERNAME.$env:USERDOMAIN]"

# Clear the console output.
Clear-Host
