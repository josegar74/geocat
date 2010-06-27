<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:geonet="http://www.fao.org/geonetwork"
	exclude-result-prefixes="xsl geonet">

	<xsl:variable name="lang" select="/root/gui/language"/>

	<xsl:template match="/">
	<form name="advsearch" id="advsearch" onsubmit="javascript:runAdvancedSearch();">
		<table class="advsearchfields">
			<xsl:comment>ADVANCED SEARCH</xsl:comment>					
			<tr class="advsearchfields">
				<xsl:comment>ADV SEARCH: WHAT?</xsl:comment>
				<td width="16px" height="236px" style="padding-right: 3px; padding-top:5px;">
					<img width="13px" height="233px" src="{/root/gui/url}/images/arrow-down.gif"/>
				</td>
				<td style="margin-left:5px;">
					<xsl:call-template name="adv_what"></xsl:call-template>
				</td>
				<xsl:comment>ADV SEARCH: WHERE?</xsl:comment>					
				<td width="16px" height="236px" style="padding-right: 3px; padding-top:5px;">
					<img width="13px" height="233px" src="{/root/gui/url}/images/arrow-down.gif"/>
				</td>
				<td>
					<xsl:call-template name="adv_where"></xsl:call-template>
				</td>
				<xsl:comment>ADV SEARCH: WHEN?</xsl:comment>					
				<td width="16px" height="236px" style="padding-right: 3px; padding-top:5px;">
					<img width="13px" height="233px" src="{/root/gui/url}/images/arrow-down.gif"/>
				</td>
				<td>
					<xsl:call-template name="adv_when"></xsl:call-template>
				</td>
			</tr>
            <xsl:if test="/root/gui/config/inspire = '1'">
			 <tr>
                <xsl:comment>ADV SEARCH: INSPIRE</xsl:comment>
				<td width="16px" height="236px" style="padding-right: 3px; padding-top:5px; display:none" id="arrow_inspire">
					<img width="13px" height="423px" src="{/root/gui/url}/images/arrow-down2.gif"/>
				</td>
				<td colspan="5" style="margin-left:5px;">
				    <xsl:call-template name="adv_inspire"></xsl:call-template>
				</td>
			</tr>
            </xsl:if>
			
			<tr>
				<td colspan="6">
					<table class="advsearchfields" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr >
							<td width="5px"></td>
							<td style="background: url({/root/gui/url}/images/arrow-bg.gif) repeat-x;" height="29px" width="80%">
								
							</td>
							<td width="36px" style="background: url({/root/gui/url}/images/arrow-right.gif) no-repeat;" > </td>
							<td width="13px" style="background: url({/root/gui/url}/images/search-left.gif) no-repeat;" > </td>
							<td align="center" width="40px" style="background: url({/root/gui/url}/images/search-bg.gif) repeat-x; width: auto; white-space: nowrap; padding-bottom: 8px; vertical-align: bottom; cursor:hand;  cursor:pointer;" onclick="runAdvancedSearch()" >
								<font color="#FFFFFF"><strong><xsl:value-of select="/root/gui/strings/search"/></strong></font>
							</td>
							<td width="12px" style="background: url({/root/gui/url}/images/search-right.gif) no-repeat;" > </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="right">
					<a onClick="resetAdvancedSearch();" style="cursor:pointer; padding-right:10px; padding-left:10px;" title="{/root/gui/strings/resetSearch}" alt="{/root/gui/strings/resetSearch}"><xsl:value-of select="/root/gui/strings/reset"/></a>
					<a onClick="showSimpleSearch();" style="cursor:pointer; padding-right:10px; padding-left:10px;"><xsl:value-of select="/root/gui/strings/hideAdvancedOptions"/></a>		
					
				</td>
			</tr>
		</table>
	</form>					
</xsl:template>

    <!-- ============================================================
        INSPIRE
    ======================================= ===================== -->
