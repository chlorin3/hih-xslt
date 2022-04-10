<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" />
  <xsl:template match="/">
    <xsl:element name="mojehobby">
      <xsl:attribute name="jakie">
          <xsl:apply-templates select="hobby/ukuleles"/>
      </xsl:attribute>
      <xsl:element name="rodzaje">
        <xsl:copy-of select="hobby/ukuleles/types/*"></xsl:copy-of>
      </xsl:element>
    <xsl:element name="informacje">
      <xsl:copy>
        <xsl:value-of select="hobby/history"/>
      </xsl:copy>
    </xsl:element>
    <xsl:element name="wykonawca">
      <xsl:element name="imie"><xsl:apply-templates select="hobby/author"/></xsl:element>
    </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="author">
    <xsl:value-of select="name"/>
  </xsl:template>
    
  <xsl:template match="types/*">
    <xsl:value-of select="name()"/>
  </xsl:template>
  
  <xsl:template match="ukuleles">
    <xsl:value-of select="name()"/>
  </xsl:template>
</xsl:stylesheet>