<?xml version="1.0" encoding="UTF-8"?>
<!--This transformation creates an index of children sections, lessons, and units. It applies to the current node and lists any children up to the unit level. It gives links to their webpages.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:param name="fileprefix" />
  <xsl:template match="section|unit[1]"><!--Match current node-->
    <h1 class="title"><xsl:value-of select="title"/></h1>
    <div class="row">
      <div class="col-md-8">
        <xsl:for-each select="note">
          <p>
            <xsl:value-of select="."/><!--Display any notes about the lesson-->
          </p>
        </xsl:for-each>
      </div>
      <div class="col-md-4">&#160;
        <xsl:if test="/img">
          <xsl:variable name="imgurl"><xsl:value-of select="img"/></xsl:variable>
          <img class="img-responsive thumbnail" src="{$imgurl}" alt="Trees" style="max-width: 75%"></img>
        </xsl:if>
      </div>
    </div>
    <div class="row">
      <h3>Outline:</h3><!--Outline is just a list of child node titles and links to their pages-->
      <xsl:for-each select="unit"><!--Find all unit children-->
        <div class="col-md-3">
          <xsl:variable name="unadd">{{ site.baseurl }}/units/<xsl:value-of select="$fileprefix"/><xsl:value-of select="count(preceding-sibling::unit)+1"/>.html</xsl:variable><!--Create filename for unit child webpage-->
          <a href="{$unadd}"><h4><xsl:value-of select="*[1]"/></h4></a><!--List unit titles as links to their webpages-->
          <xsl:for-each select="lesson"><!--Find all lesson children-->
            <xsl:variable name="lessadd">{{ site.baseurl }}/lessons/<xsl:value-of select="$fileprefix"/><xsl:value-of select="count(../preceding-sibling::unit)+1"/>.<xsl:value-of select="count(preceding-sibling::lesson)+1"/>.html</xsl:variable><!--Create filename for lesson child webpage-->
            <a href="{$lessadd}"><h5><xsl:value-of select="*[1]"/></h5></a><!--List lesson titles as links to their webpages-->
          </xsl:for-each>
        </div>
      </xsl:for-each>
      <div class="col-md-3">
      <xsl:for-each select="lesson"><!--Find all lesson children-->
        
            <xsl:variable name="lessadd">{{ site.baseurl }}/lessons/<xsl:value-of select="$fileprefix"/><xsl:value-of select="count(preceding-sibling::lesson)+1"/>.html</xsl:variable><!--Create filename for lesson child webpage-->
            <a href="{$lessadd}"><h4><xsl:value-of select="*[1]"/></h4></a><!--List lesson titles as links to their webpages-->
      </xsl:for-each>
        </div>
    </div>
  </xsl:template>
</xsl:stylesheet>