<xsl:template name="adv_inspire">
    <h1 style="margin-top:5px"><a href="#" onclick="toggleInspire()" style="margin-right:2px"><img id="i_inspire" width="9px" height="9px" src="{/root/gui/url}/images/plus.gif"/></a><xsl:value-of select="/root/gui/strings/inspire/what/l1"/></h1>

    <!-- INSPIRE search elements -->
    <div id="inspiresearchfields" style="display:none">
        <div> <!-- style="float:left;"-->
            <div style="margin-bottom: 10px">  <!-- div row-->
                <input type="checkbox" id="inspire" name="inspire"/><!--Alleen INSPIRE metadata--><xsl:value-of select="/root/gui/strings/inspire/what/l3"/>
            </div>

            <!-- div row-->
            <!--div class="row">
                <span class="labelField"><xsl:value-of select="/root/gui/strings/rtitle"/></span>
                <input type="text" class="content" style="width:200px; !important" id="title" name="title" value=""/>
            </div-->

            <div class="row">  <!-- div row-->
                <span class="labelField"><xsl:value-of select="/root/gui/strings/inspire/what/l6"/></span>
                <select id="inspireannex" name="inspireannex" class="content" style="width:200px; !important" onchange="inspireAnnexChanged(this.value)">
                    <option value="" selected="selected"/>
                    <option value="I"><xsl:value-of select="/root/gui/strings/inspire/what/l6"/> I</option>
                    <option value="II"><xsl:value-of select="/root/gui/strings/inspire/what/l6"/> II</option>
                    <option value="III"><xsl:value-of select="/root/gui/strings/inspire/what/l6"/> III</option>
                </select>
            </div>

            <div class="row">  <!-- div row-->
                <span class="labelField"><!--Brontype--><xsl:value-of select="/root/gui/strings/inspire/what/l7"/></span>
                <select id="inspirebrontype" class="content" name="inspirebrontype" style="width:200px; !important" onchange="inspireBrontypeChanged(this.value)">
                    <option value="" selected="selected"/>
                    <option value="dataset"><!--Datasets en dataset series--><xsl:value-of select="/root/gui/strings/inspire/what/l9"/></option>
                    <option value="service"><!--Services--><xsl:value-of select="/root/gui/strings/inspire/what/l10"/></option>
                </select>
            </div>

            <div class="row">  <!-- div row-->
                <span class="labelField"><!--Service type--><xsl:value-of select="/root/gui/strings/inspire/what/l15"/></span>
                <select id="protocol" class="content" style="width:200px; !important">
                   <option value="" selected="selected"></option>
                   <xsl:for-each select="/root/gui/strings/protocolChoice[@show='y']">
                       <option value="{@value}">
                           <xsl:if test="@value=/root/gui/searchDefaults/protocol">
                               <xsl:attribute name="selected"/>
                           </xsl:if>
                           <xsl:value-of select="."/>
                       </option>
                   </xsl:for-each>
                </select>
             </div>
        </div>

        <!-- INSPIRE Thema -->
        <div> <!-- style="float:left; margin-left: 20px;"-->
            <fieldset>
               <legend><!--INSPIRE Thema--><xsl:value-of select="/root/gui/strings/inspire/what/l14"/></legend>

               <div id="inspirethemesdiv" style="display:block; width: 950px;">
                   <div> <!--style="max-height:170px;height:170px;overflow:auto;"-->

                   <div class="inspireThemeTitle"><xsl:value-of select="/root/gui/strings/inspire/what/l6"/> I</div>

                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Geographical names" name="Geographical names" id="inspire_GeographicalNames"/>

                           <span>
                               <label for="inspire_GeographicalNames"><!--Geographical names--><xsl:value-of select="/root/gui/strings/inspire/annex1/l3"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Administrative units" name="Administrative units" id="inspire_AdministrativeUnits"/>

                           <span>
                               <label for="inspire_AdministrativeUnits"><!--Administrative units--><xsl:value-of select="/root/gui/strings/inspire/annex1/l4"/></label>
                           </span>
                      </span>
                      <span class="inspireThemeElement">
                           <input type="checkbox" value="Addresses" name="Addresses" id="inspire_Addresses"/>

                           <span>
                               <label for="inspire_Addresses"><!--Addresses--><xsl:value-of select="/root/gui/strings/inspire/annex1/l5"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Cadastral parcels" name="Cadastral parcels" id="inspire_CadastralParcels"/>

                           <span>
                               <label for="inspire_CadastralParcels"><!--Cadastral parcels--><xsl:value-of select="/root/gui/strings/inspire/annex1/l6"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Transport networks" name="Transport networks" id="inspire_TransportNetworks"/>

                           <span>
                               <label for="inspire_TransportNetworks"><!--Transport networks--><xsl:value-of select="/root/gui/strings/inspire/annex1/l7"/></label>
                           </span>
                      </span>
                      <span class="inspireThemeElement">
                           <input type="checkbox" value="Hydrography" name="Hydrography" id="inspire_Hydrography"/>

                           <span>
                               <label for="inspire_Hydrography"><!--Hydrography--><xsl:value-of select="/root/gui/strings/inspire/annex1/l8"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Protected sites" name="Protected sites" id="inspire_ProtectedSites"/>

                           <span>
                               <label for="inspire_ProtectedSites"><!--Protected sites--><xsl:value-of select="/root/gui/strings/inspire/annex1/l9"/></label>
                           </span>
                       </span>


                       <div class="inspireThemeTitle"><xsl:value-of select="/root/gui/strings/inspire/what/l6"/> II</div>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Elevation" name="Elevation" id="inspire_Elevation"/>

                           <span>
                               <label for="inspire_Elevation"><!--Elevation--><xsl:value-of select="/root/gui/strings/inspire/annex2/l1"/></label>
                           </span>
                      </span>
                      <span class="inspireThemeElement">
                           <input type="checkbox" value="Land cover" name="Land cover" id="inspire_LandCover"/>

                           <span>
                               <label for="inspire_LandCover"><!--Land cover--><xsl:value-of select="/root/gui/strings/inspire/annex2/l2"/></label>
                           </span>
                      </span>
                      <span class="inspireThemeElement">
                           <input type="checkbox" value="Orthoimagery" name="Orthoimagery" id="inspire_Orthoimagery"/>

                           <span>
                               <label for="inspire_Orthoimagery"><!--Orthoimagery--><xsl:value-of select="/root/gui/strings/inspire/annex2/l3"/></label>
                           </span>
                      </span>
                      <span class="inspireThemeElement">
                           <input type="checkbox" value="Geology" name="Geology" id="inspire_Geology"/>

                           <span>
                               <label for="inspire_Geology"><!--Geology--><xsl:value-of select="/root/gui/strings/inspire/annex2/l4"/></label>
                           </span>
                      </span>


                      <div class="inspireThemeTitle"><xsl:value-of select="/root/gui/strings/inspire/what/l6"/> III</div>

                        <span class="inspireThemeElement">
                           <input type="checkbox" value="Statistical units" name="Statistical units" id="inspire_StatisticalUnits"/>

                           <span>
                               <label for="inspire_StatisticalUnits"><!--Statistical units--><xsl:value-of select="/root/gui/strings/inspire/annex3/l1"/></label>
                           </span>
                        </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Buildings" name="Buildings" id="inspire_Buildings"/>

                           <span>
                               <label for="inspire_Buildings"><!--Buildings--><xsl:value-of select="/root/gui/strings/inspire/annex3/l2"/></label>
                           </span>
                       </span>
                        <span class="inspireThemeElement">
                           <input type="checkbox" value="Soil" name="Soil" id="inspire_Soil"/>

                           <span>
                               <label for="inspire_Soil"><!--Soil--><xsl:value-of select="/root/gui/strings/inspire/annex3/l3"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Land use" name="Land use" id="inspire_LandUse"/>

                           <span>
                               <label for="inspire_LandUse"><!--Land use--><xsl:value-of select="/root/gui/strings/inspire/annex3/l4"/></label>
                           </span>
                       </span>
                        <span class="inspireThemeElement">
                           <input type="checkbox" value="Human health and safety" name="Human health and safety" id="inspire_HumanHealthAndSafety"/>

                           <span>
                               <label for="inspire_HumanHealthAndSafety"><!--Human health and safety--><xsl:value-of select="/root/gui/strings/inspire/annex3/l5"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Utility and Government services" name="Utility and Government services" id="inspire_UtilityAndGovernmentServices"/>

                           <span>
                               <label for="inspire_UtilityAndGovernmentServices"><!--Utility and Government services--><xsl:value-of select="/root/gui/strings/inspire/annex3/l6"/></label>
                           </span>
                       </span>
                        <span class="inspireThemeElement">
                           <input type="checkbox" value="Environmental monitoring facilities" name="Environmental monitoring facilities" id="inspire_EnvironmentalMonitoringFacilities"/>

                           <span>
                               <label for="inspire_EnvironmentalMonitoringFacilities"><!--Environmental monitoring facilities--><xsl:value-of select="/root/gui/strings/inspire/annex3/l7"/></label>
                           </span>
                       </span>
                        <span class="inspireThemeElement">
                           <input type="checkbox" value="Production and industrial facilities" name="Production and industrial facilities" id="inspire_ProductionAndIndustrialFacilities"/>

                           <span>
                               <label for="inspire_ProductionAndIndustrialFacilities"><!--Production and industrial facilities--><xsl:value-of select="/root/gui/strings/inspire/annex3/l8"/></label>
                           </span>
                       </span>
                        <span class="inspireThemeElement">
                           <input type="checkbox" value="Agricultural and aquaculture facilities" name="Agricultural and aquaculture facilities" id="inspire_AgriculturalAndAquacultureFacilities"/>

                           <span>
                               <label for="inspire_AgriculturalAndAquacultureFacilities"><!--Agricultural and aquaculture facilities--><xsl:value-of select="/root/gui/strings/inspire/annex3/l9"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Population distribution - demography" name="Population distribution - demography" id="inspire_PopulationDistribution-Demography"/>
                            <span>
                               <label for="inspire_PopulationDistribution-Demography"><!--Population distribution - demography--><xsl:value-of select="/root/gui/strings/inspire/annex3/l10"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Area management/restriction/regulation zones and reporting units" name="Area management/restriction/regulation zones and reporting units" id="inspire_AreaManagementRestrictionRegulationZonesAndReportingUnits"/>
                            <span>
                               <label for="inspire_AreaManagementRestrictionRegulationZonesAndReportingUnits"><!--Area management/restriction/regulation zones and reporting units-->
                                   <xsl:value-of select="/root/gui/strings/inspire/annex3/l11"/></label>
                           </span>
                        </span>
                        <span class="inspireThemeElement">
                            <input type="checkbox" value="Natural risk zones" name="Natural risk zones" id="inspire_NaturalRiskZones"/>
                            <span>
                               <label for="inspire_NaturalRiskZones"><!--Natural risk zones--><xsl:value-of select="/root/gui/strings/inspire/annex3/l12"/></label>
                           </span>
                        </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Atmospheric conditions" name="Atmospheric conditions" id="inspire_AtmosphericConditions"/>
                           <span>
                               <label for="inspire_AtmosphericConditions"><!--Atmospheric conditions--><xsl:value-of select="/root/gui/strings/inspire/annex3/l13"/></label>
                           </span>
                       </span>
                        <span class="inspireThemeElement">
                            <input type="checkbox" value="Meteorological geographical features" name="Meteorological geographical features" id="inspire_MeteorologicalGeographicalFeatures"/>
                            <span>
                               <label for="inspire_MeteorologicalGeographicalFeatures"><!--Meteorological geographical features--><xsl:value-of select="/root/gui/strings/inspire/annex3/l14"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Oceanographic geographical features" name="Oceanographic geographical features" id="inspire_OceanographicGeographicalFeatures"/>
                           <span>
                               <label for="inspire_OceanographicGeographicalFeatures"><!--Oceanographic geographical features--><xsl:value-of select="/root/gui/strings/inspire/annex3/l15"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Sea regions" name="Sea regions" id="inspire_SeaRegions"/>
                           <span>
                               <label for="inspire_SeaRegions"><!--Sea regions--><xsl:value-of select="/root/gui/strings/inspire/annex3/l16"/></label>
                           </span>
                        </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Bio-geographical regions" name="Bio-geographical regions" id="inspire_Bio-geographicalRegions"/>
                            <span>
                               <label for="inspire_Bio-geographicalRegions"><!--Bio-geographical regions--><xsl:value-of select="/root/gui/strings/inspire/annex3/l17"/></label>
                           </span>
                        </span>
                        <span class="inspireThemeElement">
                           <input type="checkbox" value="Habitats and biotopes" name="Habitats and biotopes" id="inspire_HabitatsAndBiotopes"/>
                            <span>
                               <label for="inspire_HabitatsAndBiotopes"><!--Habitats and biotopes--><xsl:value-of select="/root/gui/strings/inspire/annex3/l18"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                           <input type="checkbox" value="Species distribution" name="Species distribution" id="inspire_SpeciesDistribution"/>
                           <span>
                               <label for="inspire_SpeciesDistribution"><!--Species distribution--><xsl:value-of select="/root/gui/strings/inspire/annex3/l19"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                            <input type="checkbox" value="Energy resources" name="Energy resources" id="inspire_EnergyResources"/>
                            <span>
                               <label for="inspire_EnergyResources"><!--Energy resources--><xsl:value-of select="/root/gui/strings/inspire/annex3/l20"/></label>
                           </span>
                       </span>
                       <span class="inspireThemeElement">
                          <input type="checkbox" value="Mineral resources" name="Mineral resources" id="inspire_MineralResources"/>
                          <span>
                               <label for="inspire_MineralResources"><!--Mineral resources--><xsl:value-of select="/root/gui/strings/inspire/annex3/l21"/></label>
                           </span>
                       </span>
                   </div>
               </div>
            </fieldset>
        </div>

    </div>
       <!-- end INSPIRE search elements -->
