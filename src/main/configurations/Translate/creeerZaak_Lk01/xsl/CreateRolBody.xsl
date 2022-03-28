<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="GetRolTypeResult"/>
    <xsl:param name="TypeRolOmschrijving"/>
    <xsl:param name="ZgwBetrokkeneIdentificatie"/>

    <xsl:template match="/">
        <zgwRol>
            <!-- <betrokkene><xsl:value-of select=""/></betrokkene> -->
            <betrokkeneType><xsl:value-of select="$ZgwBetrokkeneIdentificatie/zgwRol/betrokkeneType"/></betrokkeneType>
            <xsl:for-each select="$GetRolTypeResult/root/results">
                <xsl:if test="omschrijving = $TypeRolOmschrijving">
                    <roltype><xsl:value-of select="url"/></roltype>
                </xsl:if>
            </xsl:for-each>
            <roltoelichting>
                <xsl:choose>
                    <xsl:when test="string-length($ZgwBetrokkeneIdentificatie/zgwRol/roltoelichting) > 0">
                        <xsl:value-of select="$ZgwBetrokkeneIdentificatie/zgwRol/roltoelichting"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat($TypeRolOmschrijving, ':')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </roltoelichting>
            <!-- <indicatieMachtiging><xsl:value-of select=""/></indicatieMachtiging> -->
            <xsl:copy-of select="$ZgwBetrokkeneIdentificatie/zgwRol/betrokkeneIdentificatie"/>
        </zgwRol>
    </xsl:template>
</xsl:stylesheet>