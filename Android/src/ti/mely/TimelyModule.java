/**
 * Ti.mely Titanium module
 * Copyright (c) 2013 by Benjamin Bahrenburg, All Rights Reserved.
 * Licensed under the terms of the MIT License
 * Please see the LICENSE included with this distribution for details.
 *
 * Available at https://github.com/benbahrenburg/ti.mely
 * 
 */
package ti.mely;

import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.annotations.Kroll;

import org.appcelerator.titanium.TiApplication;

@Kroll.module(name="Timely", id="ti.mely")
public class TimelyModule extends KrollModule
{

	// Standard Debugging variables
	public static final String MODULE_SHORT_NAME = "Timely";

	// You can define constants with @Kroll.constant, for example:
	// @Kroll.constant public static final String EXTERNAL_NAME = value;
	
	public TimelyModule()
	{
		super();
	}

	@Kroll.onAppCreate
	public static void onAppCreate(TiApplication app){}
	
}

