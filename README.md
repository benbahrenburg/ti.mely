<h1>Ti.mely</h1>

The Ti.mely project provides access to Android and iOS timers.

<h2>Before you start</h2>
* These are iOS and Android native modules designed to work with Titanium SDK 3.1.1.GA
* Before using this module you first need to install the package. If you need instructions on how to install a 3rd party module please read this installation guide.

<h2>Download the compiled release</h2>

Download the platform you wish to use:

* [iOS Dist](https://github.com/benbahrenburg/ti.mely/tree/master/iOS/dist)
* [Android Dist] (https://github.com/benbahrenburg/ti.mely/tree/master/Android/dist)

<h2>Building from source?</h2>

If you are building from source you will need to do the following:

Import the project into Xcode:

* Modify the titanium.xcconfig file with the path to your Titanium installation

Import the project into Eclipse:

* Update the .classpath
* Update the build properties

<h2>Setup</h2>

* Download the latest release from the releases folder ( or you can build it yourself )
* Install the ti.mely module. If you need help here is a "How To" [guide](https://wiki.appcelerator.org/display/guides2/Using+a+Module). 
* You can now use the module via the commonJS require method, example shown below.

<h2>Importing the module using require</h2>
<pre><code>
var timerMod = require('ti.mely');
</code></pre>

<h2>Working with the Timer Proxy</h2>
The timer proxy provides access to a native platform interval timer.  A new timer is created when you call the createTimer() factory object.

<b>Example</b>
<pre><code>

	var timer = timerMod.createTimer();

</code></pre>

<h3>start</h3>
The Timer Proxy start method is called to start the timer.  This method takes a dictionary with the following fields.

<b>Parameters</b>

<b>interval</b> : float

The interval in milliseconds for the timer to fire and trigger the EventListener.

<b>debug</b> : Boolean

The debug flat by default is false.  When set to true debug statements will be printed to the console window.

<b>Example</b>
<pre><code>

	var timer = timerMod.createTimer();
	
	timer.start({
		interval:2000,
		debug:true
	});

</code></pre>

<h3>stop</h3>
The stop method turns off the interval timer. It is important to remember that if you have a EventListener added to the module you will need to use the removeEventListener method to remove your listener before all memory can be released. 

<b>Parameters</b>

<b>None</b> 


<b>Example</b>
<pre><code>
	
	timer.stop();

</code></pre>

<h2>Events</h2>

<b>onIntervalChange</b>

This event is called after the interval timer is fired.  The below shows how to add the onIntervalChange.  Please note it is important to remember that if you have a EventListener added to the module you will need to use the removeEventListener method to remove your listener before all memory can be released. 

<b>Example</b>
<pre><code>

	var timer = require('ti.mely').createTimer();

	function showUpdate(d){
		var msg = "interval changed - interval set to " + d.interval + " interval count = " + d.intervalCount;
		Ti.API.info(msg);
	}

	timer.addEventListener('onIntervalChange',showUpdate);
	
	timer.start({
		interval:6000,
		debug:true
	});

</code></pre>


<h2>Learn More</h2>

<h3>Examples</h3>
Please check the module's example folder or 


* [iOS](https://github.com/benbahrenburg/ti.mely/tree/master/iOS/example) 
* [Android](https://github.com/benbahrenburg/ti.mely/tree/master/Android/example)

for samples on how to use this project.

<h3>Twitter</h3>

Please consider following the [@benCoding Twitter](http://www.twitter.com/benCoding) for updates 
and more about Titanium.

<h3>Blog</h3>

For module updates, Titanium tutorials and more please check out my blog at [benCoding.Com](http://benCoding.com).

<h3>Dependencies</h3>
On iOS, Ti.mely uses the [MSWeakTimer](https://github.com/mindsnacks/MSWeakTimer) project by [Javier Soto](https://github.com/mindsnacks).

<h2>License</h2>
Ti.mely is available under the MIT license.

Copyright © 2013 Benjamin Bahrenburg.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


