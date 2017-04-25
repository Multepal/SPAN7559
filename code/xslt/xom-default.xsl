<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
    <xsl:output method="html" />
    <xsl:variable name="themes_ajax_root">http://multepal.spanitalport.virgina.edu/api/temas/</xsl:variable>

    <xsl:template match="/">
        <xsl:apply-templates select="//tei:text//tei:body"/>
    </xsl:template>

    <xsl:template match="tei:div">
        <div>
            <xsl:attribute name="type">
                <xsl:value-of select="@type" />
            </xsl:attribute>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates />
        </p>
    </xsl:template>

    <xsl:template match="tei:note">
        <div type="note">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:rs">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="$themes_ajax_root" />
                <xsl:value-of select="@ana" />
                <xsl:text></xsl:text>
            </xsl:attribute>
            <xsl:apply-templates />
        </a>
    </xsl:template>

    <xsl:template match="tei:pc[@type='line-end-hyphen']">
        <!-- REMOVE -->
    </xsl:template>

    <xsl:template match="tei:lb">
        <!-- REMOVE -->
    </xsl:template>

</xsl:stylesheet>