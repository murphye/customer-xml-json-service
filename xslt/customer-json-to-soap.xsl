<!-- https://xsltfiddle.liberty-development.net/bET2rWD/1 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2005/xpath-functions" version="3.0">

    <xsl:template match="/">
        <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
            <SOAP-ENV:Header/>
            <SOAP-ENV:Body>
                <C_MKTSEGMENT_ROLLUP xmlns="">
                    <xsl:apply-templates select="json-to-xml(.)/*"/>
                </C_MKTSEGMENT_ROLLUP>
            </SOAP-ENV:Body>
        </SOAP-ENV:Envelope>
    </xsl:template>
    
    <xsl:template match="map" xpath-default-namespace="http://www.w3.org/2005/xpath-functions">

        <C_MKTSEGMENT_SUMMARY xmlns="">
            <C_MKTSEGMENT><xsl:value-of select="string[@key='market_segment']"/></C_MKTSEGMENT>
            <C_ACCTBAL_TOTAL><xsl:value-of select="number[@key='account_balance_total']"/></C_ACCTBAL_TOTAL>
            <C_ACCTBAL_TREND><xsl:value-of select="string[@key='account_balance_trend']"/></C_ACCTBAL_TREND>
            <C_NATIONKEYS>
                <xsl:for-each select="array[@key='nation_ids']/number">
                    <C_NATIONKEY><xsl:value-of select="."/></C_NATIONKEY>
                </xsl:for-each>
            </C_NATIONKEYS>
        </C_MKTSEGMENT_SUMMARY>

    </xsl:template>

</xsl:stylesheet>
