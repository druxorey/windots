function askToExceute {
	param (
		[string]$message
	)
	Write-Host $message
	$userInput = Read-Host
	switch ($userInput.ToUpper()) {
		"Y" {
			Write-Host "Continuing with the script execution..."
			return $true
		}
		"N" {
			Write-Host "Ending the script."
			return $false
		}
		default {
			Write-Host "Invalid input. Please enter Y or N."
		}
	}
}

function ActivateWindows {
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

function InstallApps {
	$apps = @(
		"7zip.7zip", "Microsoft.PowerToys", "Microsoft.VisualStudioCode", "AIMP.AIMP", 
		"Git.Git", "Neovim.Neovim", "SumatraPDF.SumatraPDF", "VideoLAN.VLC", 
		"AdrienAllard.FileConverter", "dotPDN.PaintDotNet", "OBSProject.OBSStudio", 
		"Valve.Steam", "Mojang.MinecraftLauncher", "GOG.Galaxy", 
		"Google.ChromeRemoteDesktopHost", "QL-Win.QuickLook", "Notion.Notion", 
		"Brave.Brave", "Discord.Discord", "Microsoft.OneDrive", "Obsidian.Obsidian"
	)

	foreach ($app in $apps) {
		Write-Host "Installing $app..."
		winget install $app --silent --accept-package-agreements --accept-source-agreements
	}

	Write-Host "Installation completed."
}

function Main {
	Write-Host "[========== WELCOME TO DRUXOREY'S WINDOWS BOOTSTRAP ==========]"
	if (askToExceute "Do you want to activate Windows? (Y/N)") {
		ActivateWindows
	}

	if (askToExceute "Do you want to install applications? (Y/N)") {
		InstallApps
	}
}

Main