<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:param name="baseProfile" />

    <xsl:template match="/">
        <xsl:call-template name="processNode">
            <xsl:with-param name="node" select="/" />
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="processNode">
        <xsl:param name="node" />

        <xsl:for-each select="$node/*">
            <xsl:choose>
                <xsl:when test="$baseProfile//*[name() = name(current())]">
                    <xsl:choose>
                        <xsl:when test="count(child::*) = 0">
                            <xsl:copy>
                                <xsl:value-of select="text()" />
                            </xsl:copy>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:choose>
                                <xsl:when test="count(child::*) &gt; 0">
                                    <xsl:copy>
                                        <xsl:call-template name="processNode">
                                            <xsl:with-param name="node" select="." />
                                        </xsl:call-template>
                                    </xsl:copy>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:copy-of select="." />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="." />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        
        <xsl:for-each
            select="$baseProfile/profile//*">
            <xsl:choose>
                <xsl:when test="$node/name() = 'profile' and parent::*/name() = 'profile'">
                    <xsl:if test="name() = 'valueOverrides'">
                        <xsl:if test="not($node/valueOverrides[key[. = current()/key]])">
                            <xsl:copy-of select="." />
                        </xsl:if>
                    </xsl:if>     
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="parent::*/@path = $node/@path and not(name() = 'valueOverrides') and parent::*/name() != 'valueOverrides'">
                        <xsl:if test="not($node/*[@path = current()/@path])">
                            <xsl:copy-of select="." />
                        </xsl:if>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>