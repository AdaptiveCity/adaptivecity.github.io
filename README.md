# adaptivecity.github.io

This is the Git repo for [our online web content](https://adaptivecity.github.io)

In summary there are three ways to edit this web content:

1. Use the edit forms built into the GitHub website, e.g. to create a 'New' file and upload an image into the `_people` directory.

2. Use this project like any other repo, i.e. `git clone https://github.com/adaptivecity/adaptivecity.github.io` and edit the files with
your favorite desktop editor. For a minor change a straight push back to branch `main` will be fine, for anything more substantial
it makes sense to create a new branch.

3. Follow step 2. and also install [Jekyll](https://jekyllrb.com/) (instructions below). This will allow you to serve the website locally and admire your
changes as you make them.

## Common content editing tasks

### Add a Person to the People page

Put a portrait image into directory `_people/images`. If you're shy, google images "anonymous portrait" and pick one of those...

In directory `_people/` create a new file `<INITIAL>_<yourname>.md` or `<INITIAL>_<yourname>.html` where `<INITIAL>` is purely used for lexical ordering E.g. I used `L_ijl20.md`. The `md` vs. `html` choice allows you to use either format for your content although either way the page needs to start with a Jekyll frontmatter setting required variables. `office`/`phone` are unused at the moment. See example:

```
---
name: Ian Lewis
office: FE11
phone: (3)31859
image: ijl20.jpg
homepage: https://www.cl.cam.ac.uk/~ijl20
---

Ian Lewis is Director of the Adaptive Cities Programme in the Computer Laboratory. His research interests
are the real-time collection and analysis of urban sensor data and the evolution of the intelligent
Future City. Research themes include sensor networks, intelligent sensor design, real-time processing,
prediction, planning and privacy. His PhD, from the Cambridge Computer Lab, was concerned with robust
distributed parallel AI.
```

### Add a Project to the Projects page

Same routine as for People, just different directories.

Reuse or put a suitable image into directory `_projects/images`.

In directory `_projects`, create a new file `<INITIAL>_<newproject>.md` or `<INITIAL>_<newproject>.hmtl` as with Person above, e.g.:

```
---
title: ACP Web
link: https://github.com/AdaptiveCity/acp_web
contact_name: Ian Lewis
contact_link: https://www.cl.cam.ac.uk/~ijl20
image: github.png
---

Provides the 'http' interface to the Adaptive City Platform supporting
visualization of 'historical' and 'real-time' data, as well as a traditional
'request-response` set of API's to the stored data.

The web platform works with
both data held in storage (including the most recent) **and** streaming data flowing
through the platform. The latter is delivered by ACP Server via websockets to the browser.
```

### Add a research theme to the Research page

Same as People or Projects, in the `/_research` directory.

## File locations / directory structure

### Homepage

`/index.html`, which uses the main `default` template, see below.

### People

`/_people/` contains all the 'person' text files and images that populate the People page. See instructions above.

`/people/index.html` contains the People page content with a templating loop that embeds the 'person' files.

`/people/assets/images` is a symbolic link to `/_people/images` which was my convention so adding a person can be done entirely in the `_people` directory instead of scattering pieces around.

### Projects

`/_projects/` similarly contains all the 'project' text files and images for the Projects page

`/projects/index.html` contains the Projects page content with a templating loop that embeds the 'project' files.

`/projects/assets/images` is a symbolic link to `/_projects/images` which was my convention so adding a project can be done entirely in the `_projects` directory instead of scattering pieces around.

## Default template and includes

Each main page contains a Jekyll **frontmatter** delimited by two `---` lines which set variables the Jekyll page-build process will use. For the Home page this is currently:
```
---
layout: default
title: Home
---
```

`_layouts/default.html` is a template for a page in the 'Cambridge' style, currently used site-wide.

In an effort of supreme elegance, this `default` template currently contains:

```
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en" class="no-js">
<head>
{% include default_head.html %}

</head>
<body class="campl-theme-5">

{% include srg_header.html %}

<!-- PAGE CONTENT -->
{{ content }}
<!-- END PAGE CONTENT -->

{% include srg_footer.html %}

</body>
</html>
```

The 'include' files are:

`_includes/default_head.html` - a HTML fragment representing the contents of the `<head>` element of the web page, hence pulling in all the Cambridge Project Light stylesheet/js crapola. This template also has a useful hook to embed an additional stylesheet for any page using this 'include' (including via the default template), i.e. if the frontmatter of a sub-page contains:

```
css: foo
```

then a link to a stylesheet `/assets/style/css/foo.css` will be loaded in the page header.

`_includes/srg_header.html` - stuff at the top of the `<body>` that draws the rather large Cambridge header.

`_includes/srg_footer.html` - similar stuff that the bottom of the `<body>` that draws the Cambridge footer.

# Setting up a local view/edit system with Jekyll

Note this is not **essential** for a basic edit of the content. I.e. you can simply `git clone` the repo, make some simple text
edits, and push the result back up to GitHub. However, if you run Jekyll locally (i.e. the same software GitHub is using to
generate the GitHub Pages) you can view the web content locally as you edit.

## Installing Jekyll with Docker

If you don't already have Docker, [install Docker Engine](https://docs.docker.com/engine/install/).

The `Makefile` encodes some runes to use a supported [`jekyll` Docker image](https://github.com/jekyll/jekyll-docker) to build the site, and to serve it up locally for test.

```sh
: mort@greyjay:www$; make help
-- help:
  list targets

-- all: site


-- clean:
  remove build artefacts

-- site:
  build site

-- test:
  serve site for testing

-- drafts:
  serve site, including draft posts
```

The latter two targets (`test`, `drafts`), serve the site at <https://localhost:$(PORT?=8080)/>. Editing content files while the site is being served will cause Jekyll to rebuild the edited files.

In the `adaptivecity.github.io` directory:
```
sudo make all
```
On completion you should have a `/_site` directory.

Then to serve the site *on port 8080*:
```
sudo make test
```

Visit `http://localhost|<servername>:8080`, and the site will auto-rebuild if you edit any file in the repo.

Note currently (Nov 2020) these `make` scripts have a 3-minute startup time.

## Using a native install Jekyll (Ubuntu example)

Due to configuration differences between desktop Jekyll and GitHub Pages this wasn't totally
seamless but works fine after our compatible site conventions are adopted in the project. Below
are a couple of examples

## Native install Jekyll on Ubuntu

```
sudo apt install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Now you should be able to locally serve (on port: 4000) the web content:

```
./jekyll_serve.sh
```
which is currently simply `bundle exec jekyll serve --livereload --host 0.0.0.0` *using default port 4000*

I.e. you can access the web pages at `http://<servername>:4000/`

## Using Jekyll via Docker


E.g. for Ubuntu I did the following, I think the Docker install downloads ~500MB:
```
sudo apt update
sudo apt upgrade
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
```

Then in the `adaptivecity.github.io` directory:
```
sudo make all
```
This took 3 minutes on my home PC, and on completion you should have a `/_site` directory.

Then to run the site *on port 8080*:
```
sudo make test
```

This will serve the web content on port 8080, and the site will auto-rebuild if you edit any file in the repo.

On my home PC there was a similar 3 minute delay before the site appeared on port 8080.
