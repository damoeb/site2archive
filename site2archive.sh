#!/bin/sh
URL=$1
PORT='9900'
echo "URL ${URL}"
ESC_URL=$(echo "${URL}" | sed -e 's/[a-z:]*\/\///g' | sed -e 's/\//_/g')
DUMP_NAME="${ESC_URL}.html"
DUMP_FILE="files/${DUMP_NAME}"

# Render HTML+JS and dump the file
echo "Dumping to ${DUMP_FILE}"
phantomjs dump.js ${URL} > "${DUMP_FILE}"

# wget to tmp dir
TMP_DIR=`mktemp -d -t`

# wget will download all resources and rewrite pathes
`wget -E -H -k -K -p --no-directories -P $TMP_DIR localhost:${PORT}/${DUMP_NAME}`

echo "Dumped to $TMP_DIR"

# rename to index.html
`mv $TMP_DIR/${DUMP_NAME} $TMP_DIR/index.html`

# create archive
ARCHIVE_FILE="${ESC_URL}-archive.tar.gz"
TAR=`cd ${TMP_DIR} && tar -cvzf ${ARCHIVE_FILE} *`
`mv ${TMP_DIR}/${ARCHIVE_FILE} .`
echo "Created webarchive $ARCHIVE_FILE"

# cleanup
`rm ${DUMP_FILE}`
