<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">

  <xsl:output method="xhtml" indent="yes" encoding="UTF-8" />

  <xsl:template match='/'>
    <html>
      <head>
        <title>People grouped by the lengths of their last names</title>
      </head>
      <body>
        <xsl:for-each-group select='/people/person' group-by="string-length(name/last)">
          <xsl:sort select="current-grouping-key()" data-type="number" order="ascending"/>
          <h2>People with <xsl:value-of select="current-grouping-key()"/> letters in the last names</h2>
          <table>
            <xsl:for-each select="current-group()">
              <xsl:apply-templates select='.'/>
            </xsl:for-each>
          </table>
        </xsl:for-each-group>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match='person'>
    <xsl:variable name="background" select='if (gender="Male") then "#CCF" else "#FCC"'/>
    <tr style='background: {$background}'>
      <td>
        <xsl:value-of select="concat(name/first, ' ', name/last)"/>
      </td>
      <td><xsl:value-of select="email"/></td>
      <td><xsl:value-of select="ip-address"/></td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>

