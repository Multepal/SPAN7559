<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2003/XInclude"
    exclude-result-prefixes="tei">
    <xsl:output
        method="html"
        omit-xml-declaration="yes"
        encoding="UTF-8"
        indent="yes" 
    />
    <xsl:variable name="themes_ajax_root">http://multepal.spanitalport.virgina.edu/api/temas/</xsl:variable>

    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;
        </xsl:text>
        <html>
            <head>
                <title>Popol Vuh, Multepal Edition</title>
                <link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css" />
                <link rel="stylesheet" type="text/css" href="default.css" />
                <script
                    src="https://code.jquery.com/jquery-3.2.1.min.js"
                    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
                    crossorigin="anonymous">
                </script>
                <script src="default.js" type="text/javascript"></script>
            </head>
            <body>
            <xsl:apply-templates select="//tei:text//tei:body"/>
            <xsl:variable name="file" select="topics.xml" />
            <div class="topics">
            <xsl:variable name="file" select="./topics.xml" />
            <xsl:copy-of select="document($file)/*" />
            <xi:include href="topics.xml" />
            </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:div[@xml:lang='quc']">
        <div class="quc" xml:lang="quc">
            <b>K'iche'</b>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:div[@xml:lang='spa']">
        <div class="spa" xml:lan="spa">
            <b>Espanol</b>
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:variable name="pnum">
            <xsl:number count="*" format="1" />        
        </xsl:variable>
        <p>
            <xsl:attribute name="data-num">
                <xsl:value-of select="$pnum" />
            </xsl:attribute>
            <span class="pnum">¶ <xsl:value-of select="$pnum" /></span>
            <xsl:apply-templates />
        </p>
    </xsl:template>

    <xsl:template match="tei:pb">
        <span class="pb">
            <xsl:value-of select="@xml:id" />
        </span>
    </xsl:template>
    <xsl:template match="tei:note">
        <!--
        <span class="note">
            <xsl:apply-templates />
        </span>
        -->
    </xsl:template>

    <xsl:template match="tei:rs">
        <span class="rs">
            <xsl:attribute name="data-ana">
                <xsl:value-of select="@ana" />
            </xsl:attribute>
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:corr">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="tei:pc[@type='line-end-hyphen']">
        <!-- REMOVE -->
    </xsl:template>

    <xsl:template match="tei:lb">
        <!-- REMOVE -->
    </xsl:template>

</xsl:stylesheet>