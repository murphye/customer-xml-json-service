<!-- https://xsltfiddle.liberty-development.net/93nwMpg/23 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2005/xpath-functions" version="3.0">

    <xsl:output method="text" />

    <xsl:template match="/">
        <xsl:variable name="json-xml">
            <array>
                <xsl:for-each select="parse-xml(.)//tr[descendant::td]">
                    <map>
                        <string key="market_segment"><xsl:value-of select="upper-case(td[1])"/></string>
                        <number key="account_balance_total"><xsl:value-of select="td[2]"/></number>
                        <string key="account_balance_trend"><xsl:value-of select="upper-case(td[3])"/></string>
                        <array key="nation_ids">
                            <xsl:for-each select="td[4]/span">
                              <number><xsl:value-of select="."/></number>
                            </xsl:for-each>
                        </array>
                    </map>
                </xsl:for-each>
            </array>
        </xsl:variable>
        <xsl:value-of select="xml-to-json($json-xml, map { 'indent' : true() })" />
    </xsl:template>

</xsl:stylesheet>