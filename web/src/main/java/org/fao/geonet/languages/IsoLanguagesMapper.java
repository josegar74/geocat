//===	Copyright (C) 2012 Food and Agriculture Organization of the
//===	United Nations (FAO-UN), United Nations World Food Programme (WFP)
//===	and United Nations Environment Programme (UNEP)
//===
//===	This program is free software; you can redistribute it and/or modify
//===	it under the terms of the GNU General Public License as published by
//===	the Free Software Foundation; either version 2 of the License, or (at
//===	your option) any later version.
//===
//===	This program is distributed in the hope that it will be useful, but
//===	WITHOUT ANY WARRANTY; without even the implied warranty of
//===	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
//===	General Public License for more details.
//===
//===	You should have received a copy of the GNU General Public License
//===	along with this program; if not, write to the Free Software
//===	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
//===
//===	Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
//===	Rome - Italy. email: GeoNetwork@fao.org
//==============================================================================
package org.fao.geonet.languages;


import jeeves.resources.dbms.Dbms;
import org.jdom.Element;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO javadoc.
 *
 * @author jose garcía
 */
public class IsoLanguagesMapper {

    private static IsoLanguagesMapper instance;

    /*
     * Stores mapping of ISO 639-1 to ISO 639-2 for all languages defined in IsoLanguages table
     */
    private final static Map<String, String> iso639_1_to_iso639_2IsoLanguagesMap =  new HashMap<String, String>();
    private final static Map<String, String> iso639_2_to_iso639_1IsoLanguagesMap =  new HashMap<String, String>();


    private IsoLanguagesMapper() {}

    /**
     * TODO javadoc.
     *
     * @return instance
     * @throws Exception hmm
     */
    public static synchronized IsoLanguagesMapper getInstance() throws Exception {
        if(instance == null) {
            instance = new IsoLanguagesMapper();
        }
        return instance;
    }

    /**
     * Helps ensure singleton-ness.
     *
     * @return nothing
     * @throws CloneNotSupportedException
     */
    @Override
    public Object clone() throws CloneNotSupportedException {
        throw new CloneNotSupportedException();
    }

    /**
     * Creates mapping to of ISO 639-1 to ISO 639-2 for all languages defined in IsoLanguages table
     *
     * @param dbms
     * @throws Exception hmm
     */
    public static void init(Dbms dbms) throws Exception {
        String query = "SELECT code, shortcode FROM IsoLanguages";
        List<Element> records = dbms.select(query).getChildren();
        for(Element record : records) {
            final String shortcode = record.getChildText("shortcode");
            final String code = record.getChildText("code");
            iso639_2_to_iso639_1IsoLanguagesMap.put(code, shortcode);
            if(!iso639_1_to_iso639_2IsoLanguagesMap.containsKey(shortcode))
                iso639_1_to_iso639_2IsoLanguagesMap.put(shortcode, code);
        }
    }


    /**
     * Retrieves 639-2 code from a 639-1 code
     *
     * @param iso639_1
     * @return
     */
    public String iso639_1_to_iso639_2(String iso639_1) {
        return iso639_1_to_iso639_2IsoLanguagesMap.get(iso639_1);
    }

    /**
     * Retrieves 639-1 code from a 639-2 code
     *
     * @param iso639_2
     * @return
     */
    public String iso639_2_to_iso639_1(String iso639_2) {
        return iso639_2_to_iso639_1IsoLanguagesMap.get(iso639_2);
    }

}