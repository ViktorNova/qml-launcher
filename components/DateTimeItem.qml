import QtQuick 1.1

Item {

	property string currentDateAndTime: ""

	signal checkState()

	function updateTime() {
		var dateAndTime = new Date();
		var timeString = Qt.formatDateTime(dateAndTime, "dddd, yyyy-MM-dd | hh:mm")
		currentDateAndTime = timeString;
	}

	Timer {
		interval: 2000
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: {
			updateTime()
			checkState()
		}
	}
}