</xsl:template>
     
	<!-- ============================================================ 
		WHAT
	======================================= ===================== -->
	
<xsl:template name="adv_what">
	<h1><xsl:value-of select="/root/gui/strings/what"/></h1>
	<table heigth="100%	">
		<tr style="display:none;">
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/searchAllText"/>
			</th>
			<td style="padding-bottom:10px;">
				<input name="any" id="any" class="content"  size="20" value="{/root/gui/searchDefaults/any}"/>
			</td>
		</tr>
		<!-- enable for OR search -->
		<tr id="or_search_row">
			<th class="padded">
                <xsl:value-of select="/root/gui/strings/searchEitherOfTheWords"/>
			</th>
			<td style="padding-bottom:10px;">
				<input name="or" id="or" class="content" size="20" value=""/>
				 <a href="#" onclick="toggleMoreFields()" style="margin-left:2px"><img id="i_morefields" width="9px" height="9px" src="{/root/gui/url}/images/plus.gif" title="{/root/gui/strings/showMoreSearchFields}" alt="{/root/gui/strings/showMoreSearchFields}"/></a>
			</td>
		</tr>

		<!-- enable for PHRASE search -->
		<tr id="phrase_search_row" style="display:none">
			<th class="padded">
				 <xsl:value-of select="/root/gui/strings/searchExactPhrase"/>
			</th>
			<td style="padding-bottom:10px;">
				<input name="phrase" id="phrase" class="content" size="20" value=""/>
			</td>
		</tr>

        <!-- enable for ALL search -->
		<tr id="all_search_row" style="display:none">
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/searchAllWords"/>
			</th>
			<td style="padding-bottom:10px;">
				<input name="all" id="all" class="content" size="20" value=""/>
			</td>
		</tr>

		<!-- enable for WITHOUT search -->
		<tr id="without_search_row" style="display:none">
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/searchWithoutWords"/>
			</th>
			<td style="padding-bottom:10px;">
				<input name="without" id="without" class="content" size="20" value=""/>
			</td>
		</tr>
		
		<tr>
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/rtitle"/>
			</th>
			<td style="padding-bottom:5px;">
				<span title="{/root/gui/strings/searchhelp/rtitle}">
					<input name="title" id="title" class="content"  size="20" value="{/root/gui/searchDefaults/title}"/>
				</span>
			</td>
		</tr>
		<tr>
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/abstract"/>
			</th>
			<td style="padding-bottom:5px;">
				<span title="{/root/gui/strings/searchhelp/abstract}">
					<input name="abstract" id="abstract" class="content"  size="20" value="{/root/gui/searchDefaults/abstract}"/>
				</span>
			</td>
		</tr>
		<tr>
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/keywords"/>
			</th>
			<td style="padding-bottom:5px;">
				<span title="{/root/gui/strings/searchhelp/keywords}">
					<input id="themekey" name="themekey" onClick="javascript:popKeyword (this, $(keywordSelectorFrame));"
				 		class="content" size="20" value="{/root/gui/searchDefaults/themekey}"/>
				</span>

				<xsl:if test="/root/gui/config/search/keyword-selection-panel">
		  			<a style="cursor:pointer;" onclick="javascript:showSearchKeywordSelectionPanel();">
		  				<img src="{/root/gui/url}/images/find.png" alt="{/root/gui/strings/searchhelp/thesaurus}" title="{/root/gui/strings/searchhelp/thesaurus}"/>
					</a>
				</xsl:if>
				
				<div id="keywordSelectorFrame" class="keywordSelectorFrame" style="display:none;z-index:1000;">
					<div id="keywordSelector" class="keywordSelector"/>
				</div>
				
				<div id="keywordList" class="keywordList"/>
				
			</td>
		</tr>

		<!-- Category -->
		<tr>
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/category"/>
			</th>
			<td class="padded">
				<select class="content" name="category" id="category">
					<option value="">
						<xsl:if test="/root/gui/searchDefaults/category=''">
							<xsl:attribute name="selected"/>
						</xsl:if>
						<xsl:value-of select="/root/gui/strings/any"/>
					</option>
					
					<xsl:for-each select="/root/gui/categories/record">
						<xsl:sort select="label/child::*[name() = $lang]" order="ascending"/>
						
						<option value="{name}">
							<xsl:if test="name = /root/gui/searchDefaults/category">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:value-of select="label/child::*[name() = $lang]"/>
						</option>
					</xsl:for-each>
				</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" style="padding-top:3px; white-space: nowrap;">
