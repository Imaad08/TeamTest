## Blog site using GitHub Pages and Jekyll
> This site is intended for Students.   This is to record plans, complete hacks, and do work for your learnings.
- This can be customized to support computer science as you work through pathway (JavaScript, Python/Flask, Java/Spring)
- All tangible artifact work is in a _posts or in a _notebooks.  
- Front matter (aka meta data) in ipynb and md files is used to organize information according to week and column in running web site.

## GitHub Pages
All `GitHub Pages` websites are managed on GitHub infrastructure. GitHub uses `Jekyll` to tranform your content into static websites and blogs. Each time we change files in GitHub it initiates a GitHub Action that rebuilds and publishes the site with Jekyll.  
- GitHub Pages is powered by: [Jekyll](https://jekyllrb.com/).
- Publised teacher website: [nighthawkcoders.github.io/teacher](https://nighthawkcoders.github.io/teacher/)

## Preparing a Preview Site 
In all development, it is recommended to test your code before deployment.  The GitHub Pages development process is optimized by testing your development on your local machine, prior to files on GitHub

Development Cycle. For GitHub pages, the tooling described below will create a development cycle  `make-code-save-preview`.  In the development cycle, it is a requirement to preview work locally, prior to doing a VSCode `commit` to git.

Deployment Cycle.  In the deplopyment cycle, `sync-github-action-review`, it is a requirement to complete the development cycle prior to doing a VSCode `sync`.  The sync triggers github repository update.  The action starts the jekyll build to publish the website.  Any step can have errors and will require you to do a review.

### WSL and/or Ubuntu installation requirements
- The result of these step is Ubuntu tools to run preview server.  These procedures were created using [jekyllrb.com](https://jekyllrb.com/docs/installation/ubuntu/)
- Run scripts in scripts directory of student repo: setup_ubuntu.sh and activate.sh. Expected name of the repository to run these scripts is 'student'.

### MacOs installation requirements 
- Ihe result of these step are MacOS tools to run preview server.  These procedures were created using [jekyllrb.com](https://jekyllrb.com/docs/installation/macos/). Run scripts in scripts directory of student repo: setup_macos.sh and activate_macos.sh. Expected name of the repository to run these scripts is 'student'.

### Preview
- The result of these step is server running on: http://0.0.0.0:4100/teacher/.  Regeneration messages will run in terminal on any save.  Press the Enter or Return key in the terminal at any time to enter commands.

- Complete installation
```bash
bundle install
```
- Run Server.  This requires running terminal commands `make`, `make stop`, `make clean`, or `make convert` to manage the running server.  Logging of details will appear in terminal.   A `Makefile` has been created in project to support commands and start processes.

    - Start preview server in terminal
    ```bash
    cd ~/vscode/teacher  # my project location, adapt as necessary
    make
    ```

    - Terminal output of shows server address. Cmd or Ctl click http location to open preview server in browser. Example Server address message... 
    ```
    Server address: http://0.0.0.0:4100/teacher/
    ```

    - Save on ipynb or md activiates "regeneration". Refresh browser to see updates. Example terminal message...
    ```
    Regenerating: 1 file(s) changed at 2023-07-31 06:54:32
        _notebooks/2024-01-04-cockpit-setup.ipynb
    ```

    - Terminal message are generated from background processes.  Click return or enter to obtain prompt and use terminal as needed for other tasks.  Alway return to root of project `cd ~/vscode/teacher` for all "make" actions. 
        

    - Stop preview server, but leave constructed files in project for your review.
    ```bash
    make stop
    ```

    - Stop server and "clean" constructed files, best choice when renaming files to eliminate potential duplicates in constructed files.
    ```bash
    make clean
    ```

    - Test notebook conversions, best choice to see if IPYNB conversion is acting up.
    ```bash
    make convert
    ```
### Meta Data (Front Matter)
- Meta data also known as front matter is a set of key value pairs that can provide additional information to github pages about .md and .ipynb files. This can and probably will be used in other file types (ie doc, pdf), if we added them to the system.

- In the front matter you can also define things like a title and description for the page.  Additional front matter is defined to place content on "Computer Science Lab Notebook" page.  The `courses:` key will place data on a specific page with the nested `week:` placing data on a specific row on the page.  The `type:` key in front matter will place blog under the plans, hacks(ToDo), and tangibles column. 

- In our files the front matter is defined at the top of the page or the first markdown cell.

    - First open one of the .md or .ipynb files already included in either your _posts folder or your _notebooks folder.

    - In the .md file you should notice something similar to this at the top of the page. To see this in your .ipynb files you will need to double click the markdown cell at the top of the file.

    ```yaml
    ---
    toc: true
    comments: false
    layout: post
    title: Daily Plan Sample
    description: Example Blog!!!  This shows planning and notes from hacks.
    type: plans
    courses: { compsci: {week: 0} }
    ---
    ```

- Front matter will always have '---' at the top and bottom to distinguish it and each key value pair will be separated by a ':'.

- Here we can modify things like the title and description.

- The type value will tells us which column this is going to appear under, supported values: `plans`, `hacks`, `tangibles`.

- The courses tells us which menu item it will be under, in this case the `compsci` menu, and the `week` tells it what row (week) it will appear under that menu.

- In our examples,  hacks(ToDo) contains references to our IPYNB files; these are stored in GitHub under the `_notebooks` folder.   The plans and tangibles contains references to our MD files; these are stored in GitHub under the `_posts` folder.

- Key files in Computer Science Lab Notebook
    - `compsci.md` - this is the "Computer Science Lab Notebook" page and is the link `https://nighthawkcoders.github.io/student/compsci`.  It contains the Title and Number of units on the page.
    - `_data/compsci.yml` - this contains the supporting data that helps organize the units on the page.
    - `_layouts`\schedule.html - this contains code, in the Liquid language, that generates the HTML for all the rows and columns.
    - fyi, the schedule.html could work for another type of page.  For instance, you could make a csa.md, _data/csa.yml, and tag files with `csa: {week: 0}` under courses.
