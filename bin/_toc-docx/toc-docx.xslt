<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"> 

<xsl:variable name="whitespace" select="'&#09;&#10;&#13; '" />

<xsl:output omit-xml-declaration="yes" method="text" indent="no"/>
<xsl:template match="/">
    <xsl:for-each select="//w:pStyle[starts-with(@w:val,'Heading')]">

    		<xsl:variable name="headerPrefix">
    			<xsl:call-template name="loop">
				    <xsl:with-param name="headingNum"><xsl:value-of select="substring-after(@w:val,'Heading')" /></xsl:with-param>
				  </xsl:call-template>
    		</xsl:variable>

    		<xsl:variable name="headingText">
    			<xsl:call-template name="trim">
    				<xsl:with-param name="string"><xsl:value-of select="ancestor::w:p/w:r/w:t"></xsl:value-of></xsl:with-param>	
    			</xsl:call-template>
    		</xsl:variable>

    		<xsl:if test="$headingText != ''">
	        <xsl:for-each select="ancestor::w:p/w:r/w:t">
	          <xsl:value-of select="concat($headerPrefix, ' ', .)"/>
	        </xsl:for-each>
	        <xsl:text>&#xa;</xsl:text>
	    	</xsl:if>
    </xsl:for-each>
</xsl:template>

<!-- Print prefix (#) according to heading level -->
<xsl:template name="loop">
  <xsl:param name="headingNum"></xsl:param>
    <xsl:if test="$headingNum &gt; 0">
      <xsl:text>#</xsl:text>
      <xsl:call-template name="loop">
        <xsl:with-param name="headingNum">
        <xsl:number value="number($headingNum)-1" />
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
</xsl:template>

<!-- Remove trailing spaces -->
<xsl:template name="trim">
    <xsl:param name="string" />
    <xsl:param name="trim" select="$whitespace" />

    <xsl:variable name="length" select="string-length($string)" />
    <xsl:if test="$length &gt; 0">
        <xsl:choose>
            <xsl:when test="contains($trim, substring($string, $length, 1))">
                <xsl:call-template name="trim">
                    <xsl:with-param name="string" select="substring($string, 1, $length - 1)" />
                    <xsl:with-param name="trim"   select="$trim" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>
