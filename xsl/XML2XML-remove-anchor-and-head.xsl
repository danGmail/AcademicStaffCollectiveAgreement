<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="http://exslt.org/common"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="tei ext xsl xs" version="2.0">
    <xsl:output doctype-public="-//TEI P5" encoding="utf-8" indent="yes" method="xml"
        xml:space="default"/>
    <xsl:strip-space elements="*"/>
    
    <!-- 
        
        This stylesheet removes all anchor tags and head tags (produced by Word)
        
        
        -->
    
<!-- Match all nodes -->

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

<!-- remove tei:anchor elements -->
<xsl:template match="tei:anchor"/>
    
    <!-- strip tei:head from text
    <xsl:template match="tei:head">
        <xsl:apply-templates/>
    </xsl:template> -->

</xsl:stylesheet>
