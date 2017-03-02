<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    <xsl:output method="html" />
<xsl:template match="//*">
<pre>
    <xsl:apply-templates mode="html" select="//tei:text/tei:body"/>
</pre>
</xsl:template>
<!--
<xsl:template match="tei:p">
    <p><xsl:copy-of select ="."/></p>
</xsl:template>
-->
</xsl:stylesheet>