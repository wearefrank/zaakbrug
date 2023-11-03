<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZdsRolTypen" as="node()"><ZdsRolTypen/></xsl:param>
    <xsl:param name="TypeRolOmschrijving"/>
    <xsl:param name="ZdsBetrokkeneIdentificatie"/>

    <xsl:template match="/">
        <zdsRol>
            <!-- <betrokkene><xsl:value-of select=""/></betrokkene> -->
            <betrokkeneType><xsl:value-of select="$ZdsBetrokkeneIdentificatie/zdsRol/betrokkeneType"/></betrokkeneType>
            <xsl:for-each select="$ZdsRolTypen/ZdsRolTypen/ZdsRolType">
                <xsl:if test="omschrijving = $TypeRolOmschrijving">
                    <roltype><xsl:value-of select="url"/></roltype>
                </xsl:if>
            </xsl:for-each>
            <roltoelichting>
                <xsl:choose>
                    <xsl:when test="string-length($ZdsBetrokkeneIdentificatie/zdsRol/roltoelichting) > 0">
                        <xsl:value-of select="$ZdsBetrokkeneIdentificatie/zdsRol/roltoelichting"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat($TypeRolOmschrijving, ':')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </roltoelichting>
            <!-- <indicatieMachtiging><xsl:value-of select=""/></indicatieMachtiging> -->
            <xsl:copy-of select="$ZdsBetrokkeneIdentificatie/zdsRol/betrokkeneIdentificatie"/>
        </zdsRol>
    </xsl:template>
</xsl:stylesheet>