<!--				<fieldset>
					<legend><xsl:value-of select="/root/gui/strings/mapType"/></legend> -->
				<a onclick="showFields('maptype.img','maptype.table')" style="cursor:pointer;cursor:hand;">
					<img id="maptype.img" src="{/root/gui/url}/images/plus.gif"/>
					<xsl:text> </xsl:text>	
					<xsl:value-of select="/root/gui/strings/mapType"/>
				</a>
			
					<table id="maptype.table" style="display:none;border-color:#2a628f;border-style:solid;border-width:1px;" width="100%">
						<tr>
							<td>
							<input name="digital" id="digital" type="checkbox" value="on">
                        		<xsl:if test="/root/gui/searchDefaults/digital='on'">
		                            <xsl:attribute name="checked"/>
		                        </xsl:if>
		                        <label for="digital"><xsl:value-of select="/root/gui/strings/digital"/></label>
		                    </input>
							<br/>
		                    <input name="paper" id="paper" type="checkbox" value="on">
		                        <xsl:if test="/root/gui/searchDefaults/paper='on'">
		                            <xsl:attribute name="checked"/>
		                        </xsl:if>
		                        <label for="paper"><xsl:value-of select="/root/gui/strings/paper"/></label>
		                    </input>
						</td>
						<td>
	    	                <input name="dynamic" id="dynamic" type="checkbox">
    	    	                <xsl:if test="/root/gui/searchDefaults/dynamic='on'">
                	            <xsl:attribute name="checked"/>
                    	    </xsl:if>
		                        <label for="dynamic"><xsl:value-of select="/root/gui/strings/dynamic"/></label>
		                    </input>
							<br/>
		                    <input name="download" id="download" type="checkbox">
		                        <xsl:if test="/root/gui/searchDefaults/download='on'">
	    	                        <xsl:attribute name="checked"/>
            	    	        </xsl:if>
                	    	    <label for="download"><xsl:value-of select="/root/gui/strings/downloadable"/></label>
		                    </input>
        	           		</td>
						</tr>
					</table>
