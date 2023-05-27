# Variables to be used by the update automation script.
$moduleInstall = "Install-Module -Name PSWindowsUpdate"
$prompt = "Would you like reboot afterwards? [y/n]"
$updateWithAutoReboot = "Get-WindowsUpdate -AcceptAll -Install -AutoReboot"
$updateWithoutAutoReboot = "Get-WindowsUpdate -AcceptAll -Install"

# Special arrays to make the process smoother.
$commandListWithReboot = @(
    $moduleInstall
    $updateWithAutoReboot
)

$commandListWithoutReboot = @(
    $moduleInstall
    $updateWithoutAutoReboot
)

# Definition of code to automate the update process. #
switch (Read-Host -Prompt $prompt) {
    "y" {
        if (Get-Module -Name PSWindowsUpdate) {
            Start-Process powershell -Verb runas $updateWithAutoReboot
        }
        else {
            Start-Process powershell -Verb runas $commandListWithReboot
        }
    }

    "n" {
        if (Get-Module -Name PSWindowsUpdate) {
            Start-Process powershell -Verb runas $updateWithoutAutoReboot
        }
        else {
            Start-Process powershell -Verb runas $commandListWithoutReboot
        }
    }
}
