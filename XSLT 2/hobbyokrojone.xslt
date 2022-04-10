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
        <link rel="stylesheet" href="styleokrojone.css" />
      </head>
      <body>
        
        <header>
            <h1>
              Moje hobby
            </h1>
          </header>
        
        <div id="wrapper">
          <xsl:call-template name="table"/>
          <dt><p>Songs and release date:</p><xsl:apply-templates select="hobby/musicians/musician/song"/></dt>
        </div>
        
        <footer>
          <xsl:apply-templates select="hobby/author"/>
        </footer>
        
      </body>
    </html>
  </xsl:template>

  <xsl:template match="song">
    <dl>
      <xsl:value-of select="title"/>
      <xsl:text> - </xsl:text>
      <xsl:value-of select="released"/>
    </dl>
  </xsl:template>
  
  <xsl:template name="table">
    <table>
      <tr>
        <th>Type of ukulele</th>     
        <xsl:apply-templates select="hobby/ukuleles/types/*"/>
      </tr>
      <tr>
        <th>Photo</th>
        <xsl:apply-templates select="hobby/ukuleles/types/*/image"/>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="types/*">
    <td><xsl:value-of select="name()"/></td>  
  </xsl:template>

  <xsl:template match="image">
      <td><img>
      <xsl:attribute name="src">
        <xsl:value-of select="@source"/>
      </xsl:attribute>
    </img></td>
  </xsl:template>
  
</xsl:stylesheet>
