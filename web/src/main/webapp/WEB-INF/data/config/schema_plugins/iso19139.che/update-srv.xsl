<?xml version="1.0" encoding="UTF-8"?>
<!--  
Stylesheet used to update metadata for a service and 
attached it to the metadata for data.
-->
<xsl:stylesheet version="2.0" 			xmlns:gmd="http://www.isotc211.org/2005/gmd"	
										xmlns:gco="http://www.isotc211.org/2005/gco"
										xmlns:gts="http://www.isotc211.org/2005/gts"
										xmlns:gml="http://www.opengis.net/gml"
										xmlns:srv="http://www.isotc211.org/2005/srv"
										xmlns:che="http://www.geocat.ch/2008/che"
										xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
										xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										xmlns:date="http://exslt.org/dates-and-times">

	<!-- ============================================================================= -->
	
	<xsl:param name="uuidref"></xsl:param>
	<xsl:param name="scopedName"></xsl:param>
	
	<!-- ============================================================================= -->
	
	<xsl:template match="/che:CHE_MD_Metadata">
	<xsl:copy >
		<xsl:copy-of select="@*"/>
		<xsl:copy-of
		    select="gmd:fileIdentifier|
		    gmd:language|
		    gmd:characterSet|
		    gmd:parentIdentifier|
		    gmd:hierarchyLevel|
		    gmd:hierarchyLevelName|
		    gmd:contact|
		    gmd:dateStamp|
		    gmd:metadataStandardName|
		    gmd:metadataStandardVersion|
		    gmd:dataSetURI|
		    gmd:locale|
		    gmd:spatialRepresentationInfo|
		    gmd:referenceSystemInfo|
		    gmd:metadataExtensionInfo"/>
	    
			<gmd:identificationInfo>
				<che:CHE_SV_ServiceIdentification gco:isoType="srv:SV_ServiceIdentification">
				<xsl:copy-of select="gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:citation|
								gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:citation|
								gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:abstract|
								gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:abstract|
								gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:purpose|
								gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:purpose|
								gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:credit|
								gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:credit|
								gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:statut|
								gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:statut|
								gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:pointOfContact|
								gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:pointOfContact|
	        					gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceMaintenance|
	        					gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:resourceMaintenance|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:graphicOverview|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:graphicOverview|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceFormat|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:resourceFormat|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:descriptiveKeywords|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:descriptiveKeywords|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceSpecificUsage|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:resourceSpecificUsage|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceConstraints|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:resourceConstraints|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:aggregationInfo|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:aggregationInfo|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:serviceType|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:serviceType|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:serviceTypeVersion|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:serviceTypeVersion|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:accessProperties|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:accessProperties|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:restrictions|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:restrictions|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:keywords|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:keywords|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:extent|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:extent"/>
				
	                            
				<!-- Handle SV_CoupledResource -->
				<xsl:variable name="coupledResource">
					<srv:coupledResource>
						<srv:SV_CoupledResource>
							<srv:operationName>
								<gco:CharacterString>GetCapabilities</gco:CharacterString> 
							</srv:operationName> 
							<srv:identifier>
								<gco:CharacterString><xsl:value-of select="$uuidref"/></gco:CharacterString> 
							</srv:identifier> 
							<gco:ScopedName>
								<xsl:value-of select="$scopedName" />
							</gco:ScopedName> 
						</srv:SV_CoupledResource> 
					</srv:coupledResource> 
				</xsl:variable>
				
				<xsl:choose>
					<xsl:when test="gmd:identificationInfo/srv:SV_ServiceIdentification/srv:coupledResource|
						gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:coupledResource">
						<xsl:for-each select="gmd:identificationInfo/srv:SV_ServiceIdentification/srv:coupledResource|
							gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:coupledResource">
							<!-- Avoid duplicate SV_CoupledResource elements -->
							<xsl:choose>
								<xsl:when test="srv:SV_CoupledResource/srv:identifier/gco:CharacterString!=$uuidref">
									<xsl:copy-of select="."/>
								</xsl:when>
							</xsl:choose>
							<xsl:if test="position()=last()">
								<xsl:copy-of select="$coupledResource"/>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:copy-of select="$coupledResource"/>
					</xsl:otherwise>
					
				</xsl:choose>
				
				
				<xsl:copy-of select="gmd:identificationInfo/srv:SV_ServiceIdentification/srv:couplingType|
								gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:couplingType|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:containsOperations|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:containsOperations|
	                            gmd:identificationInfo/srv:SV_ServiceIdentification/srv:operatesOn[@uuidref!=$uuidref]|
	                            gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/srv:operatesOn[@uuidref!=$uuidref]"/>
				
				<!-- Handle operatesOn -->
				<srv:operatesOn uuidref="{$uuidref}"/>
				
				<xsl:copy-of select="gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/che:*"/>
				
	    	</che:CHE_SV_ServiceIdentification>
		</gmd:identificationInfo>
	
		<xsl:copy-of select="gmd:contentInfo|
		    gmd:distributionInfo|
		    gmd:dataQualityInfo|
		    gmd:portrayalCatalogueInfo|
		    gmd:metadataConstraints|
		    gmd:applicationSchemaInfo|
		    gmd:metadataMaintenance|
		    gmd:series|
		    gmd:describes|
		    gmd:propertyType|
		    gmd:featureType|
		    gmd:featureAttribute|
		    che:*"/>
		
	</xsl:copy>
	</xsl:template>


</xsl:stylesheet>
