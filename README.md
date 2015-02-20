site2archive
============

**site2archive** creates a tar.gz archive of a website including all required resources. It uses phantomjs, hence JavaScript is supported too.
Usually one dumps a website using wget only, though this lacks of JS support. The idea of this tool is to create a proxy, that will handle the JS. From that point, wget can be used to scape the site.

Requirements
------------

- python 3+
- phantomjs 1.9+
- GNU Wget 1.15


Getting Started
---------------

Starting the local webserver (needed for wget)

    ./server.sh

Scrape the site with resources

    ./site2archive.sh <your-url> <archive-name>


Details
-------

1. Render site using phantomjs (render.js)
2. Adding the <base> tag to persist link consistency
3. Fetch all resources and rewrite url to local using wget
4. Create an archive
