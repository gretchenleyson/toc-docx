<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:functx="http://my/functions"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:f="http://fxsl.sf.net/"
exclude-result-prefixes="xsd f"
xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"> 

<xsl:output omit-xml-declaration="yes" method="text" indent="no"/>
<xsl:template match="/">
    <xsl:for-each select="//w:pStyle[starts-with(@w:val,'Heading')]">

    		<xsl:variable name="headerPrefix">
    			<xsl:call-template name="loop">
				    <xsl:with-param name="headingNum"><xsl:value-of select="substring-after(@w:val,'Heading')" /></xsl:with-param>
				  </xsl:call-template>
    		</xsl:variable>

    		<xsl:if test="ancestor::w:p/w:r/w:t">
	        <xsl:for-each select="ancestor::w:p/w:r/w:t">
	          <xsl:value-of select="concat($headerPrefix, .)"/>
	        </xsl:for-each>
	        <xsl:text>&#xa;</xsl:text>
	    		</xsl:if>
    </xsl:for-each>
</xsl:template>

<xsl:template name="loop">
  <xsl:param name="headingNum"></xsl:param>
  <xsl:choose>
    <xsl:when test="$headingNum &gt; 0">
      <xsl:text>#</xsl:text>
      <xsl:call-template name="loop">
        <xsl:with-param name="headingNum">
        <xsl:number value="number($headingNum)-1" />
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
