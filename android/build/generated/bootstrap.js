/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 *
 * Warning: This file is GENERATED, and should not be modified
 */
var bootstrap = kroll.NativeModule.require("bootstrap"),
	invoker = kroll.NativeModule.require("invoker"),
	Titanium = kroll.binding("Titanium").Titanium;

function moduleBootstrap(moduleBinding) {
	function lazyGet(object, binding, name, namespace) {
		return bootstrap.lazyGet(object, binding,
			name, namespace, moduleBinding.getBinding);
	}

	var module = moduleBinding.getBinding("ti.mely.TimelyModule")["Timely"];
	var invocationAPIs = module.invocationAPIs = [];
	module.apiName = "Timely";

	function addInvocationAPI(module, moduleNamespace, namespace, api) {
		invocationAPIs.push({ namespace: namespace, api: api });
	}

		addInvocationAPI(module, "Timely", "Timely", "createExample");
	addInvocationAPI(module, "Timely", "Timely", "createTimer");

			if (!("__propertiesDefined__" in module)) {		
		Object.defineProperties(module, {
			"Timer": {
				get: function() {
					var Timer = lazyGet(this, "ti.mely.TimerProxy", "Timer", "Timer");
					return Timer;
				},
				configurable: true
			},
			"Example": {
				get: function() {
					var Example = lazyGet(this, "ti.mely.ExampleProxy", "Example", "Example");
					return Example;
				},
				configurable: true
			},
		
		});
		module.constructor.prototype.createExample = function() {
			return new module.Example(arguments);
		}
		module.constructor.prototype.createTimer = function() {
			return new module.Timer(arguments);
		}
		}
		module.__propertiesDefined__ = true;
		return module;

}
exports.bootstrap = moduleBootstrap;
