site2archive
============

**site2archive** creates a tar.gz archive of a website including all required resources. It uses phantomjs, hence JavaScript is supported too. The idea is to let wget scrape on basis of the phantomjs results.

Requirements
------------

- python 2.7+
- phantomjs 1.9+
- GNU Wget 1.15+
- GNU tar 1.27.1+


Getting Started
---------------

Starting the local webserver (needed for wget)

    ./server.sh

Scrape the site with resources

    ./site2archive.sh <url> <archive-name>


How It Works
------------

1. Render site using phantomjs (*render.js*) to the directory *server.sh* is watching. We add the *base* tag to persist link consistency
2. Fetch all resources and rewrite url to local using wget by accessing the just rendered markup via localhost
3. Create an archive
