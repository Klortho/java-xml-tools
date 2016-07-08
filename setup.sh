# Figure out SAXON_HOME, which is the directory in which this script
# resides.  This resolves symlinks (HT Gerrit Imsieke). First check
# if greadlink exists (Mac OS X) and if so, use that.
#set -x

if hash greadlink 2>/dev/null; then
    READLINK=greadlink
else
    READLINK=readlink
fi
export JAVA_XML_HOME="$(cd -P "$(dirname $( $READLINK -f "${BASH_SOURCE[0]}" ))" && pwd)"

export SAXON_HOME=$JAVA_XML_HOME/saxonhe-9.7.0.6
export SAXON_JAR=$SAXON_HOME/saxon9he.jar
export CLASSPATH=$CLASSPATH:$SAXON_JAR

export COMMONS_RESOLVER_HOME=$JAVA_XML_HOME/xml-commons-resolver-1.2
export COMMONS_RESOLVER_JAR=$COMMONS_RESOLVER_HOME/resolver.jar
export CLASSPATH=$CLASSPATH:$COMMONS_RESOLVER_JAR

function xslt() {
  if [ "${XML_CATALOG_FILES}" ]; then
    catalog_opt="-catalog:${XML_CATALOG_FILES}"
  else 
    catalog_opt=
  fi

  java -cp $CLASSPATH net.sf.saxon.Transform $catalog_opt $*
}

