# NumTide Material for MkDocs base repo

For full documentation visit [mkdocs-material](https://squidfunk.github.io/mkdocs-material/getting-started/).

here are the base steps:

## Clone the repo you want to add mcDocs to.

### Install material for mkDocs on your machine (using Python3 pip)

`python3 -m pip install mkdocs-material`

(This is a global installation - only needs doing first time)

### initiate mkDocs

Go to the root directory of your cloned project and run mkdocs.
This will set up docs folder, index.md and mkdocs.yaml file (note the fullstop)
		
    `mkdocs new .`

This will create the following structure:
.
├─ docs/
│  └─ index.md
|  └─ ** add your .md files here !
└─ mkdocs.yml

** make sure your .md files are all in the docs folder

### customize the mkdocs.yaml file for Urls and Navigation

Copy the custom mkdocs.yaml file into root and
edit the following for your repo:

`site_name:` - change this according to the relevant Numtide repo name

`site_description:` - change this according to the relevant Numtide repo description

`site_url:` - change this according to the relevant Numtide repo docs location - eg https://numtide.github.io/treefmt/

`repo_url:` - change this according to the relevant Numtide repo url


Set the navigation structure:

`nav:`
  - About the project: index.md

This will determine which .md files in the docs folder are shown and where they appear in the header and sidebar navigation
This example is taken from the active treefmt docs 

### Copy custom Assets and stylesheets folders 

Copy custom Assets and stylesheets folders and contents (from this repo) into the docs folder

### Edit index.md file to be the landing docs page

mkDocs needs an index.md page so it needs to be included and should be your landing page

### build your site locally to test

from terminal in root local repo folder run :
`mkdocs serve`

Point your browser to localhost:8000 and you should see the documentation

### setup github repo pages in settings

Goto repo settings/Pages and set the following:

	Build and Deployment - Source =  Deploy from branch
	
	Branch = gh-pages and folder = /(root)

### final project layout

    mkdocs.yml          # The configuration file.
    docs/
        index.md        # The documentation homepage.
        ...             # Other markdown pages, images and other files.
        Assets          # folder containing custom fonts, favicon and logo
        stylesheets     # folder containing custom css file



### Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.