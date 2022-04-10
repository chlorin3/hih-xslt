<?xml version="1.0" encoding="ISO-8859-1"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
    <xsl:template match="/">
      <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
        <fo:layout-master-set>
          <fo:simple-page-master master-name="FirstPage"
                                 page-height="29.7cm" page-width="21cm"
                                 margin-top="0.5cm" margin-bottom="2cm"
                                 margin-left="2.5cm" margin-right="2.5cm">
            <fo:region-body margin-top="3cm" />
            <fo:region-before/>
          </fo:simple-page-master>
          
          <fo:simple-page-master master-name="Page"
                                 page-height="29.7cm" page-width="21cm"
                                 margin-top="0.5cm" margin-bottom="2cm"
                                 margin-left="2cm" margin-right="2cm">
            <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
            <fo:region-before/>
            <fo:region-after />
            
          </fo:simple-page-master>

          <fo:simple-page-master master-name="LastPage"
                                 page-height="29.7cm" page-width="21cm"
                                 margin-top="2cm" margin-bottom="2cm"
                                 margin-left="2.5cm" margin-right="2.5cm">
            <fo:region-body margin-top="2cm" />
          </fo:simple-page-master>
          
          <fo:page-sequence-master master-name="master-of-page-sequence">
            <fo:repeatable-page-master-alternatives>
              <fo:conditional-page-master-reference  master-reference="FirstPage" page-position="first"/>
              <fo:conditional-page-master-reference master-reference="Page" page-position="rest"/>
              <fo:conditional-page-master-reference master-reference="LastPage" page-position="last"/>
            </fo:repeatable-page-master-alternatives>
          </fo:page-sequence-master>

        </fo:layout-master-set>

        <fo:page-sequence master-reference="FirstPage">
          <fo:static-content flow-name="xsl-region-before">
            <fo:block  text-align="center" font-size="20pt">
              <xsl:apply-templates select="hobby/author"/>
            </fo:block>
          </fo:static-content>
          <fo:flow flow-name="xsl-region-body">
            <fo:block  text-align="center" font-size="50pt">
              <xsl:apply-templates select="hobby/title"/>
            </fo:block>
            <fo:block>
              <fo:external-graphic src="ukulele.jpg"/>
            </fo:block>
          </fo:flow>
        </fo:page-sequence>

        <fo:page-sequence master-reference="Page">
          
          <fo:static-content flow-name="xsl-region-before">
            <fo:block text-align="center" font-size="15pt">
              <xsl:apply-templates select="hobby/author"/>
            </fo:block>
          </fo:static-content>

          <fo:static-content flow-name="xsl-region-after">
            <fo:block text-align="right" font-size="10pt">
               <fo:page-number />
            </fo:block>
          </fo:static-content>

          <fo:flow flow-name="xsl-region-body">
            <fo:block text-align="justify" font-size="18pt">
              <xsl:apply-templates select="hobby/history"/>
            </fo:block>
          
            <fo:block font-size="18pt" break-before="page">
              <fo:inline font-weight="bold" font-style="italic">Easy</fo:inline> songs to play:
              <fo:block>
                <xsl:apply-templates select="hobby/musicians"/>
              </fo:block>
            </fo:block>
            <fo:block>
              <fo:block margin-top="2cm" font-size="18pt" color="brown">Popular ukulele brands: </fo:block>
              <fo:list-block>
                <fo:list-item  padding-top="10pt">
                  <fo:list-item-label>
                     <fo:block></fo:block>
                  </fo:list-item-label>
                  <fo:list-item-body>
                     <fo:block font-size="16pt">  <xsl:apply-templates select="hobby/ukuleles/brands/*"/></fo:block>
                  </fo:list-item-body>
                </fo:list-item>
                </fo:list-block>
            </fo:block>
            </fo:flow>
          </fo:page-sequence>

        <fo:page-sequence master-reference="LastPage">
          <fo:flow flow-name="xsl-region-body">
            <fo:block text-align="center" font-size="30pt" font-weight="bold">
              Koniec
            </fo:block>
            <fo:block><fo:external-graphic src="url(ukulele.jpg)"></fo:external-graphic></fo:block>
          </fo:flow>
        </fo:page-sequence>
      </fo:root>
    </xsl:template>
    
    <xsl:template match="brands/*">
      <fo:block><xsl:value-of select="text()"/></fo:block>
    </xsl:template>
      
    <xsl:template match="history">
      <fo:block>
        Text from the article:
        <fo:block font-size="16pt"><xsl:value-of select="text"/></fo:block>
      </fo:block>
      <fo:block text-align="right">
        <xsl:value-of select="author"/>
      </fo:block>
    </xsl:template>

    <xsl:template match="musicians">
      
      <fo:table margin-top="1cm" font-size="14pt" table-layout="fixed" border-width="1mm" border-style="solid">
        <fo:table-column column-width="8cm"/>
        <fo:table-column column-width="8cm"/>
  
        <fo:table-header text-align="center" background-color="silver">
          <fo:table-row>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
              <fo:block font-weight="bold">Artist</fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
              <fo:block font-weight="bold">Song</fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-header>

        <fo:table-body>
          <fo:table-row>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
              <fo:block>
                <xsl:apply-templates select="musician"/>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
              <fo:block>
                <xsl:apply-templates select="musician/song/title"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </xsl:template>

    <xsl:template match="musician">
      <fo:block><xsl:value-of select="@name"/></fo:block>
    </xsl:template>

    <xsl:template match="title">
      <fo:block><xsl:value-of select="text()"/></fo:block>
    </xsl:template>
   
  </xsl:stylesheet>