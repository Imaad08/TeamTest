<!-- ---
toc: true
comments: true
layout: post
title: Prunned Tool Procedure ...
description: Example hacks!!! This shows procedures performed by student, not the procedures for the entire class.  Modified or prunned for specific machine.
courses: { compsci: {week: 0} }
type: hacks
--- -->

## Hacks
> Complete the procedure below accurately.  These are absolutely required and must be 100% accurate for your success.

### GitHub Account
- Follow instruction [https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)  Use your own personal/permanent email... NOT SCHOOL!!! GitHub account belongs to you.

### MacOS 1st Time Developer
> VSCode install
- Install [VSCode](https://code.visualstudio.com/docs/setup/mac)

> Anaconda install
- Download for MacOS: [Anaconda](https://www.anaconda.com/products/distribution)
- Run Install: Answer yes to questions

> Homebrew install
- Copy and Paste to Install from Terminal [Homebrew](https://brew.sh)
    - Copy ```bash ... curl ...```  command using copy box on website
    - Launch ```terminal``` from search bar
    - Paste ```bash ... curl ...``` command into Terminal ... 
    - Make sure command starts, this should provide feedback/output in terminal and could take a long time, like 10-min, there could be a  prompt in the middle, at about 5-minutes.  Follow any on screen instructions provided in terminal output to finish.
- Homebrew installs a tool called "brew" which helps add and manage developer packages on MacOS.

> At this point, the next task is to prepare tools.  <mark>You must start a new Terminal</mark>.  Now the Terminal prompt should be <mark>prefixed with (base)</mark>.  If not, you need to go back to Anaconda install.
- Open new Terminal, your prompt should look like this...
```bash
(base) iMac:~ jmort1021$
```

> Key Packages needed on MacOS
- <mark>Close and Start a new terminal</mark>, run each command in Terminal
```bash
$ brew list # list packages
$ brew update # update package list
$ brew upgrade # upgrade packages
$ brew install git  # install latest git
$ brew install python # install python3 for development
$ python --version # version of python3 installed
```
### Windows 1st Time Developer
> VSCode install using WSL. Windows users have option to have best of Windows and Linux while developing within VSCode.
- Install [VSCode using WSL]({{site.baseurl}}/techtalk/vscode-wsl).
- Required review, become familiar with [Windows WSL development](https://code.visualstudio.com/docs/remote/wsl-tutorial)

> Anaconda install on WSL.
- Try the exact commands in WSL Command / Powershell.  
- Only if there is a wget error... To find the latest Linux-x86 distribution hover over ```64-Bit (x86) Installer``` of this page: https://www.anaconda.com/download#downloads.  Hover over  wget and Anaconda3 commands based on new link.
```bash
> PS C:\Users\UserName> wsl  # Windows prompt to WSL command
$ cd /tmp
$ wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
$ chmod +x Anaconda3-2023.03-1-Linux-x86_64.sh
# Answer yes to all the prompts
$ ./Anaconda3-2023.03-1-Linux-x86_64.sh
```

> At this point, the next task is to prepare for Packages, Jupyter Notebooks, and Kernels.  <mark>You must start a new WSL Command / Powershell</mark>.  Now the WSL prompt should be <mark>prefixed with (base)</mark> from Anaconda install.  If not, you need to go back to Anaconda install.
- Open Command / Powershell.  If you are not looking like this you need to back up.
```bash
> PS C:\Users\ShayM> wsl  # Windows prompt
(base) shay@MSI:/mnt/c/Users/ShayM$ cd ~ # WSL prompt
(base) shay@MSI:~$ # WSL home, best place to install files
```

> Key Packages needing update on WSL Ubuntu
- In a WSL Command / Powershell install Python3
```bash
$ sudo apt list # list packages
$ sudo apt update # update package list
$ sudo apt upgrade # upgrade packages
$ sudo apt install python3 python3-pip # install python3 and pip3 for development
$ python --version  # version of python3 should be shown


### Jupyter Install and Kernels (MacOs and WSL)

> Install Jupyter and check python kernel 
```bash
(base) id:~$ conda --version 
(base) id:~$ conda install jupyter # install jupyter
(base) id:~$ jupyter kernelspec list # list installed kernels
Available kernels:
  python3    /home/shay/.local/share/jupyter/kernels/python3
```
