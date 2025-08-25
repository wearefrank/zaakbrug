<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <roles>
            <xsl:variable name="result">
                <xsl:apply-templates select="//*:heeftAlsBelanghebbende"/>
                <xsl:apply-templates select="//*:heeftAlsInitiator"/>
                <xsl:apply-templates select="//*:heeftAlsUitvoerende"/>
                <xsl:apply-templates select="//*:heeftAlsVerantwoordelijke"/>
                <xsl:apply-templates select="//*:heeftAlsGemachtigde"/>
                <xsl:apply-templates select="//*:heeftAlsOverigBetrokkene"/>
            </xsl:variable>
            <!-- Transfer any namespaces from children to 'roles' parent -->
            <xsl:copy-of select="$result//namespace-node()" />
            <xsl:copy-of select="$result" copy-namespaces="false" />
        </roles>
    </xsl:template>

    <xsl:template match="*:heeftAlsBelanghebbende | *:heeftAlsInitiator | *:heeftAlsUitvoerende | *:heeftAlsVerantwoordelijke | *:heeftAlsGemachtigde | *:heeftAlsOverigBetrokkene">
        <xsl:copy-of select="." />
    </xsl:template>
</xsl:stylesheet>