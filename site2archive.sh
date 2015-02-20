#!/bin/sh
URL=$1
ARCHIVE=$2
PORT='9900'

usage ()
{
  echo "usage: <URL:string> <ARCHIVE_NAME:string>"
  exit
}

[ -n "$1" ] || usage
[ -n "$2" ] || usage

echo "URL ${URL}"
ESC_URL=$(echo "${URL}" | sed -e 's/[a-z:]*\/\///g' | sed -e 's/\//_/g')
DUMP_NAME="${ESC_URL}.html"
DUMP_FILE="files/${DUMP_NAME}"

# Render HTML+JS and dump the file
echo "Rendering to ${DUMP_FILE}"
phantomjs render.js ${URL} > "${DUMP_FILE}"

# wget to tmp dir
TMP_DIR=`mktemp -d -t`

echo "Scraping to $TMP_DIR"

# wget will download all resources and rewrite pathes
# see http://superuser.com/questions/55040
`wget --quiet -E -H -k -K -p --no-directories -P $TMP_DIR localhost:${PORT}/${DUMP_NAME}`

# rename to index.html
`mv $TMP_DIR/${DUMP_NAME} $TMP_DIR/index.html`

# create archive
ARCHIVE_FILE="${ARCHIVE}.tar.gz"
TAR=`cd ${TMP_DIR} && tar -cvzf ${ARCHIVE_FILE} *`
`mv ${TMP_DIR}/${ARCHIVE_FILE} .`
echo "Packing $ARCHIVE_FILE"

# cleanup
`rm ${DUMP_FILE}`
