# Additional modules to be used throughout the program. 
Import-Module -Name PSWindowsUpdate

# Additional variables to be used throughout the program.
$NonReboot = "Get-WindowsUpdate -AcceptAll -Install -IgnoreReboot"
$Reboot = "Get-WindowsUpdate -AcceptAll -Install -AutoReboot"
$UpdatePrompt = "Would you like to reboot after updating? [y/n]"

try {
    switch (Read-Host -Prompt $UpdatePrompt) {
        "y" {
            Start-Process powershell -Verb runas $Reboot
        }

        "n" {
            Start-Process powershell -Verb runas $NonReboot
            Return
        }
    }
}
catch {
    Install-Module -Name PSWindowsUpdate
    Return
}
