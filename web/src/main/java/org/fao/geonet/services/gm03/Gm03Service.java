package org.fao.geonet.services.gm03;

import org.xml.sax.SAXException;

import javax.xml.transform.TransformerConfigurationException;
import java.io.File;

public class Gm03Service extends Gm03BaseService {
    protected ISO19139CHEtoGM03Base createConverter(File xsdFile) throws SAXException, TransformerConfigurationException {
        return new ISO19139CHEtoGM03(xsdFile, xsl.getAbsolutePath());
    }
}
