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

Starting the proxy

```./server.sh```

Dump the file

```./site2archive.sh <your-url>```

