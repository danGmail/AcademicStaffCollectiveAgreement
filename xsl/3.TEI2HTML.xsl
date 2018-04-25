<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="http://exslt.org/common"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:htm="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei htm ext" version="2.0">
    <xsl:output encoding="utf-8" indent="yes" method="html" xml:space="default"/>
    <xsl:strip-space elements="*"/>

    <!-- Document metadata -->

    <xsl:template name="docTitle" match="//tei:titleStmt/tei:title">
        <xsl:value-of select="//tei:title"/>
    </xsl:template>

    <xsl:template name="attID">
        <xsl:attribute name="id">
            <xsl:value-of select="@xml:id"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template name="targetFactory">
        <xsl:choose>
            <xsl:when test="../@xml:id">
                <xsl:value-of select="../@xml:id"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="generate-id(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:variable name="newline">
        <xsl:text>
  </xsl:text>
    </xsl:variable>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns:htm="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </html>
    </xsl:template>

    <xsl:template match="tei:list/tei:item/tei:hi" mode="toc-short">
        <xsl:for-each select=".">
            <li>
                <a>
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text>
                        <xsl:call-template name="targetFactory"/>
                    </xsl:attribute>
                    <xsl:value-of select="../@n"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="."/>
                </a>
                <xsl:value-of select="$newline"/><xsl:text> (</xsl:text>
                <a><xsl:attribute name="href">
                    <xsl:text>#detailed-</xsl:text>
                    <xsl:call-template name="targetFactory"/>
                </xsl:attribute>more</a><xsl:text>)</xsl:text>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:list/tei:item/tei:hi" mode="toc-long">
        <xsl:for-each select=".">
            <li class="list-group-item" title="Click to expand">
                <a>
                    <xsl:attribute name="id">
                        <xsl:text>detailed-</xsl:text>
                        <xsl:call-template name="targetFactory"/>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text>
                        <xsl:call-template name="targetFactory"/>
                    </xsl:attribute>
                    <xsl:value-of select="../@n"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="."/>
                </a>
                <xsl:value-of select="$newline"/>
                <xsl:if test="following-sibling::tei:list/tei:item/tei:hi">
                    <ul class="collapse toc">
                        <xsl:value-of select="$newline"/>
                        <xsl:for-each select="following-sibling::tei:list/tei:item/tei:hi">
                            <li class="list-group-item">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:text>#</xsl:text>
                                        <xsl:call-template name="targetFactory"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="../@n"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="."/>
                                </a>
                                <xsl:value-of select="$newline"/>
                                <xsl:if test="following-sibling::tei:list/tei:item/tei:hi">
                                    <ul class="collapse toc">
                                        <xsl:value-of select="$newline"/>
                                        <xsl:for-each
                                            select="following-sibling::tei:list/tei:item/tei:hi">
                                            <li class="list-group-item">
                                                <a>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>#</xsl:text>
                                                  <xsl:call-template name="targetFactory"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="../@n"/>
                                                  <xsl:text> </xsl:text>
                                                  <xsl:value-of select="."/>
                                                </a>
                                                <xsl:value-of select="$newline"/>
                                                <xsl:if
                                                  test="following-sibling::tei:list/tei:item/tei:hi">
                                                  <ul class="collapse toc">
                                                  <xsl:value-of select="$newline"/>
                                                  <xsl:for-each
                                                  select="following-sibling::tei:list/tei:item/tei:hi">
                                                  <li class="list-group-item">
                                                  <a>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>#</xsl:text>
                                                  <xsl:call-template name="targetFactory"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="../@n"/>
                                                  <xsl:text> </xsl:text>
                                                  <xsl:value-of select="."/>
                                                  </a>
                                                  <xsl:value-of select="$newline"/>
                                                  <xsl:if
                                                  test="following-sibling::tei:list/tei:item/tei:hi">
                                                  <ul class="collapse toc">
                                                  <xsl:value-of select="$newline"/>
                                                  <xsl:for-each
                                                  select="following-sibling::tei:list/tei:item/tei:hi">
                                                  <li class="list-group-item">
                                                  <a>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>#</xsl:text>
                                                  <xsl:call-template name="targetFactory"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="../@n"/>
                                                  <xsl:text> </xsl:text>
                                                  <xsl:value-of select="."/>
                                                  </a>
                                                  </li>
                                                  <xsl:value-of select="$newline"/>
                                                  </xsl:for-each>
                                                  </ul>
                                                  </xsl:if>
                                                  </li>
                                                  </xsl:for-each>
                                                  </ul>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:if>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:hi">
        <span>
            <!-- this attribute is an alternative to the choose below. If you use the choose, remove this -->
            <xsl:attribute name="class">head</xsl:attribute>
            <!-- 
            <xsl:choose>
                <xsl:when test="./parent::tei:item/parent::tei:list/parent::tei:body">
                    <xsl:attribute name="class">head</xsl:attribute>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>-->
            <xsl:attribute name="id">
                <xsl:call-template name="targetFactory"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:item">
        <xsl:choose>
            <xsl:when test="parent::tei:list/parent::tei:body">
                <hr/>
                <h2>
                    <a>
                        <xsl:attribute name="href">#<xsl:value-of select="@xml:id"/></xsl:attribute>
                        <xsl:attribute name="title">Click to get link to this item (ID =
                                #<xsl:value-of select="@xml:id"/>)</xsl:attribute>
                        <xsl:call-template name="attID"/>
                        <xsl:choose>
                            <xsl:when test="@ana = 'prologue'">Prologue</xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="@ana = 'schedule'">Schedule <xsl:value-of
                                            select="@n"/></xsl:when>
                                    <xsl:otherwise>Article <xsl:value-of select="@n"
                                        /></xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="child::tei:hi">: <xsl:value-of select="child::tei:hi"
                            /></xsl:if>
                    </a>
                </h2>
                <xsl:choose>
                    <xsl:when test="child = tei:hi">
                        <xsl:apply-templates select="tei:hi" mode="hide"/>
                        <xsl:choose>
                            <xsl:when test="child[2] = tei:list">
                                <xsl:apply-templates select="tei:list"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="child[2] = tei:p">
                                        <xsl:apply-templates select="tei:p"/>
                                        <xsl:if test="child[3] = tei:list">
                                            <xsl:apply-templates select="tei:list"/>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="tei:p|tei:list"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <li>
                    <xsl:call-template name="attID"/>
                    <a>
                        <xsl:attribute name="href">#<xsl:value-of select="@xml:id"/></xsl:attribute>
                        <xsl:attribute name="title">Click to get link to this item (ID =
                                #<xsl:value-of select="@xml:id"/>)</xsl:attribute>
                        <xsl:value-of select="@n"/>
                    </a>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates/>
                </li>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:ref">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
        <xsl:text> </xsl:text>
    </xsl:template>

    <!-- suppress tei elements -->
    <xsl:template match="tei:TEI">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:body">
        <h1>
            <xsl:call-template name="docTitle"/>
        </h1>
        <h2>Table of Contents</h2>
        <ul class="toc">
            <li>
                <a href="#summary">Summary Contents</a>
            </li>
            <li>
                <a href="#detailed">Detailed Contents</a>
            </li>
            <li>
                <a href="#body">
                    <xsl:call-template name="docTitle"/>
                </a>
            </li>
        </ul>
        <h3 id="summary">Summary Contents</h3>
        <ul class="toc">
            <xsl:apply-templates mode="toc-short" select="tei:list/tei:item/tei:hi"/>
        </ul>
        <h3 id="detailed">Detailed Contents</h3>
        <ul class="toc">
            <xsl:apply-templates mode="toc-long" select="tei:list/tei:item/tei:hi"/>
        </ul>
        <hr/>
        <a id="body"/>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="tei:cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>


    <xsl:template match="tei:list">
        <xsl:choose>
            <xsl:when test="attribute::type = 'unordered'">
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <ol>
                    <xsl:apply-templates/>
                </ol>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:p[rend = 'head']">
        <span class="heading">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:p">
        <!-- <span class="paragraph"> -->
        <p>
            <xsl:apply-templates/>
        </p>
        <!-- </span> -->
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>

    <xsl:template match="tei:head">
        <p>
            <b>
                <xsl:apply-templates/>
            </b>
        </p>
    </xsl:template>

    <xsl:template match="tei:teiHeader">
        <head>
            <title>
                <xsl:call-template name="docTitle"/>
            </title>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <!-- <link rel="stylesheet"
                href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> -->
            <style type="text/css" media="screen" title="Default">
                @import 
                url(../css/core.css);</style>
        </head>
    </xsl:template>

    <xsl:template match="tei:text">
        <body>
            <div>
                <xsl:apply-templates select="tei:body"/>
            </div>
        </body>
    </xsl:template>


</xsl:stylesheet>
