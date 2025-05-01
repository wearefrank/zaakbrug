<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:mode on-no-match="shallow-skip" />

    <xsl:template match="//*:object[@*:entiteittype='ZAK']">
        <xsl:copy select=".">
            <xsl:copy-of select="@*" />
            <xsl:variable name="result">
                <xsl:copy-of select="*[
                    not(self::*:isVan) and
                    not(self::*:heeftBetrekkingOp) and
                    not(self::*:heeftAlsBelanghebbende) and
                    not(self::*:heeftAlsGemachtigde) and
                    not(self::*:heeftAlsInitiator) and
                    not(self::*:heeftAlsUitvoerende) and
                    not(self::*:heeftAlsVerantwoordelijke) and
                    not(self::*:heeftAlsOverigBetrokkene) and
                    not(self::*:heeftAlsDeelzaak) and
                    not(self::*:heeftAlsHoofdzaak) and
                    not(self::*:heeftBetrekkingOpAndere) and
                    not(self::*:heeft) and
                    not(self::*:leidtTot)
                    ]"/>
            </xsl:variable>
            <!-- Transfer any namespaces from children to parent -->
            <xsl:copy-of select="$result//namespace-node()" />
            <xsl:copy-of select="$result" copy-namespaces="false" />
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>