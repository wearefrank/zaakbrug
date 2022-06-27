<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZgwZaak"/>
    <xsl:param name="Bas64Inhoud"/>
    <xsl:param name="ZgwInformatieObjectType"/>

    <xsl:template match="/">
        <ZdsZaakDocumentInhoud>
            <identificatie><xsl:value-of select="ZgwEnkelvoudigInformatieObject/identificatie"/></identificatie>
            <omschrijving><xsl:value-of select="$ZgwInformatieObjectType/ZgwInformatieObjectType/omschrijving"/></omschrijving>
            <creatiedatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/creatiedatum"/></creatiedatum>
            <xsl:choose>
                <xsl:when test="string-length(ZgwEnkelvoudigInformatieObject/ontvangstdatum) > 0 and normalize-space(ZgwEnkelvoudigInformatieObject/ontvangstdatum) != 'null'" >
                    <ontvangstdatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/ontvangstdatum"/></ontvangstdatum>
                </xsl:when>
                <xsl:otherwise>
                    <ontvangstdatum>00010101</ontvangstdatum>
                </xsl:otherwise>
            </xsl:choose>
            <titel><xsl:value-of select="ZgwEnkelvoudigInformatieObject/titel"/></titel>
            <xsl:choose>
                <xsl:when test="string-length(ZgwEnkelvoudigInformatieObject/beschrijving) > 0 and normalize-space(ZgwEnkelvoudigInformatieObject/beschrijving) != 'null'">
                    <beschrijving><xsl:value-of select="ZgwEnkelvoudigInformatieObject/beschrijving"/></beschrijving>
                </xsl:when>
                <xsl:otherwise>
                    <beschrijving><xsl:attribute name="xsi:nil">true</xsl:attribute></beschrijving>
                </xsl:otherwise>
            </xsl:choose>
            <!-- <formaat><xsl:value-of select="ZgwEnkelvoudigInformatieObject/formaat"/></formaat> -->
            <xsl:choose>
                <xsl:when test="string-length(ZgwEnkelvoudigInformatieObject/taal) > 0 and normalize-space(ZgwEnkelvoudigInformatieObject/taal) != 'null'">
                    <taal><xsl:value-of select="ZgwEnkelvoudigInformatieObject/taal"/></taal>
                </xsl:when>
                <xsl:otherwise>
                    <taal><xsl:attribute name="xsi:nil">true</xsl:attribute></taal>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(ZgwEnkelvoudigInformatieObject/versie) > 0 and normalize-space(ZgwEnkelvoudigInformatieObject/versie) != 'null'">
                    <versie><xsl:value-of select="ZgwEnkelvoudigInformatieObject/versie"/></versie>
                </xsl:when>
                <xsl:otherwise>
                    <versie><xsl:attribute name="xsi:nil">true</xsl:attribute></versie>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(ZgwEnkelvoudigInformatieObject/status) > 0 and normalize-space(ZgwEnkelvoudigInformatieObject/status) != 'null'">
                    <status><xsl:value-of select="ZgwEnkelvoudigInformatieObject/status"/></status>
                </xsl:when>
                <xsl:otherwise>
                    <status><xsl:attribute name="xsi:nil">true</xsl:attribute></status>
                </xsl:otherwise>
            </xsl:choose>
            <verzenddatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/verzenddatum"/></verzenddatum>
            <vertrouwelijkAanduiding><xsl:value-of select="ZgwEnkelvoudigInformatieObject/vertrouwelijkheidaanduiding"/></vertrouwelijkAanduiding>
            <auteur><xsl:value-of select="ZgwEnkelvoudigInformatieObject/auteur"/></auteur>
            <link><xsl:value-of select="ZgwEnkelvoudigInformatieObject/link"/></link>
            <inhoud>
                <xsl:value-of select="$Bas64Inhoud/Inhoud"/>
                <xsl:attribute name="StUF:bestandsnaam"><xsl:value-of select="ZgwEnkelvoudigInformatieObject/bestandsnaam"/></xsl:attribute>
                <!-- <xsl:attribute name="xmime:contentType"></xsl:attribute> -->
            </inhoud>
            <isRelevantVoor>
                <gerelateerde>
                    <identificatie><xsl:value-of select="$ZgwZaak/ZgwZaak/identificatie"/></identificatie>
                    <omschrijving><xsl:value-of select="$ZgwZaak/ZgwZaak/omschrijving"/></omschrijving>
                    <xsl:attribute name="entiteittype">ZAK</xsl:attribute>
                </gerelateerde>
            </isRelevantVoor>
        </ZdsZaakDocumentInhoud>
    </xsl:template>
</xsl:stylesheet>