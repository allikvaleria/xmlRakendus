<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
		<h2>Laste</h2>
		<table border="1">
			<tr>
				<th>Vanem</th>
				<th>Laps</th>
				<th>Sünnipäev</th>
				<th>Vanus</th>
				<th>Elukoht</th>
				<th>Lapsevanema vanus</th>
				<xsl:for-each select="//inimene">
					<tr>
						<td>
							<xsl:value-of select="../../nimi"/>
						</td>
						<td>
							<xsl:value-of select="nimi"/>
						</td>
						<td>
							<xsl:value-of select="@saasta"/>
						</td>
						<td>
							<xsl:value-of select="2025-@saasta"/>
						</td>
						<td>
							<xsl:value-of select="nimi"/>
							<xsl:if test="../..">
								-lapsevanema vanus oli
								<xsl:value-of select="../../@saasta - @saasta"/> aastat vana
							</xsl:if>
						</td>
					</tr>
				</xsl:for-each>
			</tr>
		</table>>
    </xsl:template>
</xsl:stylesheet>