<!--					<br/>
						<xsl:value-of select="/root/gui/strings/protocol"/>&#xA0;
						<select id="protocol" class="content" size="1">
							<option value="">
								<xsl:if test="/root/gui/searchDefaults/protocol = ''">
									<xsl:attribute name="selected"/>
								</xsl:if>
							</option>
							
							<xsl:for-each select="/root/gui/strings/protocolChoice">
								<xsl:if test="@show = 'y'">
									<option value="{@value}">
										<xsl:if test="@value=/root/gui/searchDefaults/protocol">
											<xsl:attribute name="selected"/>
										</xsl:if>
										<xsl:value-of select="."/>
									</option>
								</xsl:if>
							</xsl:for-each>
						</select> -->
<!--				</fieldset> -->
			</td>	
		</tr>
				
		<tr>
			<td colspan="2" style="padding-top:3px; white-space: nowrap;">
				<a onclick="showFields('fuzzy.img','fuzzy.td')" style="cursor:pointer;cursor:hand;">
					<img id="fuzzy.img" src="{/root/gui/url}/images/plus.gif"/>
					<xsl:text> </xsl:text>	
					<xsl:value-of select="/root/gui/strings/fuzzy"/>
				</a>
				<table id="fuzzy.td" style="display:none;border-color:#2a628f;border-style:solid;border-width:1px;">
					<td>
	<!--				<fieldset>
						<legend><xsl:value-of select="/root/gui/strings/fuzzy"/></legend> -->
						<xsl:value-of select="/root/gui/strings/fuzzyPrecise"/> <input type="radio" id="similarity" name="similarity" value="1" >
							<xsl:if test="/root/gui/searchDefaults/similarity='1'">
									<xsl:attribute name="checked"/>
							</xsl:if>
						</input>
						<input type="radio" id="similarity" name="similarity" value=".8">
							<xsl:if test="/root/gui/searchDefaults/similarity='.8'">
									<xsl:attribute name="checked"/>
							</xsl:if>
						</input>
						<input type="radio" id="similarity" name="similarity" value=".6" >
							<xsl:if test="/root/gui/searchDefaults/similarity='.6'">
									<xsl:attribute name="checked"/>
							</xsl:if>
						</input>
	
						<input type="radio" id="similarity" name="similarity" value=".4" >
							<xsl:if test="/root/gui/searchDefaults/similarity='.4'">
									<xsl:attribute name="checked"/>
							</xsl:if>
						</input> 
						<input type="radio" id="similarity" name="similarity" value=".2" >
							<xsl:if test="/root/gui/searchDefaults/similarity='.2'">
									<xsl:attribute name="checked"/>
							</xsl:if>
						</input><xsl:value-of select="/root/gui/strings/fuzzyImprecise"/>
	<!--				</fieldset>	-->
					</td>
				</table>
			</td>
		</tr>
	</table>

</xsl:template>
	
	
	<!-- ============================================================ 
		WHERE
	============================================================= -->
	
