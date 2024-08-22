<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZgwRolTypen" as="node()"><ZgwRolTypen/></xsl:param>
    <xsl:param name="TypeRolOmschrijving"/>
    <xsl:param name="ZgwBetrokkeneIdentificatie"/>

    <xsl:template match="/">
        <xsl:variable name="ZgwRolType" select="$ZgwRolTypen/ZgwRolTypen/ZgwRolType[omschrijving = $TypeRolOmschrijving]" />
        <zgwRol>
            <!-- <betrokkene><xsl:value-of select=""/></betrokkene> -->
            <betrokkeneType><xsl:value-of select="$ZgwBetrokkeneIdentificatie/zgwRol/betrokkeneType"/></betrokkeneType>
            <xsl:if test="string-length($ZgwRolType) gt 0">
                <roltype><xsl:value-of select="$ZgwRolType/url"/></roltype>
                <omschrijving><xsl:value-of select="$ZgwRolType/omschrijving"/></omschrijving>
                <omschrijvingGeneriek><xsl:value-of select="$ZgwRolType/omschrijvingGeneriek"/></omschrijvingGeneriek>
            </xsl:if>
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