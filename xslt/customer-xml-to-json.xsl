<!-- https://xsltfiddle.liberty-development.net/aiynfa/4 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2005/xpath-functions" version="3.0">

    <xsl:output method="text" />

    <xsl:template match="/">
        <xsl:variable name="json-xml">
            <array>
                <xsl:apply-templates select="//T" />
            </array>
        </xsl:variable>
        <xsl:value-of select="xml-to-json($json-xml, map { 'indent' : true() })" />
    </xsl:template>

    <xsl:template match="T">
        <map>
            <number key="id"><xsl:value-of select="C_CUSTKEY" /></number>
            <string key="name"><xsl:value-of select="C_NAME" /></string>
            <string key="address"><xsl:value-of select="C_ADDRESS" /></string>
            <number key="nation_id"><xsl:value-of select="C_NATIONKEY" /></number>
            <string key="phone"><xsl:value-of select="C_PHONE" /></string>
            <number key="account_balance"><xsl:value-of select="C_ACCTBAL" /></number>
            <string key="market_segment"><xsl:value-of select="C_MKTSEGMENT" /></string>
            <string key="comment"><xsl:value-of select="C_COMMENT" /></string>
        </map>
    </xsl:template>

</xsl:stylesheet>