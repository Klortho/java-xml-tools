#!/bin/bash
#set -x
set -o errexit
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source the setup script
. $DIR/../setup.sh

# Test simple transform
xslt -o:$DIR/people.html $DIR/people.xml $DIR/people.xslt

# Can read a file with an external DTD
xslt -o:$DIR/needs-dtd.html $DIR/needs-dtd.xml $DIR/people.xslt

# Can read a file with an OASIS catalog
export XML_CATALOG_FILES=$DIR/catalog.xml
xslt -o:$DIR/needs-catalog.html $DIR/needs-catalog.xml $DIR/people.xslt

echo okay
