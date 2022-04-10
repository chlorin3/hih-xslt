<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Moje hobby</title>
        <link rel="stylesheet" href="style.css" />
      </head>
      <body>
        <div id="wrapper">
          
            <header>
            <h1 class="logo">
              Moje hobby<xsl:apply-templates select="hobby/images/image"/>
            </h1>
          </header>
          
          <h3>Very Brief History Of The Ukulele</h3>
            <xsl:apply-templates select="//text"/>
          
          <xsl:call-template name="table"/>
          
          <h3>Links</h3>
            <xsl:apply-templates select="hobby/musicians"/>
          
          <h3>Popular brands</h3>
            <xsl:apply-templates select="hobby/ukuleles/brands"/>

          <h3>Prices</h3>
          <xsl:apply-templates select="hobby/ukuleles/types/*/price"/>
        
          <footer><xsl:apply-templates select="hobby/author"/></footer>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="price">
    <xsl:variable name="value" select="text()" />
    <ul> 
      <xsl:if test="@currency = 'EUR'">
      <li>
        <xsl:value-of select ="name(..)"/>
        <xsl:text> - </xsl:text>
        <xsl:choose>
          <xsl:when test="$value &gt; 50">
            <xsl:value-of select='format-number(number($value), "#.000")'/>
           </xsl:when>
           <xsl:otherwise>
             <xsl:value-of select='format-number(number($value), "#.00")'/>
          </xsl:otherwise>
         </xsl:choose>
        <xsl:text>  </xsl:text>
        <xsl:value-of select="@currency"/>
      </li>
      </xsl:if>
    </ul> 
  </xsl:template>
  
  <xsl:template match="author">
    <xsl:value-of select="name"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="surname"/>
  </xsl:template>
  
  <xsl:template match ="text">
    <xsl:value-of select="text()"/>
  </xsl:template>
  
  <xsl:template match="musicians">
      <dl>
        <xsl:for-each select="musician/*/live">
          <dt>
            <xsl:number value="position()" format="I "/>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="@source"/>
              </xsl:attribute>
              <xsl:value-of select="text()"/>
            </a>
          </dt>
        </xsl:for-each>
      </dl>
  </xsl:template>
  
  <xsl:template match="brands">
    <li><xsl:apply-templates select="brand[position()&lt;6]"/></li>
  </xsl:template>
  
  <xsl:template match="brand">
    <ul><xsl:value-of select="text()"/></ul>
  </xsl:template>
    
  <xsl:template match="image">
    <img>
      <xsl:attribute name="src"><xsl:value-of select="@source"/></xsl:attribute>
				<xsl:attribute name="class">
					<xsl:choose>
					  <xsl:when test="contains(@source, 'logo2')">
					    right
					  </xsl:when>
					  <xsl:otherwise>
					    left
					  </xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</img>
  </xsl:template>
  
  <xsl:template name="table">
    <table border="1">
        <tr bgcolor="#9acd32">
          <th></th>
          <th>Artist</th>
          <th>Title</th>
        </tr>
        <xsl:for-each select="hobby/musicians/musician[@lang = 'english']">
          <xsl:sort select="@name" order="ascending"/>
        <tr>
          <td><xsl:number value="position()" format="1. "/></td>
          <td><xsl:value-of select="@name"/></td> 
          <td><xsl:value-of select="song/title"/></td>
        </tr>
        </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>
