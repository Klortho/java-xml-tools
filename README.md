# Java XML tools

This repository allows you to set up some command-line tools for 
using XSLT 2.0, quickly and easily.

It includes:

* Saxon HE 9.7.0.6, downloaded from
  [here](https://sourceforge.net/projects/saxon/files/Saxon-HE/9.7/) on
  7/8/2016
* Apache Commons XML Resolver 1.2, downloaded from 
  [here](http://xerces.apache.org/mirrors.cgi) (click "Browse Download Area"
  under "XML Commons") on 7/8/2016. This library lets Saxon use
  OASIS catalog files for resolving public and system identifiers.


# Set up

To use this, just clone or unzip this repo into a stable location, and source
the setup.sh script from one of your login scripts. For example:

```
mkdir -p ~/bin
cd bin
git clone https://github.com/Klortho/java-xml-tools.git
```

Then add this to your ~/.bashrc:

```
. ~/bin/java-xml-tools/setup.sh
```

This makes the `xslt` command available on your command line.


# Usage

See the Saxonica page, [Running XSLT from the Command 
Line](http://www.saxonica.com/html/documentation/using-xsl/commandline.html),
for detailed information. For running XSLT, the most common usage is:

```
xslt -o:output [other options] input.xml stylesheet.xsl [param=value ...]
```

Here are a few examples (you can try these out in the test/ directory):

```
xslt -o:people.html people.xml people.xslt
```

Run a transformation on a file that uses an OASIS catalog:

```
export XML_CATALOG_FILES=/path/to/catalog.xml
xslt -o:needs-catalog.html needs-catalog.xml people.xslt
```


