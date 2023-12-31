# GitHub Integration for Roblox Studio with Rojo and Visual Studio Code Developer Documentation

- [GitHub Integration for Roblox Studio with Rojo and Visual Studio Code Developer Documentation](#github-integration-for-roblox-studio-with-rojo-and-visual-studio-code-developer-documentation)
  - [1. Introduction](#1-introduction)
  - [2. Installing Prerequisites](#2-installing-prerequisites)
    - [2.1 Installing Aftman using the auto installer](#21-installing-aftman-using-the-auto-installer)
    - [2.2 Installing Aftman Manually](#22-installing-aftman-manually)
  - [3. Installing Plugins and Extensions](#3-installing-plugins-and-extensions)
    - [3.1 Roblox Studio Plugins](#31-roblox-studio-plugins)
    - [3.2 Visual Studio Code Extensions](#32-visual-studio-code-extensions)
  - [4. Usage](#4-usage)
    - [4.1 Initializing the Directory](#41-initializing-the-directory)
    - [4.2 Github integration](#42-github-integration)
    - [4.3 Building the place File](#43-building-the-place-file)
    - [4.4 Starting the Live Server](#44-starting-the-live-server)
    - [4.5 Connecting to the Live Server](#45-connecting-to-the-live-server)
  - [5. Working with Wally Extension](#5-working-with-wally-extension)
    - [5.1 Initializing Wally](#51-initializing-wally)
    - [5.2 Adding Project Dependencies](#52-adding-project-dependencies)
    - [5.3 Installing Dependencies](#53-installing-dependencies)
    - [5.4 Adding Packages to the Game](#54-adding-packages-to-the-game)
  - [6. Using the Linter](#6-using-the-linter)
    - [6.1 Setting Up Selene](#61-setting-up-selene)
  - [7. Troubleshooting](#7-troubleshooting)
  - [8. Frequently Asked Questions (FAQ)](#8-frequently-asked-questions-faq)
  - [10. Support and Community](#10-support-and-community)


## 1. Introduction
This repository serves as a comprehensive guide and template for integrating Roblox Studio with GitHub using Rojo and Visual Studio Code. Streamline your collaboration and version control workflows, enabling efficient development and seamless integration between these powerful tools. Follow the provided documentation to set up a robust development environment, leverage Rojo's capabilities, and enhance your productivity in creating amazing Roblox experiences. Connect with the community and explore the possibilities of GitHub integration for your Roblox Studio projects.

## 2. Installing Prerequisites
Before using Rojo Visual Studio to Roblox Studio integration, ensure the following prerequisites are met:
- Device running on Windows 8 or later versions.
- Visual Studio Code is installed on your system.
- Roblox Studio is installed on your system.

It is recommended to use [Aftman](https://github.com/LPGhatguy/aftman) as your toolchain manager.
A toolchain manager is a software utility that simplifies the installation and management of development toolchains, providing a centralized interface to handle the setup and configuration of necessary tools for software development.
- You can view aftman here: https://github.com/LPGhatguy/aftman

### 2.1 Installing Aftman using the auto installer
To automatically install Aftman, Rojo, and Wally on Windows, run the installer script from the [installer](https://github.com/zacharie410/GitHub-Integration-for-Roblox-Studio-with-Rojo-and-Visual-Studio-Code/releases/tag/InstallerV2)
If you use the auto installer, you can skip the manual installation process.

### 2.2 Installing Aftman Manually
Follow these steps to install Aftman and set up the environment:

1. Download and Install Aftman from the [official repository or release page](https://github.com/LPGhatguy/aftman/releases)

After you have installed aftman, run the following commands:
```console
aftman add --global rojo-rbx/rojo
aftman add --global UpliftGames/wally
aftman install
```
This will install rojo and wally globally.

## 3. Installing Plugins and Extensions

### 3.1 Roblox Studio Plugins
Follow these steps to install the Rojo plugin in Roblox Studio:
1. Open a PowerShell or command line prompt
2. Run the following command:
   ```console
   rojo plugin install
   ```

### 3.2 Visual Studio Code Extensions
To enhance your development experience with Rojo Visual Studio to Roblox Studio integration, it is recommended to install the following Visual Studio Code extensions. These extensions provide additional functionality and tools specific to Roblox development.

1. Highly Recommended: **Selene** (by Kampfkarren): Selene is a powerful linter for Roblox Lua scripts. This extension integrates Selene into Visual Studio Code, providing real-time linting, code analysis, and error detection as you write code. It helps you maintain code quality and adhere to Roblox Lua coding standards.
   
2. Highly Recommended: **Roblox LSP** (by Nightrains): Roblox LSP (Language Server Protocol) extension provides advanced language features for Roblox Lua scripting. It includes features like IntelliSense, diagnostics, and code navigation, enhancing your coding productivity and accuracy.

3. Highly Recommended: **Roblox API Explorer** (by evaera): This extension allows you to explore the Roblox API documentation directly within Visual Studio Code. It provides autocomplete suggestions, documentation tooltips, and quick access to Roblox API references.

4. Highly Recommended: **Rojo Viewer** (by Filip Tibell): Rojo Viewer extension provides a visual representation of your Rojo project's structure within Visual Studio Code. It helps you visualize the relationships between files, folders, and namespaces in your project, making it easier to navigate and understand the project's organization.

Installing these recommended extensions can greatly enhance your development workflow and productivity when working with Rojo Visual Studio to Roblox Studio integration.

Note: You can install these extensions directly from the Visual Studio Code marketplace by searching for their respective names and following the installation instructions provided by each extension.

## 4. Usage
### 4.1 Initializing the Directory
To initialize a directory for Rojo integration, follow these steps:
1. Open the terminal or command prompt.
2. Navigate to the directory where you want to initialize your game.
3. Run the following command:
   ```console
   rojo init my-new-game
   ```
   This will initialize the directory with the specified name (in this case, the name is "my-new-game").
### 4.2 Github integration
It is recommended to use Visual Studio Code Source Control with Github Desktop integrated.
Be sure to have a `.gitignore` file which contains the following:
```.gitignore
# Project place file
/build.rbxlx

# Roblox Studio lock files
/*.rbxlx.lock
/*.rbxl.lock
```

### 4.3 Building the place File
To build the place file using Rojo, follow these steps:
1. Open the terminal or command prompt.
2. Navigate to the directory where your game files are located.
3. Run the following command:
   ```console
   rojo build -o build.rbxlx
   ```
   This will generate the rbxlx file named "build.rbxlx" in the current directory.

Alternatively, a place file could be created via Roblox Studio.
### 4.4 Starting the Live Server
To start the Rojo live server, follow these steps:
1. Open the terminal or command prompt.
2. Navigate to the directory where your game files are located.
3. Run the following command:
   ```console
   rojo serve
   ```
   This will start the Rojo live server

### 4.5 Connecting to the Live Server
To connect to the live server from Roblox Studio, follow these steps:
1. Open Roblox Studio.
2. Open the build file created in the previous step (`build.rbxlx`).
3. In Roblox Studio, click on the "Rojo" tab.
4. Click on the "Connect" button to connect to the live server.
5. Now, any changes you make in Visual Studio Code will be automatically synced with Roblox Studio.

**Note:** It is recommended to exclusively edit scripts from Visual Studio Code when editing the build file to avoid potential data loss.

## 5. Working with Wally Extension
The Wally extension provides additional functionality for managing plugins and dependencies. Follow the steps below to use the Wally extension with Rojo.

### 5.1 Initializing Wally
To initialize Wally in your project directory, follow these steps:
1. Open the terminal or command prompt.
2. Navigate to your project directory.
3. Run the following command:
   ```console
   wally init
   ```

### 5.2 Adding Project Dependencies
To add project dependencies using Wally, follow these steps:
1. Open the `wally.toml` file located in your project directory.
2. Add the project dependencies to the file in the following format:
   ```toml
   [dependencies]
   roact = "roblox/roact@1.4.4"
   ```
   Specify the required dependency along with its version.

### 5.3 Installing Dependencies
To install the project dependencies using Wally, follow these steps:
1. Open the terminal or command prompt.
2. Navigate to your project directory.
3. Run the following command:
   ```console
   wally install
   ```
   This will install the specified dependencies.

### 5.4 Adding Packages to the Game
To add packages to the game using Wally, follow these steps:
1. Open the default project JSON file in Visual Studio Code.
2. Add the following code snippet to the JSON file:
   ```json
   "ReplicatedFirst": {
     "Packages": {
       "$path": "Packages"
     }
   }
   ```
   This will add the packages to the build.

## 6. Using the Linter
To use the linter with Rojo, follow these steps:

### 6.1 Setting Up Selene
To set up Selene for linting in your project directory, follow these steps:
1. Create a `selene.toml` file in your project directory.
2. Write the following content in the `selene.toml` file:
   ```toml
   std = "roblox"
   ```
   This configures Selene to use the Roblox standard library.

## 7. Troubleshooting
If you encounter any issues or errors while using Rojo Visual Studio to Roblox Studio integration, refer to the Rojo documentation or community forums for troubleshooting steps and solutions.

## 8. Frequently Asked Questions (FAQ)
Q: Can I edit scripts directly in Roblox Studio while using Rojo?
A: It is recommended to exclusively edit scripts from Visual Studio Code to avoid potential data loss. Editing scripts directly in Roblox Studio while using Rojo can lead to overwritten changes.

Q: How can I update the project dependencies with Wally?
A: Simply update the version numbers of the dependencies in the `wally.toml` file and run `wally install` to update the dependencies.

Q: What is **Rojo - Roblox Studio Sync** (by evaera)
A: The [Rojo extension](https://github.com/rojo-rbx/vscode-rojo) provides seamless synchronization between Visual Studio Code and Roblox Studio. It replaces the need for many installation steps, however may not be an end all solution for all project requirements. That being said, it may be a good option for you: https://marketplace.visualstudio.com/items?itemName=evaera.vscode-rojo

## 10. Support and Community
If you need further support or want to engage with the community, you can visit the following resources:

- [Rojo GitHub repository](https://github.com/rojo-rbx/rojo)
- [Rojo Discord server](https://discord.gg/d5MVRPZ)
- [Wally GitHub repository](https://github.com/evaera/Wally)
- [Wally Discord server](https://discord.gg/Ywg4PfsD4z)
- [Roblox API Explorer GitHub repository](https://github.com/evaera/roblox-api-explorer)
- [Roblox LSP GitHub repository](https://github.com/NightrainsRbx/roblox-lsp)
- [Rojo Viewer GitHub repository](https://github.com/rojo-rbx/rojo-viewer)
- [Selene GitHub repository](https://github.com/Kampfkarren/selene)

Feel free to reach out to the respective communities for any questions or assistance related to Rojo, Wally, the recommended extensions, or the integration between Visual Studio Code and Roblox Studio.