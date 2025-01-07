<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://www.wearefrank.nl/zgw" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    
    <xsl:function name="zgw:toZgwDatetime" as="xs:dateTime">
        <xsl:param name="dateTimeStr" as="xs:string"/>
        <xsl:variable name="withoutZulu" select="xs:dateTime(concat(substring($dateTimeStr,1,4), '-', substring($dateTimeStr,5,2), '-', substring($dateTimeStr,7,2), 'T', substring($dateTimeStr,9,2), ':', substring($dateTimeStr,11,2), ':', substring($dateTimeStr,13,2)))" />
        <xsl:variable name="withZulu" select="xs:dateTime(concat($withoutZulu, 'Z'))" />
        <xsl:variable name="timezoneOffset" select="format-dateTime($withZulu, '[Z]', (), (), environment-variable('zaakbrug.zds.timezone'))" />
        <xsl:value-of select="concat($withoutZulu, $timezoneOffset)"/>
    </xsl:function>

    <xsl:function name="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie" as="xs:string">
    	<xsl:param name="zgwArchiefNominatie" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="upper-case($zgwArchiefNominatie)='J'">vernietigen</xsl:when>
      		<xsl:otherwise>blijvend_bewaren</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>

    <xsl:function name="zgw:convertZdsBetalingsIndicatieToZgwBetalingsIndicatie">
        <xsl:param name="zdsBetalingsIndicatie" />
        <xsl:choose>
            <xsl:when test="$zdsBetalingsIndicatie='N.v.t.'">nvt</xsl:when>
            <xsl:when test="$zdsBetalingsIndicatie='(Nog) niet'">nog_niet</xsl:when>
            <xsl:when test="$zdsBetalingsIndicatie='Gedeeltelijk'">gedeeltelijk</xsl:when>
            <xsl:when test="$zdsBetalingsIndicatie='Geheel'">geheel</xsl:when>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="zgw:convertZdsRechtsvormToZgwRechtsvorm">
    	<xsl:param name="zdsRechtsvorm" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'besloten vennootschap')">
                <xsl:value-of select="'besloten_vennootschap'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'economische')">
                <xsl:value-of select="'cooperatie_europees_economische_samenwerking'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'cooperatieve')">
                <xsl:value-of select="'europese_cooperatieve_venootschap'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'europese')">
                <xsl:value-of select="'europese_naamloze_vennootschap'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'kerkelijke')">
                <xsl:value-of select="'kerkelijke_organisatie'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'naamloze vennootschap')">
                <xsl:value-of select="'naamloze_vennootschap'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'waarborg')">
                <xsl:value-of select="'onderlinge_waarborg_maatschappij'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'privaatrechtelijke')">
                <xsl:value-of select="'overig_privaatrechtelijke_rechtspersoon'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'stichting')">
                <xsl:value-of select="'stichting'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'vereniging')">
                <xsl:value-of select="'vereniging'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'eigenaars')">
                <xsl:value-of select="'vereniging_van_eigenaars'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'publiekrechtelijke')">
                <xsl:value-of select="'publiekrechtelijke_rechtspersoon'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'firma')">
                <xsl:value-of select="'vennootschap_onder_firma'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'maatschap')">
                <xsl:value-of select="'maatschap'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'rederij')">
                <xsl:value-of select="'rederij'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'commanditaire')">
                <xsl:value-of select="'commanditaire_vennootschap'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'binnen')">
                <xsl:value-of select="'kapitaalvennootschap_binnen_eer'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'buitenlandse')">
                <xsl:value-of select="'overige_buitenlandse_rechtspersoon_vennootschap'"/>
            </xsl:when>
            <xsl:when test="contains(lower-case($zdsRechtsvorm), 'buiten')">
                <xsl:value-of select="'kapitaalvennootschap_buiten_eer'"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'overig_privaatrechtelijke_rechtspersoon'"/>
            </xsl:otherwise>
        </xsl:choose>
	</xsl:function>

    <xsl:function name="zgw:createDefaultBetalingsindicatieWeergave">
    	<xsl:param name="zgwBetalingsindicatie" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="lower-case($zgwBetalingsindicatie)='nvt'">Er is geen sprake van te betalen, met de zaak gemoeide, kosten.</xsl:when>
            <xsl:when test="lower-case($zgwBetalingsindicatie)='nog_niet'">De met de zaak gemoeide kosten zijn (nog) niet betaald.</xsl:when>
            <xsl:when test="lower-case($zgwBetalingsindicatie)='gedeeltelijk'">De met de zaak gemoeide kosten zijn gedeeltelijk betaald.</xsl:when>
            <xsl:when test="lower-case($zgwBetalingsindicatie)='geheel'">De met de zaak gemoeide kosten zijn geheel betaald.</xsl:when>
            <xsl:otherwise />
        </xsl:choose>
	</xsl:function>

    <xsl:function name="zgw:toZgwDate">
        <xsl:param name="dateStr"/>
        <xsl:if test="string-length($dateStr) > 0">
            <xsl:value-of select="concat(substring($dateStr,1,4), '-', substring($dateStr,5,2), '-', substring($dateStr,7,2))"/>
        </xsl:if>
    </xsl:function>

    <xsl:function name="zgw:toZgwDocumentStatus">
        <xsl:param name="status"/>
        <xsl:if test="string-length($status) > 0">
            <xsl:variable name="transformed" as="xs:string" select="lower-case(replace($status, ' ', '_'))"/>    
            <xsl:choose>
                <xsl:when test="$transformed = 'in_bewerking' or $transformed = 'ter_vaststelling' or $transformed = 'definitief' or $transformed = 'gearchiveerd'">
                    <xsl:value-of select="$transformed"/>
                </xsl:when>
                <xsl:otherwise />
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    
    <xsl:function name="zgw:convertZgwBooleanToZdsBoolean">
        <xsl:param name="zgwBoolean"/>
        <xsl:if test="string-length($zgwBoolean) > 0">
            <xsl:choose>
                <xsl:when test="lower-case($zgwBoolean)='true'">J</xsl:when>
                <xsl:when test="lower-case($zgwBoolean)='false'">N</xsl:when>
                <xsl:otherwise>invalid character</xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xsl:function name="zgw:convertZdsBooleanToZgwBoolean" as="xs:string">
    	<xsl:param name="zdsBoolean" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="upper-case($zdsBoolean)='J'">true</xsl:when>
            <xsl:when test="upper-case($zdsBoolean)='N'">false</xsl:when>
      		<xsl:otherwise>invalid character</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>
    
    <xsl:function name="zgw:FromOrderedSource">
        <xsl:param name="param"/>
        <xsl:param name="zgwObject"/>
        <xsl:param name="zdsObject"/>
        <xsl:param name="self"/>
        <xsl:choose>
            <xsl:when test="$param">
                <xsl:value-of select="$param"/>
            </xsl:when>
            <xsl:when test="$zgwObject">
                <xsl:value-of select="$zgwObject"/>
            </xsl:when>
            <xsl:when test="$zdsObject">
                <xsl:value-of select="$zdsObject"/>
            </xsl:when>
            <xsl:when test="$self">
                <xsl:value-of select="$self"/>
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:function>

    <xsl:function name="zgw:FromOrderedSource">
        <xsl:param name="param"/>
        <xsl:param name="zgwObject"/>
        <xsl:param name="zdsObject"/>
        <xsl:param name="self"/>
        <xsl:param name="default" />
        <xsl:choose>
            <xsl:when test="$param">
                <xsl:value-of select="$param"/>
            </xsl:when>
            <xsl:when test="$zgwObject">
                <xsl:value-of select="$zgwObject"/>
            </xsl:when>
            <xsl:when test="$zdsObject">
                <xsl:value-of select="$zdsObject"/>
            </xsl:when>
            <xsl:when test="$self">
                <xsl:value-of select="$self"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$default">
                    <xsl:value-of select="$default"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="zgw:ObjectFromOrderedSource">
        <xsl:param name="param"/>
        <xsl:param name="zgwObject"/>
        <xsl:param name="zdsObject"/>
        <xsl:param name="self"/>
        <xsl:choose>
            <xsl:when test="$param">
                <xsl:copy-of select="$param"/>
            </xsl:when>
            <xsl:when test="$zgwObject">
                <xsl:copy-of select="$zgwObject"/>
            </xsl:when>
            <xsl:when test="$zdsObject">
                <xsl:copy-of select="$zdsObject"/>
            </xsl:when>
            <xsl:when test="$self">
                <xsl:copy-of select="$self"/>
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:function>

    <xsl:function name="zgw:ObjectFromOrderedSource">
        <xsl:param name="param"/>
        <xsl:param name="zgwObject"/>
        <xsl:param name="zdsObject"/>
        <xsl:param name="self"/>
        <xsl:param name="default" />
        <xsl:choose>
            <xsl:when test="$param">
                <xsl:copy-of select="$param"/>
            </xsl:when>
            <xsl:when test="$zgwObject">
                <xsl:copy-of select="$zgwObject"/>
            </xsl:when>
            <xsl:when test="$zdsObject">
                <xsl:copy-of select="$zdsObject"/>
            </xsl:when>
            <xsl:when test="$self">
                <xsl:copy-of select="$self"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$default">
                    <xsl:copy-of select="$default"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="zgw:WrapNullOrSkip" as="node()*">
        <xsl:param name="elementName" as="xs:string"/>
        <xsl:param name="mode" as="xs:string" />
        <xsl:param name="value" />
        <xsl:choose>
            <xsl:when test="string-length($value) > 0">
                <xsl:element name="{$elementName}"><xsl:copy-of select="$value" /></xsl:element>
            </xsl:when>
            <xsl:when test="$mode = 'null'">
                <xsl:element name="{$elementName}"><xsl:attribute name="xsi:nil" select="true()"/></xsl:element>
            </xsl:when>
            <xsl:when test="$mode = 'empty'">
                <xsl:element name="{$elementName}" />
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>