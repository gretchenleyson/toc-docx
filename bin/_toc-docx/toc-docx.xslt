<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"> 

<xsl:output omit-xml-declaration="yes" method="text" indent="no"/>
<xsl:template match="/">
    <xsl:for-each select="//w:pStyle[starts-with(@w:val,'Heading')]">
        <xsl:for-each select="ancestor::w:p/w:r/w:t">
          <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>&#xa;</xsl:text>
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>

