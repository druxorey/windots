function askToExecute {
	param (
		[string]$message
	)
	
	do {
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Cyan
		$userInput = Read-Host -Prompt $message
		[System.Console]::ResetColor()
	
		if ($userInput.ToUpper() -eq "Y" -or $userInput.ToUpper() -eq "") {
			Write-Host "Continuing with the script execution..."
			Start-Sleep -Seconds 1
			return $true
		} elseif ($userInput.ToUpper() -eq "N") {
			return $false
		} else {
			Clear-Host
			Write-Host "Invalid input. Please enter Y or N."
			continue
		}
	} while ($true)
}


function activateWindows {
	# ACTIVATION KEYS
	# 6TP4R-GNPTD-KYYHQ-7B7DP-J447
	# NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
	# W269N-WFGWX-YVC9B-4J6C9-T83GX
	# VK7JG-NPHTM-C97JM-9MPGT-3V66T 

	# BACKUP SERVER
	# kms.msguides.com
	
	slmgr.vbs -upk
	slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
	slmgr /skms kms.digiboy.ir
	slmgr /ato
}


function installApps {
	$apps = @(
		"7zip.7zip", "Microsoft.PowerToys", "Microsoft.VisualStudioCode", "AIMP.AIMP", 
		"Git.Git", "Neovim.Neovim", "SumatraPDF.SumatraPDF", "VideoLAN.VLC", 
		"AdrienAllard.FileConverter", "dotPDN.PaintDotNet", "OBSProject.OBSStudio", 
		"Valve.Steam", "Mojang.MinecraftLauncher", "GOG.Galaxy", 
		"Google.ChromeRemoteDesktopHost", "QL-Win.QuickLook", "Notion.Notion", 
		"Brave.Brave", "Discord.Discord", "Microsoft.OneDrive", "Obsidian.Obsidian", "GnuPG.Gpg4win"
	)

	foreach ($app in $apps) {
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Yellow
		Write-Host "Installing $app..."
		[System.Console]::ResetColor()
		winget install $app --silent --accept-package-agreements --accept-source-agreements
	}
	
	$downloadedApps = @(
		"https://github.com/msys2/msys2-installer/releases/download/2024-01-13/msys2-x86_64-20240113.exe",
		"https://www.sumatrapdfreader.org/dl/rel/3.5.2/SumatraPDF-3.5.2-64-install.exe", 
		"https://www.aimp.ru/?do=download.file&id=3"
	)
	
	$applicationNames = @("msys2-x86_64-20240113.exe", "SumatraPDF-3.5.2-64-install.exe", "AIMP.exe")
	$i = 0

	Write-Host "Downloading additional applications..."
	
	foreach ($application in $downloadedApps) {
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Yellow
		Write-Host "Downloading $application..."
		[System.Console]::ResetColor()
		Invoke-WebRequest -Uri $application -OutFile "$($applicationNames[$i])"
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Green
		Write-Host "Downloaded $($applicationNames[$i])"
		[System.Console]::ResetColor()
		$i++
	}

	Write-Host "Installation completed."
}


function getCustomizationFiles {

	if (-not (Test-Path -Path "config")) {
		New-Item -ItemType Directory -Path "config"
		New-Item -ItemType Directory -Path "config\fonts"
	}
	
	$customizationFiles = @(
		"https://github.com/druxorey/windots/archive/refs/heads/main.zip",
		"https://github.com/dracula/microsoft-edge/archive/refs/heads/main.zip",
		"https://github.com/hellzerg/optimizer/releases/download/16.7/Optimizer-16.7.exe"
	)

	$fontsFiles = @(
		"https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip",
		"https://dl.dafont.com/dl/?f=elegant_typewriter",
		"https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Noto.zip"
	)


	$fileNames = @("windots.zip", "dracula-for-edge.zip", "optimizer.exe")
	$fontsNames = @("hack-nerd-font.zip", "elegant-typerwiter.zip", "noto-nerd-font.zip")
	$i = 0
	
	foreach ($file in $customizationFiles) {
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Yellow
		Write-Host "Downloading $file..."
		[System.Console]::ResetColor()
		Invoke-WebRequest -Uri $file -OutFile "config\$($fileNames[$i])"
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Green
		Write-Host "Downloaded $($fileNames[$i])"
		[System.Console]::ResetColor()
		$i++
	}

	$i = 0

	foreach ($fonts in $fontsFiles) {
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Yellow
		Write-Host "Downloading $fonts..."
		[System.Console]::ResetColor()
		Invoke-WebRequest -Uri $fonts -OutFile "config\fonts\$($fontsNames[$i])"
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Green
		Write-Host "Downloaded $($fontsNames[$i])"
		[System.Console]::ResetColor()
		$i++
	}
}


function main {
	Clear-Host
	[System.Console]::ForegroundColor = [System.ConsoleColor]::Magenta
	Write-Host "`n[========== WELCOME TO DRUXOREY'S WINDOWS BOOTSTRAP ==========]`n"
	[System.Console]::ResetColor()

	if (askToExecute "Do you want to update the system? (Y/N)") {
		winget upgrade --all
	}

	if (askToExecute "Do you want to activate Windows? (Y/N)") {
		activateWindows
	}

	if (askToExecute "Do you want to install applications? (Y/N)") {
		installApps
	}

	if (askToExecute "Do you want to download the customization files? (Y/N)") {
		getCustomizationFiles
		Write-Host "IMPORTANT: The files were downloaded to the 'config' folder."
}

	if (askToExecute "Do you want to restart the system? (Y/N)") {
		Restart-Computer -Force
	}

	[System.Console]::ForegroundColor = [System.ConsoleColor]::Magenta
	Write-Host "`n[========== SCRIPT EXECUTION COMPLETED ==========]"
	[System.Console]::ResetColor()
}

main