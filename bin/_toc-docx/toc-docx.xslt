<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"> 

<xsl:template match="/">
  <html>
  <body>
  <table border="1">
    <tr>
	  <th>Format</th>
	  <th>Content</th>
    </tr>
    <xsl:for-each select="//w:pStyle[starts-with(@w:val,'Heading')]">
    <tr>
      <td><xsl:value-of select="@w:val"/></td>
      <td>
        <xsl:for-each select="ancestor::w:p/w:r/w:t">
          <xsl:value-of select="."/>
        </xsl:for-each>
      </td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>