<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://example.com/my-namespace" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:param name="role" as="node()?"/>
    <xsl:param name="roles" as="node()?"/>

    <xsl:template match="/role">
        <Check>
            <xsl:for-each select="$roles/roles/role">
                <xsl:choose>
                    <xsl:when test="my:compareRoles($role/role, .)">
                        <true/>
                    </xsl:when>
                    <xsl:otherwise>
                        <false/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </Check>
    </xsl:template>

    <!-- Function to compare roles -->
    <xsl:function name="my:compareRoles" as="xs:boolean">
        <xsl:param name="input" as="node()?"/>
        <xsl:param name="check" as="node()?"/>
        

        <xsl:variable name="flag">
            <xsl:choose>
                <xsl:when test="count($input/*)">
                    <xsl:for-each select="$input/*">
                        <xsl:variable name="currentName" select="local-name()"/>
                        <xsl:variable name="correspondingElement" select="$check/*[local-name() = $currentName]"/>
                        <xsl:choose>
                        <xsl:when test="$currentName = 'authentiek'"/> <!--Do not compare 'Authentiek' field-->
                        <xsl:when test="not($correspondingElement)">
                            <xsl:if test="not(@nil = 'true' or @noValue = 'geenWaarde' or . = '')">
                                <xsl:copy-of select="false()"/>
                            </xsl:if>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="not(my:compareRoles(., $correspondingElement))">  
                                <xsl:copy-of select="false()"/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    </xsl:for-each>
                    <xsl:if test="not(local-name($input) = local-name($check))">
                        <xsl:copy-of select="false()"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="not(local-name($input) = local-name($check)) or not(string($input) = string($check))">
                        <xsl:copy-of select="false()"></xsl:copy-of>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:copy-of select="not(contains($flag, 'false'))"></xsl:copy-of>
    </xsl:function>



</xsl:stylesheet>
