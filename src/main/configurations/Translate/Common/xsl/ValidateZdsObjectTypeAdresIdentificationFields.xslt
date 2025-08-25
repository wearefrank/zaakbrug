<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="ObjectTypeAdres" as="node()"><ObjectTypeAdres/></xsl:param>

    <xsl:template match="/">
        <IsObjectTypeAdresValidated>
            <xsl:choose>
                <xsl:when test="
                    string-length(normalize-space($ObjectTypeAdres//*:identificatie)) gt 0 and
                    string-length(normalize-space($ObjectTypeAdres//*:wpl.woonplaatsNaam)) gt 0 and
                    string-length(normalize-space($ObjectTypeAdres//*:gor.openbareRuimteNaam)) gt 0 and
                    string-length(normalize-space($ObjectTypeAdres//*:huisnummer)) gt 0">
                    true
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
        </IsObjectTypeAdresValidated>
    </xsl:template>
</xsl:stylesheet>