<xsl:template name="adv_where">

	<h1><xsl:value-of select="/root/gui/strings/where"/></h1>
	
	<xsl:comment>MINIMAP</xsl:comment>
	
	<table align="center"> <!--  minimap & coords -->
		<tr>
			<td align="center" colspan="3">
				
				<table id="minimap_root" width="340px">
					<tr>
						<td colspan="3" align="center" style="padding: 3px;">
							<small><xsl:value-of select="/root/gui/strings/latMax"/></small> <input type="text" class="content" id="northBL" name="northBL"  size="5"
								value="{/root/gui/searchDefaults/northBL}" onChange="javascript:AoIrefresh();"
								alt="{/root/gui/strings/latitude}" title="{/root/gui/strings/latitude}"/>
						</td>
					</tr>
					<tr height="102px">
						<td width="52px" style="padding-top: 25px; align: center;">
							<small><xsl:value-of select="/root/gui/strings/longMin"/></small>
							<br />
							<input type="text" class="content" id="westBL" name="westBL" size="5"
								value="{/root/gui/searchDefaults/westBL}" onChange="javascript:AoIrefresh();"
								alt="{/root/gui/strings/longitude}" title="{/root/gui/strings/longitude}"/>
						</td>
						<td width="16px">
							<table width="16px">
								<xsl:comment>MINIMAP TOOLBAR</xsl:comment>						
								<tr  id="im_mm_toolbar"> <!-- This element's class is set at runtime -->
									<td class="im_mmtool" id="im_mmtool_fullextent"  	onClick="javascript:im_mm_fullExtent()"><img src="/intermap/images/im_zoomfull16x16.png" title="{/root/gui/strings/imZoomFull}"/></td>
								</tr>
								<tr  id="im_mm_toolbar"> <!-- This element's class is set at runtime -->
									<td class="im_mmtool" id="im_mmtool_zoomin"	onClick="javascript:im_mm_setTool('zoomin');" ><img src="/intermap/images/zoomin.png" title="{/root/gui/strings/imZoomIn}"/></td>
								</tr>
								<tr  id="im_mm_toolbar"> <!-- This element's class is set at runtime -->
									<td class="im_mmtool" id="im_mmtool_zoomout"   	onClick="javascript:im_mm_setTool('zoomout');"><img  src="/intermap/images/zoomout.png" title="{/root/gui/strings/imZoomOut}"/></td>
								</tr>
								<tr  id="im_mm_toolbar"> <!-- This element's class is set at runtime -->
									<td class="im_mmtool" id="im_mmtool_pan"		onClick="javascript:im_mm_setTool('pan');"><img src="/intermap/images/im_pan16x16.png" title="{/root/gui/strings/imPan}"/></td>
								</tr>
								<tr  id="im_mm_toolbar"> <!-- This element's class is set at runtime -->
									<!--							<td class="im_mmtool" id="im_mmtool_zoomsel"	onClick="javascript:im_mm_zoomToAoi()"><img src="/intermap/images/zoomsel.png" title="{/root/gui/strings/imZoomToLayer}"/></td> -->
									<td class="im_mmtool" id="im_mmtool_aoi"		onClick="javascript:im_mm_setTool('aoi')"><img src="/intermap/images/im_aoi16x16.png" title="{/root/gui/strings/imAreaInterest}"/></td> 
								</tr>
							</table>
						</td>
						<td id="im_mm_mapContainer" style="position:relative;width:202px;height:102px;" >
							<div id="im_mm_map" style="position: absolute;width:200px;height:100px;overflow: hidden;">
								<img id="im_mm_image" width="200px" height="100px" src="/intermap/images/map0.jpg"/>
								<div id="im_mm_aoibox_n" style="left:0px;top:0px;width:0px;height:0px;position:absolute;border-top: 1px dashed #f00;visibility: visible;overflow: hidden;z-index: 3000">.</div>
								<div id="im_mm_aoibox_e" style="left:0px;top:0px;width:0px;height:0px;position:absolute;border-right: 1px dashed #f00;visibility: visible;overflow: hidden;z-index: 3000">.</div>
								<div id="im_mm_aoibox_s" style="left:0px;top:0px;width:0px;height:0px;position:absolute;border-bottom: 1px dashed #f00;visibility: visible;overflow: hidden;z-index: 3000">.</div>
								<div id="im_mm_aoibox_w" style="left:0px;top:0px;width: 0px;height:0px;position:absolute;border-left: 1px dashed #f00;visibility: visible;overflow: hidden;z-index: 3000">.</div>
							</div>
							<div id="im_mm_image_waitdiv" style="position: relative; z-index:999; left:59px; top:45px;">
								<img id="im_mm_waitimage" style="position: absolute; z-index:1000;" src="/intermap/images/waiting.gif" />
							</div>
						</td>
						<td width="52px" style="padding-top: 25px; align: center;">
							<small><xsl:value-of select="/root/gui/strings/longMax"/></small>
							<br />
							<input type="text" class="content" id="eastBL" name="eastBL" size="5"
								value="{/root/gui/searchDefaults/eastBL}" onChange="javascript:AoIrefresh();"
								alt="{/root/gui/strings/longitude}" title="{/root/gui/strings/longitude}"/>
						</td>
					</tr>
					<tr>
						<td />
						<td colspan="2" align="center" style="padding: 3px;">
							<small><xsl:value-of select="/root/gui/strings/latMin"/></small> <input type="text" class="content" id="southBL" name="southBL" size="5"
								value="{/root/gui/searchDefaults/southBL}" onChange="javascript:AoIrefresh();"
								alt="{/root/gui/strings/latitude}" title="{/root/gui/strings/latitude}"/>
						</td>
						<td>
							<img src="/intermap/images/update.png" id="updateBB" name="updateBB" style="visibility:hidden;border:2px solid red;" title="Update Area Of Interest" onClick="javascript:updateAoIFromForm();"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<th class="padded" colspan="2" nowrap="nowrap">
				<xsl:value-of select="/root/gui/strings/type"/>
			</th>
			<td class="padded" align="right">
				<select class="content" name="relation" id="relation">
					<xsl:for-each select="/root/gui/strings/boundingRelation">
						<option value="{@value}">
							<xsl:if
								test="@value=/root/gui/searchDefaults/relation">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:value-of select="."/>
						</option>
					</xsl:for-each>
				</select>
			</td>
		</tr>
		<tr>
			<!-- regions combobox -->	
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/region"/>
			</th>
			<td class="padded" colspan="2" align="right">
				<select class="content" name="region" id="region" onchange="javascript:doRegionSearch();">
					<option value="">
						<xsl:if test="/root/gui/searchDefaults/theme='_any_'">
							<xsl:attribute name="selected"/>
						</xsl:if>
						<xsl:value-of select="/root/gui/strings/any"/>
					</option>
					<option value="userdefined">
						<xsl:if test="/root/gui/searchDefaults/theme='_userdefined_'">
							<xsl:attribute name="selected"/>
						</xsl:if>
						<xsl:value-of select="/root/gui/strings/userDefined"/>
					</option>
					
					<xsl:for-each select="/root/gui/regions/record">
						<xsl:sort select="label/child::*[name() = $lang]" order="ascending"/>
						<option value="{id}">
							<xsl:if test="id=/root/gui/searchDefaults/region">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:attribute name="value">
									<xsl:value-of select="id"/>
							</xsl:attribute>
							<xsl:value-of select="label/child::*[name() = $lang]"/>
						</option>
					</xsl:for-each>
				</select>			
			</td>
		</tr>
	</table>
	
</xsl:template>

	<!-- ============================================================ 
		WHEN
	============================================================= -->

<xsl:template name="adv_when">

	<h1><xsl:value-of select="/root/gui/strings/when"/></h1>

	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<input onclick="setDates(0);" value="" name="radfrom" id="radfrom0" type="radio">
					<xsl:if test="string(/root/gui/searchDefaults/dateFrom)='' and string(/root/gui/searchDefaults/dateTo)=''
							and string(/root/gui/searchDefaults/extFrom)='' and string(/root/gui/searchDefaults/extTo)=''">
						<xsl:attribute name="checked" />
 					</xsl:if>
					<label for="radfrom0"><xsl:value-of select="/root/gui/strings/anytime"/></label>
				</input>
			</td>
		</tr>

		<tr>
			<td colspan="2">
				<input value="" name="radfrom" id="radfrom1" type="radio" disabled="disabled">
					<xsl:if test="string(/root/gui/searchDefaults/dateFrom)!='' and string(/root/gui/searchDefaults/dateTo)!=''">
						<xsl:attribute name="checked" />
					</xsl:if>
					<label for="radfrom1"><xsl:value-of select="/root/gui/strings/changeDate"/></label>
				</input>
			</td>
		</tr>
		
		<tr>		
			<td align="left" nowrap="nowrap">
				<xsl:value-of select="/root/gui/strings/from"/>
				<input style="width: 90px;" readonly="1" id="dateFrom" value="{/root/gui/searchDefaults/dateFrom}" name="dateFrom" class="inpBnds" type="text"
					onchange="JavaScript:$('extFrom').value ='';$('extTo').value ='';
							  $('radfrom1').checked=true;$('radfrom1').disabled='';$('radfromext1').disabled='disabled';"/>
				<img title="{/root/gui/strings/fromDateSelector}" style="cursor: pointer; margin-bottom: 6px; margin-right:10px;" id="from_trigger_c" 
					src="{/root/gui/url}/scripts/calendar/img.gif" alt="{/root/gui/strings/fromDateSelector}" align="middle" hspace="1"/>
						
				<xsl:value-of select="/root/gui/strings/to"/>
				<input style="width: 90px;" readonly="1" id="dateTo" value="{/root/gui/searchDefaults/dateTo}" name="dateTo" class="inpBnds" type="text"
					onchange="JavaScript:$('extFrom').value ='';$('extTo').value ='';
							  $('radfrom1').checked=true;$('radfrom1').disabled='';$('radfromext1').disabled='disabled';" />
				<img title="{/root/gui/strings/toDateSelector}" style="cursor: pointer; margin-bottom: 6px;" id="to_trigger_c" 
					src="{/root/gui/url}/scripts/calendar/img.gif" alt="{/root/gui/strings/toDateSelector}" align="middle" hspace="1"/>
					
