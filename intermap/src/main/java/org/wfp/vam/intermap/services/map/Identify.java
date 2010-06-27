//=============================================================================
//===	Copyright (C) 2001-2007 Food and Agriculture Organization of the
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
//===	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
//===
//===	Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
//===	Rome - Italy. email: geonetwork@osgeo.org
//==============================================================================

package org.wfp.vam.intermap.services.map;

import jeeves.interfaces.Service;
import jeeves.server.ServiceConfig;
import jeeves.server.context.ServiceContext;
import org.jdom.Element;
import org.wfp.vam.intermap.Constants;
import org.wfp.vam.intermap.kernel.map.MapMerger;
import org.wfp.vam.intermap.kernel.map.mapServices.BoundingBox;
import org.wfp.vam.intermap.kernel.map.mapServices.MapService;
import org.wfp.vam.intermap.util.Util;

//=============================================================================

/** main.result service. shows search results
  */

public class Identify implements Service
{
	public void init(String appPath, ServiceConfig config) throws Exception {}

	//--------------------------------------------------------------------------
	//---
	//--- Service
	//---
	//--------------------------------------------------------------------------

	public Element exec(Element params, ServiceContext context) throws Exception
	{
		// Get request parameters
		String activeLayer = params.getChildText("activeLayer");
		int x = Integer.parseInt(params.getChildText("mapimgx"));
		int y = Integer.parseInt(params.getChildText("mapimgy"));
		int width  = Integer.parseInt(params.getChildText("width"));
		int height = Integer.parseInt(params.getChildText("height"));
		BoundingBox bb = Util.parseBoundingBox(params); // search bb in params

		String responseFormat = params.getChildText(Constants.IDENTIFY_FORMAT);

		// Get the MapMerger object from the user session
		MapMerger mm = MapUtil.getMapMerger(context);
		mm.setBoundingBox(bb);

		if ("".equals(activeLayer)) return null;

		int service = Integer.parseInt(activeLayer);
		MapService ms = mm.getService(service);
		ms.identify(0, x, y, width, height, Constants.PIXEL_TOLERANCE, responseFormat);
		return new Element("response").addContent(ms.toElement());
	}

}

//=============================================================================
