# Check for Operating System
Write-Host "Checking Operating System..."
$os = Get-WmiObject Win32_OperatingSystem
Write-Host "OS Name: " $os.Caption

# Check for Git
Write-Host "Checking Git Installation..."
try {
    git --version
    Write-Host "Git is installed."
} catch {
    Write-Host "Git is not installed."
}

# Check for Anaconda
Write-Host "Checking Anaconda Installation..."
try {
    conda --version
    Write-Host "Anaconda is installed."
} catch {
    Write-Host "Anaconda is not installed."
}

# Check for Visual Studio
Write-Host "Checking Visual Studio Installation..."
$vs = Get-Command devenv.exe -ErrorAction SilentlyContinue
if ($vs) {
    Write-Host "Visual Studio is installed."
} else {
    Write-Host "Visual Studio is not installed."
}

# Check for CUDA Toolkit
Write-Host "Checking CUDA Toolkit Installation..."
try {
    nvcc --version
    Write-Host "CUDA Toolkit is installed."
} catch {
    Write-Host "CUDA Toolkit is not installed."
}

# Check for COLMAP, ImageMagick, and FFMPEG (assuming they are in PATH)
Write-Host "Checking COLMAP, ImageMagick, and FFMPEG Installation..."
$software = @("colmap", "magick", "ffmpeg")
foreach ($s in $software) {
    try {
        & $s --version
        Write-Host "$s is installed."
    } catch {
        Write-Host "$s is not installed."
    }
}

# Check GPU Specifications
Write-Host "Checking GPU Specifications..."
try {
    $gpu = Get-WmiObject Win32_VideoController
    foreach ($g in $gpu) {
        Write-Host "GPU Name: " $g.Name
        Write-Host "GPU RAM: " $g.AdapterRAM
    }
} catch {
    Write-Host "Unable to retrieve GPU specifications."
}