<!--				<div onclick="JavaScript:$('dateFrom').value ='';$('dateTo').value ='';" style="cursor: pointer;"><xsl:value-of select="/root/gui/strings/clear"/></div> -->
				<img title="{/root/gui/strings/clear}" style="cursor: pointer; margin-bottom: 6px;" id="clearDates" 
					src="{/root/gui/url}/images/clear_left.png" alt="{/root/gui/strings/clear}" align="middle" 
					hspace="1" onclick="JavaScript:$('dateFrom').value ='';$('dateTo').value ='';"/> <!-- $('radfrom0').checked=true;$('radfrom1').disabled='disabled';$('radfromext1').disabled='disabled';"/> -->
			</td>
		</tr>
	</table>

	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<input value="" name="radfrom" id="radfromext1" type="radio" disabled="disabled">
					<xsl:if test="string(/root/gui/searchDefaults/extFrom)!='' and string(/root/gui/searchDefaults/extTo)!=''">
						<xsl:attribute name="checked" />
					</xsl:if>
					<label for="radfromext1"><xsl:value-of select="/root/gui/strings/datasetIssued"/></label>
				</input>
			</td>
		</tr>
		
		<tr>
			<td align="left" nowrap="nowrap">
				<xsl:value-of select="/root/gui/strings/from"/>
				<input style="width: 90px;" readonly="1" id="extFrom" value="{/root/gui/searchDefaults/extFrom}" name="extFrom" class="inpBnds" type="text"
					onchange="JavaScript:$('dateFrom').value ='';$('dateTo').value ='';
							  $('radfromext1').checked=true;$('radfromext1').disabled='';$('radfrom1').disabled='disabled';"/>
				<img title="{/root/gui/strings/fromDateSelector}" style="cursor: pointer; margin-bottom: 6px; margin-right:10px;" id="extfrom_trigger_c" 
					src="{/root/gui/url}/scripts/calendar/img.gif" alt="{/root/gui/strings/fromDateSelector}" align="middle" hspace="1"/>
						
				<xsl:value-of select="/root/gui/strings/to"/>
				<input  style="width: 90px;" readonly="1" id="extTo" value="{/root/gui/searchDefaults/extTo}" name="extTo" class="inpBnds" type="text"
					onchange="JavaScript:$('dateFrom').value ='';$('dateTo').value ='';
							  $('radfromext1').checked=true;$('radfromext1').disabled='';$('radfrom1').disabled='disabled';" />
				<img title="{/root/gui/strings/toDateSelector}" style="cursor: pointer; margin-bottom: 6px;" id="extto_trigger_c" 
					src="{/root/gui/url}/scripts/calendar/img.gif" alt="{/root/gui/strings/toDateSelector}" align="middle" hspace="1"/>
													
				<img title="{/root/gui/strings/clear}" style="cursor: pointer; margin-bottom: 6px;" id="clearDates" 
					src="{/root/gui/url}/images/clear_left.png" alt="{/root/gui/strings/clear}" align="middle" 
					hspace="1" onclick="JavaScript:$('extFrom').value ='';$('extTo').value ='';"/> <!-- $('radfrom0').checked=true;$('radfromext1').disabled='disabled';$('radfrom1').disabled='disabled';"/> -->
			</td>
		</tr>
	</table>

	<!-- restrict to - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
	
