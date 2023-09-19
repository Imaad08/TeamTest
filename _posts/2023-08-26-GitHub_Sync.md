---
toc: true
comments: false
hide: true
layout: post
type: help
title: GitHub Overview
---

## References

### `GitHub` [Review GitHub concepts 2-min](https://www.youtube.com/watch?v=phGdqJB6ep0)

### `Git source control` [VSCode](https://code.visualstudio.com/docs/sourcecontrol/overview)
<br>

## Create GitHub Page Repository
You will want to create a personal Github Pages blog for this class. This is a place where you can code, complete the hacks, and record what you have learned. 

### Git Config
Run the following commands to configure user git connection to GitHub.  This is required,  before pushing code to GitHub.

    ```bash
    # Setup GitHub ID
    git config --global user.email <your email>
    git config --global user.name <your github id>
    # Verify Setup
    git config --list
    ```

### [click to Create Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)

1. Use Template to create [student repository](https://github.com/nighthawkcoders/student) 

2. Once your repository is created, click on the green "Code" button and copy the HTTPS link provided.

3. In Terminal, to your vscode directory (`cd ~/vscode`). Then clone the repository with `git clone <paste from previous step>`.

4. Open your repository in VS Code with `code <repository name>`. Cloud Terminal requires you to open after lanuching VSCode.
<br>

## VSCode commit/sync to GitHub Pages
The VSCode saved files are only stored on your computer locally until you commit and then sync the changes.

### Commit Changes, version control locally
This creates a version of your files in you local git database.  Often developers commit several times before they sync in VSCode or push from command line.  This allows lots of small changes that can be easily reviewed and rolled back.

1. Click on the button that supports "Source Control" in VS Code's left sidebar

2. Click on the plus sign to stage your changes

    ![]({{ site.baseurl }}/images/stage.jpg)

3. Enter a message for your commit in the message box.

4. Click the "Commit button"


### Sync Changes, update change in GitHub
Sync will push files to GitHub and create an Action for GitHub Pages updates, site will update if code is without errors. 

- Click the Menu button and then click "Push".

    ![]({{ site.baseurl }}/images/push.jpg)

- Watch Actions until done, open action link and review changes on github.io

