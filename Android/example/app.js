
var timer =  require('ti.mely').createTimer();
	
// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'#fff'
});

var how2Label = Ti.UI.createLabel({
	text:"Enter Duration in milliseconds",
	top:20, left:7, right:7, height:20,color:"#000"
});
win.add(how2Label);

var durationText = Ti.UI.createTextField({
	value:1000, top:50, left:7, right:7, height:40, color:"#000"	
});
win.add(durationText);

var counterLabel = Ti.UI.createLabel({
	top:100, width:Ti.UI.FILL, height:40,left:7, right:7,color:"#000"
});
win.add(counterLabel);

function showUpdate(d){
	var msg = "interval changed - interval set to " + d.interval + " interval count = " + d.intervalCount;
	Ti.API.info(msg);
	counterLabel.text = "Updated " + d.intervalCount  + " times.";
};

var startButton = Ti.UI.createButton({
	title:"Start", top:200, left:7, height:40, width:125
});		
win.add(startButton);

startButton.addEventListener('click',function(e){
	counterLabel.text ="Starting Timer";
	timer.addEventListener('onIntervalChange',showUpdate);
	timer.start({
		interval:durationText.value,
		debug:true
	});
});

var stopButton = Ti.UI.createButton({
	title:"Stop", top:200,
	right:7, height:40, width:125
});		
win.add(stopButton);

stopButton.addEventListener('click',function(e){
	timer.stop();
	timer.removeEventListener('onIntervalChange',showUpdate);
	counterLabel.text ="Press the Start button to test again";
});

win.open();
