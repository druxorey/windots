<h1 align="center">Windots</h1>

<p align="center">A streamlined collection of my configuration files for Windows</p>

<!-- ![Desktop Screenshot](/assets/main-rice.webp) -->

## Repository Structure

- `assets`: Contains directories such as cursors for Windows cursors and icons used in the configuration.

- `config`: This directory contains specific configuration files for different programs and tools.

- `scripts`: Contains useful scripts for automating tasks during the initial setup of a Windows installation.

> [!NOTE]
> Some of these scripts may violate Microsoft's guidelines and could be illegal. Whenever possible, acquire original licenses to avoid legal issues and ensure compliance with usage policies.

## Installation

The `windows-bootstrap.ps1` script automates the initial setup and configuration of a Windows system. It activates Windows, installs essential programs, and copies some files for system customization.

This script is particularly useful for users who want a quick and easy installation process. You can find the script [here](scripts/windows-bootstrap.ps1).

To install the script, use the following command:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex (iwr -UseBasicParsing 'https://raw.githubusercontent.com/druxorey/windots/refs/heads/main/scripts/windows-bootstrap.ps1')"
```

## Contribute

If you want to add new scripts or improve existing ones, follow these steps:

1. Open an issue to discuss the changes.
2. Fork this repository.
3. Create a new branch for your contribution: `git checkout -b your-branch-name`.
4. Make your changes.
5. Commit your changes, for example: `git commit -m 'fix(scripts): external licence confirmation.'`.
6. Push your changes to your forked repository: `git push origin your-branch-name`.
7. Open a Pull Request in this repository and reference the original issue.

## License

This project is licensed under the GPL-3.0 License. See the [LICENSE](LICENSE) file for more details.