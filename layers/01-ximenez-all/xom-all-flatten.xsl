<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    <xsl:output
        method="xml"
        omit-xml-declaration="no"
        encoding="UTF-8"
        indent="yes" 
    />
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude">
            <xsl:copy-of select="//tei:teiHeader" />
            <text xml:id="MS1515v2" n="1515.2">
                <body>
                    <div xml:lang="quc">
                        <xsl:apply-templates select="//tei:text//tei:body/tei:div/tei:div[@type='col'][@xml:lang='quc']" />
                    </div>
                    <div xml:lang="spa">
                        <xsl:apply-templates select="//tei:text//tei:body/tei:div/tei:div[@type='col'][@xml:lang='spa']" />
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>

    <xsl:template match="tei:div[@type='page']">
        <pb>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@xml:id" />
            </xsl:attribute>
        </pb>
    </xsl:template>

    <xsl:template match="tei:div[@type='col'][@xml:lang='quc']">
        <xsl:apply-templates select="parent::tei:div[@type='page']" />
        <xsl:copy-of select="*" />
    </xsl:template>

    <xsl:template match="tei:div[@type='col'][@xml:lang='spa']">
        <xsl:apply-templates select="parent::tei:div[@type='page']" />
        <xsl:copy-of select="*" />
    </xsl:template>

</xsl:stylesheet>