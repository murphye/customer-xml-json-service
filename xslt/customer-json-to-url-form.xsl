<!-- https://xsltfiddle.liberty-development.net/bEJbVsi/7 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2005/xpath-functions" version="3.0">

    <!-- 
        This stylesheet takes in JSON (i.e. REST HTTP POST) and converts it into a
        URL-encoded string. You could then change the content-type of the 
        HTTP POST to be application/x-www-form-urlencoded. So, to a client, it
        might look like a REST service, but on the backend, it's a simulated
        HTML form submission :-)
        
        I feel this could be handy for cases where a customer is looking to 
        move to a modern API, but is held back by legacy proprietary software,
        maybe a COTS application.
    -->

    <xsl:output method="text" />

    <xsl:template match="/">
        <xsl:apply-templates select="json-to-xml(.)/*"/>
    </xsl:template>
    
    <xsl:template match="map" xpath-default-namespace="http://www.w3.org/2005/xpath-functions">id=<xsl:value-of select="encode-for-uri(number[@key='id'])"/>&amp;address=<xsl:value-of select="encode-for-uri(string[@key='address'])"/>&amp;nation_id=<xsl:value-of select="encode-for-uri(number[@key='nation_id'])"/>&amp;phone=<xsl:value-of select="encode-for-uri(string[@key='phone'])"/>&amp;account_balance=<xsl:value-of select="encode-for-uri(number[@key='account_balance'])"/>&amp;market_segment=<xsl:value-of select="encode-for-uri(string[@key='market_segment'])"/>&amp;comment<xsl:value-of select="encode-for-uri(string[@key='comment'])"/></xsl:template>

</xsl:stylesheet>
