<!-- https://xsltfiddle.liberty-development.net/6q1SDme/3 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2005/xpath-functions" version="3.0">

    <xsl:output method="html" version="5.0" indent="yes" />

    <xsl:template match="/">
        <html xmlns="">
            <head>
                <title>Account Summary Rollup by Market Segment</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
            </head>
            <body>
                <table class="table table-striped">
                    <tr>
                        <th>Market Segment</th>
                        <th>Total Account Balance</th>
                        <th>Account Balance Trend</th>
                        <th>Nation Keys</th>
                    </tr>
                    <xsl:apply-templates select="json-to-xml(.)/*"/>
                </table>
            </body>
            
        </html>
    </xsl:template>
    
    <xsl:template match="map" xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
        
        <tr xmlns="">
            <td><xsl:value-of select="lower-case(string[@key='market_segment'])"/></td>
            <td><xsl:value-of select="number[@key='account_balance_total']"/></td>
            <td><xsl:value-of select="lower-case(string[@key='account_balance_trend'])"/></td>
            <td>
                <xsl:for-each select="array[@key='nation_ids']/number">
                    <span><xsl:value-of select="."/></span>&#160;
                </xsl:for-each>
            </td>
        </tr>
              
    </xsl:template>

</xsl:stylesheet>
