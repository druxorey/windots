function askToExceute {
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
		"Brave.Brave", "Discord.Discord", "Microsoft.OneDrive", "Obsidian.Obsidian"
	)

	foreach ($app in $apps) {
		[System.Console]::ForegroundColor = [System.ConsoleColor]::Yellow
		Write-Host "Installing $app..."
		[System.Console]::ResetColor()
		winget install $app --silent --accept-package-agreements --accept-source-agreements
	}

	Write-Host "Installation completed."
}


function main {
	Clear-Host
	[System.Console]::ForegroundColor = [System.ConsoleColor]::Magenta
	Write-Host "`n[========== WELCOME TO DRUXOREY'S WINDOWS BOOTSTRAP ==========]`n"
	[System.Console]::ResetColor()

	if (askToExceute "Do you want to activate Windows? (Y/N)") {
		activateWindows
	}

	if (askToExceute "Do you want to install applications? (Y/N)") {
		installApps
	}
}

main