<!--	<fieldset>
		<legend><xsl:value-of select="/root/gui/strings/restrictTo"/></legend> -->

	<a onclick="showFields('restrictions.img','restrictions.table')" style="cursor:pointer;cursor:hand;">
		<img id="restrictions.img" src="{/root/gui/url}/images/plus.gif"/>
		<xsl:text> </xsl:text>	
		<xsl:value-of select="/root/gui/strings/restrictTo"/>
	</a>

	<table id="restrictions.table" style="display:none;border-color:#2a628f;border-style:solid;border-width:1px;">

		<!-- Source -->
		<tr>
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/porCatInfoTab"/>
			</th>
			<td class="padded">
				<select class="content" name="siteId" id="siteId">
					<option value="">
						<xsl:if test="/root/gui/searchDefaults/siteId=''">
							<xsl:attribute name="selected"/>
						</xsl:if>
						<xsl:value-of select="/root/gui/strings/any"/>
					</option>
					<xsl:for-each select="/root/gui/sources/record">
						<!--
							<xsl:sort order="ascending" select="name"/>
						-->
						<xsl:variable name="source" select="siteid/text()"/>
						<xsl:variable name="sourceName" select="name/text()"/>
						<option value="{$source}">
							<xsl:if test="$source=/root/gui/searchDefaults/siteId">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:value-of select="$sourceName"/>
						</option>
					</xsl:for-each>
				</select>
			</td>
		</tr>

		<!-- Group -->		
		<xsl:if	test="string(/root/gui/session/userId)!=''">
		<tr>		
			<th class="padded">
				<xsl:value-of select="/root/gui/strings/group"/>
			</th>
			<td class="padded">
				<select class="content" name="group" id="group">
					<option value="">
						<xsl:if test="/root/gui/searchDefaults/group=''">
							<xsl:attribute name="selected"/>
						</xsl:if>
						<xsl:value-of select="/root/gui/strings/any"/>
					</option>
					<xsl:for-each select="/root/gui/groups/record">
						<xsl:sort order="ascending" select="name"/>
						<option value="{id}">
							<xsl:if test="id=/root/gui/searchDefaults/group">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:value-of select="name"/>
						</option>
					</xsl:for-each>
				</select>
			</td>		
		</tr>
		</xsl:if>
		
		<!-- Template -->
		<xsl:if test="string(/root/gui/session/userId)!='' and /root/gui/services/service[@name='metadata.edit']">
			<tr>
				<th class="padded">
					<xsl:value-of select="/root/gui/strings/kind"/>
				</th>
				<td>
					<select class="content" id="template" name="template" size="1">
						<option value="n">
							<xsl:if test="/root/gui/searchDefaults/template='n'">
								<xsl:attribute name="selected">true</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="/root/gui/strings/metadata"/>
						</option>
						<option value="y">
							<xsl:if test="/root/gui/searchDefaults/template='y'">
								<xsl:attribute name="selected">true</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="/root/gui/strings/template"/>
						</option>
						<!-- <option value="s">
							<xsl:if test="/root/gui/searchDefaults/template='s'">
								<xsl:attribute name="selected">true</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="/root/gui/strings/subtemplate"/>
						</option> -->
					</select>
				</td>
			</tr>
		</xsl:if>
		
		<!-- Category -->
		<xsl:if test="/root/gui/config/category/admin">
			<tr>
				<th class="padded">
					<xsl:value-of select="/root/gui/strings/category"/>
				</th>
				<td class="padded">
					<select class="content" name="category" id="category">
						<option value="">
							<xsl:if test="/root/gui/searchDefaults/category=''">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:value-of select="/root/gui/strings/any"/>
						</option>
						
						<xsl:for-each select="/root/gui/categories/record">
							<xsl:sort select="label/child::*[name() = $lang]" order="ascending"/>
							
							<option value="{name}">
								<xsl:if test="name = /root/gui/searchDefaults/category">
									<xsl:attribute name="selected"/>
								</xsl:if>
								<xsl:value-of select="label/child::*[name() = $lang]"/>
							</option>
						</xsl:for-each>
					</select>
				</td>
			</tr>
		</xsl:if>
		
	</table>
<!--	</fieldset> -->

	<!-- now make sure we open expanded if any restrictions are selected -->
	<xsl:if test="/root/gui/searchDefaults/siteId!='' or
				  /root/gui/searchDefaults/groups/group!='' or
				  /root/gui/searchDefaults/ownergroups='on' or
	              /root/gui/searchDefaults/owner='on' or
	              /root/gui/searchDefaults/notgroups='on' or
 				  ( /root/gui/searchDefaults/template!='' and /root/gui/searchDefaults/template!='n' ) or
				  /root/gui/searchDefaults/category!=''">
		<script type="text/javascript">
			showFields('restrictions.img','restrictions.table');
		</script>
	</xsl:if>

	<!-- options - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
	
<!--	<fieldset>
		<legend><xsl:value-of select="/root/gui/strings/options"/></legend> -->

	<br/>
	<a onclick="showFields('advoptions.img','advoptions.table')" style="cursor:pointer;cursor:hand;">
		<img id="advoptions.img" src="{/root/gui/url}/images/plus.gif"/>
		<xsl:text> </xsl:text>	
		<xsl:value-of select="/root/gui/strings/options"/>
	</a>

		<table id="advoptions.table" style="display:none;border-color:#2a628f;border-style:solid;border-width:1px;">
			<!-- sort by - - - - - - - - - - - - - - - - - - - - -->
			
			<tr>
				<th class="padded">
					<xsl:value-of select="/root/gui/strings/sortBy"/>
				</th>
				<td class="padded">
                    <select id="sortBy" size="1" class="content" 
                     onChange="if (this.options[this.selectedIndex].value=='title') $('sortOrder').value = 'reverse'; else $('sortOrder').value = ''">
       				    <xsl:for-each select="/root/gui/strings/sortByType">
							<option value="{@id}">
								<xsl:if test="@id = /root/gui/searchDefaults/sortBy">
									<xsl:attribute name="selected"/>
								</xsl:if>
								<xsl:value-of select="."/>
							</option>
						</xsl:for-each>
					</select>
                    <input type="hidden" name="sortOrder" id="sortOrder"/>
				</td>
			</tr>
							
			<!-- hits per page - - - - - - - - - - - - - - - - - - -->
			<tr>
				<th class="padded">
					<xsl:value-of select="/root/gui/strings/hitsPerPage"/>
				</th>
				<td class="padded">
					<select class="content" id="hitsPerPage" name="hitsPerPage"> <!-- onchange="profileSelected()" -->
						<xsl:for-each select="/root/gui/strings/hitsPerPageChoice">
							<option>
								<xsl:if
									test="string(@value)=string(/root/gui/searchDefaults/hitsPerPage)">
									<xsl:attribute name="selected"/>
								</xsl:if>
								<xsl:attribute name="value">
									<xsl:value-of select="@value"/>
								</xsl:attribute>
								<xsl:value-of select="."/>
							</option>
						</xsl:for-each>
					</select>
				</td>
			</tr>
			
			<!-- output - - - - - - - - - - - - - - - - - - - - - - -->
			
			<tr>
				<th class="padded">
					<xsl:value-of select="/root/gui/strings/output"/>
				</th>
				<td class="padded">
					<select id="output" size="1" class="content">
						<xsl:for-each select="/root/gui/strings/outputType">
							<option value="{@id}">
								<xsl:if test="@id = /root/gui/searchDefaults/output">
									<xsl:attribute name="selected"/>
								</xsl:if>
								<xsl:value-of select="."/>
							</option>
						</xsl:for-each>
					</select>
				</td>
			</tr>
		</table>
<!--	</fieldset> -->
		<!-- now make sure we open expanded if any options are selected -->
		<xsl:if test="/root/gui/searchDefaults/sortBy!='relevance' or
	  	              /root/gui/searchDefaults/hitsPerPage!='10' or
					  /root/gui/searchDefaults/output!='full'">
			<script type="text/javascript">
				showFields('advoptions.img','advoptions.fieldset');
			</script>
		</xsl:if>
</xsl:template>
	

</xsl:stylesheet>