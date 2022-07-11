<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZgwZaakInformatieObject"/>
    <xsl:param name="ZgwInformatieObjectType"/>

    <xsl:template match="/">
        <heeftRelevant>
            <gerelateerde>
                <identificatie><xsl:value-of select="ZgwEnkelvoudigInformatieObject/identificatie"/></identificatie>
                <omschrijving><xsl:value-of select="$ZgwInformatieObjectType/ZgwInformatieObjectType/omschrijving"/></omschrijving>
                <creatiedatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/creatiedatum"/></creatiedatum>
                <ontvangstdatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/ontvangstdatum"/></ontvangstdatum>
                <titel><xsl:value-of select="ZgwEnkelvoudigInformatieObject/titel"/></titel>
                <beschrijving><xsl:value-of select="ZgwEnkelvoudigInformatieObject/beschrijving"/></beschrijving>
                <formaat><xsl:value-of select="ZgwEnkelvoudigInformatieObject/formaat"/></formaat>
                <taal><xsl:value-of select="ZgwEnkelvoudigInformatieObject/taal"/></taal>
                <versie><xsl:value-of select="ZgwEnkelvoudigInformatieObject/versie"/></versie>
                <status><xsl:value-of select="ZgwEnkelvoudigInformatieObject/status"/></status>
                <verzenddatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/verzenddatum"/></verzenddatum>
                <vertrouwelijkAanduiding><xsl:value-of select="ZgwEnkelvoudigInformatieObject/vertrouwelijkheidaanduiding"/></vertrouwelijkAanduiding>
                <auteur><xsl:value-of select="ZgwEnkelvoudigInformatieObject/auteur"/></auteur>
                <link><xsl:value-of select="ZgwEnkelvoudigInformatieObject/link"/></link>
            </gerelateerde>
            <titel><xsl:value-of select="$ZgwZaakInformatieObject/ZgwZaakInformatieObject/titel"/></titel>
            <beschrijving><xsl:value-of select="$ZgwZaakInformatieObject/ZgwZaakInformatieObject/beschrijving"/></beschrijving>
            <registratiedatum><xsl:value-of select="$ZgwZaakInformatieObject/ZgwZaakInformatieObject/registratiedatum"/></registratiedatum>
        </heeftRelevant>
    </xsl:template>
</xsl:stylesheet>