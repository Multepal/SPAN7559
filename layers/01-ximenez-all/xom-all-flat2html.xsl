<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
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
            <style type="text/css">
            div.page {
                margin-left:1in;
            }

            div.col {
                float: left;
                padding: 1rem;
                line-height:14.2pt;
            }

            div.quc {
                width: 4.5in;
            }

            div.spa {
                width: 6in;
            }

            .note {
                float:right;
                color:gray;
            }
            .rs {
                color:red;
                font-weight:bold;
            }
            </style>
            </head>
            <body>
            <div class="col quc">
                <xsl:apply-templates select="//tei:text//tei:body//tei:div[@type='col'][@xml:lang='quc']" />
            </div>
            <div class="col spa">
                <xsl:apply-templates select="//tei:text//tei:body//tei:div[@type='col'][@xml:lang='spa']" />
            </div>
            </body>
        </html>
    </xsl:template>

    <!--
    <xsl:template match="tei:div[@type='page']">
        <div class="page">
            <xsl:attribute name="id" select="@xml:id" />
        </div>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="tei:div[@type='col'][@xml:lang='quc']">
        <div class="col col-A" xml:lang="quc"></div>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="tei:div[@type='col'][@xml:lang='spa']">
        <div class="col col-B" xml:lan="spa">
            <b>Espanol</b>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    -->

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates />
        </p>
    </xsl:template>

    <xsl:template match="tei:note">
        <span class="note">
            <xsl:apply-templates />
        </span>
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

    <xsl:template match="tei:hi">
        <em><xsl:apply-templates /></em>
    </xsl:template>

</xsl:stylesheet>