# Jekyll personal website

This repository is my professional website. This was inspired by the [HydeJack theme](https://hydejack.com/). It is implemented using [Jekyll](https://jekyllrb.com/) and its configuration is detailed below.

## Highlights

- Easy to write: just use Markdown,
- Multi-pages site,
- Handles up to two languages,
- Handles BibTex list of publications,
- Displays a list of social links.

## Installation

Before we install Jekyll, we need to make sure we have all the required dependencies.

```
sudo apt-get install ruby-full build-essential zlib1g-dev
```

You may want to install all gems (*gems are the ruby packages*) in your personal folder. Then, execute the following commands to include env variables definition in your `.bashrc`.

```
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Then, install `bundler`. This is a gem manager.

```
gem install bundler
```

Finally, you need to install the gems required to build the website (incl. `jekyll`). To do that, `bundle` will read your `Gemfile` file, install the required gems and lock the versions by creating a `Gemfile.lock` file. Please run the following command.

```
bundle install
```

## File structure

The repository is organized around folders. Some should be modified, other should not. The files and folders you could modify are:

- `assets/`: contains javascripts, css and other codes. All these files are included in the final site folder. *Additional documents to include (like pdf) should lay inside*,
- `_bibliography/`: contains the `.bib` BibTex files used to generate the Publication page,
- `_data/`: stores two files `logos.yml` and `social.yml` to define the logos for the welcome page and the social links for the sidebar,
- `_i18n/`: contains the translated pages. **The main content is here**,
- `_pages/`: contains the core (blank) pages definition which call the translated pages,
- `publications/`: my published papers as pdf files which are included in the final site,
- `_config.yml`: *this is the main configuration file*.

The files and folders that should not be modified are:

- `_includes/`: some code to be included in core files for events and logos,
- `_layouts/`: the webpage layouts,
- `_pluggins/`: some self-written pluggins,
- `Gemfile`: lists the website ruby dependencies,
- `index.md`: the root page,
- `robot.txt`: a file that build the sitemap for search engines.

Finally, the `_site/` folder will contain the final content to upload to your server.

## Configuration

### Basics info

Please open the `_config.yml` file and modify your infos. See below for more info about laguages.

### Modify your social media

Your social media are defined in the `_data/social.yml` file and appear at the bottom of the left bar. This file looks like:

```
- link: mailto:etienne.monier@enseeiht.fr
  title: Email
  class: icon-mail

- link: https://www.linkedin.com/in/etienne-monier-7252a19b/
  title: LinkedIn
  class: icon-linkedin2

- link: https://github.com/etienne-monier
  title: Github
  class: icon-github

- link: https://scholar.google.fr/citations?user=S28G8eMAAAAJ&hl=fr&oi=ao
  title: Google Scholar
  class: ai ai-google-scholar-square

- link: https://www.lairdubois.fr/etienne31
  title: L'air du bois
  class: icon-ladb_2
```

Each entry needs three infos: the link, the name (which is what appear when the cursor goes above the link) and a class (this defines the icon to use).

To know the class input, please go to the [FontAwesome icon search](https://fontawesome.com/icons) and get the desired icon associated class (e.g., `fas fa-envelope` for [this envelope](https://fontawesome.com/icons/envelope?style=solid)). For academic icons, please use e.g. `ai ai-cv` with `cv` one of the [academicons icons](http://jpswalsh.github.io/academicons/).

### Modify the institute logos

The welcome page displays your institute logos as links. To define this, you should modify the `_data/logos.yml` file which looks like:

```
- name: IRITlogo
  link: https://www.irit.fr/
  src: assets/images/Logo_IRIT.png

- name: Toulouselogo
  link: http://www.univ-toulouse.fr/
  src: assets/images/Logo_univToulouse.jpg

- name: ENSEEIHTlogo
  link: http://www.enseeiht.fr/fr/index.html
  src: assets/images/Logo_ENSEEIHT.png
```

where the name is the link name, the link is the institute website url and src is the logo location.

### Languages and pages

The website handles up to two languages. **For each language is associated one 2-letter key**. This key is, e.g. `fr` for French, `en` for English, etc. These keys should be defined in the `_config.yml` file inside the `languages` variable (be aware that the first in the list is the default one). The `text_to_lang` variable defines the links text to switch between the two languages.

Let's talk about structure. The jekyll builder searches for site pages in the `_pages/` directory. Each page calls the translated page which lays in the `_i18n/` folder. This folder should have two subdirectories with the language keys as names (e.g. `_i18n/fr/` and `_i18n/en/`) and their associated config files (e.g. `_i18n/fr.yml` and `_i18n/en.yml`).

Each page in the `_pages/` directory has (e.g. in French, *idem* in English):

- a twin in the `_i18n/fr/` folder which defines the content for the French language,
- a title to be defined in the `_i18n/fr.yml` file,
- a description to be defined in the `_i18n/fr.yml` file,
- a navigation item to be defined in the `_i18n/fr.yml` file.

If you want to add a page, please copy/modify a page in the `_pages/` directory and add all these elements for all languages.

Finally, to modify the pages text, please modify the `_i18n/fr/` folder content. *Do not forget to modify also the `_i18n/fr.yml` variables*.

### Publications

The publication content is located in the `_bibliography/` folder files. These should be `.bib` BibTex files. They are loaded in the Publication page like this (e.g. `_i18n/fr/publicatios.md`).

```
# Publications et conférences
{: .page-title .hr}

## Journaux internationaux

{% bibliography --file InternPapers %}

## Conférences internationales

{% bibliography --file InternConfs %}

## Conferences nationales

{% bibliography --file NationalConfs %}
```

This means that you should define as many files as you want sections.

Each BibTex entry can be displayed with several links:

- `BIBTEX` which always appear,
- `ABSTRACT` which is displayed only if the `abstract` key is in the entry,
- 'WEB', 'ARXIV' are links defined in the `web` and `arxiv` keys in the entry,
- `PDF` is more tricky. It appears only if an associated pdf is located in the `publications` folder. The association is made only if the file name is e.g. `monier2017gretsi.pdf` for the `monier2017gretsi` entry.


## Building the site

Two cases: or you want to build the site to develop it, or that's for final production.

In the first case, jekyll mimics a local server. Just use `bundle exec jekyll serve` and go to `http://127.0.0.1:4000/` on your navigator.

In the second case, type `bundle exec jekyll build`. The output content is located in te `_site/` folder.

## Author and License

This was written by Etienne Monier except the core Hydejack style.

This is distributed under GNU General Public License v3.0.
