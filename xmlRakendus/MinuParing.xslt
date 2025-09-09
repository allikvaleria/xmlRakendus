<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<html>
			<body>
				<!-- 2. Kõik andmed tabelina koos elukohtade arvuga -->
				<h2>Kõik andmed tabelina</h2>
				<table border="1">
					<tr>
						<th>Nimi</th>
						<th>Sünniaasta</th>
						<th>Vanus</th>
						<th>Elukoht</th>
						<th>Inimeste arv elukohas</th>
						<th>Laste arv</th>
					</tr>
					<xsl:for-each select="//inimene">
						<tr>
							<td>
								<xsl:choose>
									<!-- Värvi nimed mis sisaldavad 'i' tähte punasena -->
									<xsl:when test="contains(nimi, 'i')">
										<span style="color: red;">
											<xsl:value-of select="nimi"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="nimi"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<xsl:value-of select="@saasta"/>
							</td>
							<td>
								<xsl:value-of select="2025 - @saasta"/>
							</td>
							<td>
								<xsl:value-of select="@elukoht"/>
							</td>
							<td>
								<xsl:value-of select="count(//inimene[@elukoht = current()/@elukoht])"/>
							</td>
							<td>
								<!-- Värvi taust kollaseks kui vähemalt 2 last -->
								<xsl:attribute name="style">
									<xsl:if test="count(lapsed/inimene) >= 2">background-color: yellow;</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="count(lapsed/inimene)"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>

				<!-- 3. Minu oma ülesanne: Leia kõige noorem inimene -->
				<h2>Kõige noorem inimene</h2>
				<xsl:for-each select="//inimene">
					<xsl:sort select="@saasta" order="descending"/>
					<xsl:if test="position() = 1">
						<p>
							Kõige noorem: <strong>
								<xsl:value-of select="nimi"/>
							</strong>,
							sündinud: <xsl:value-of select="@saasta"/>,
							vanus: <xsl:value-of select="2025 - @saasta"/> aastat
						</p>
					</xsl:if>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>