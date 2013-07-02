import QtQuick 1.1
import "components"

Item {
	id: desktop
	width: 800
	height: 480
	smooth: false
	property int titlebarHeight: 50

	MainScreen {
		id: mainScreen
		width: parent.width
		height: parent.height

		Titlebar {
			id: titlebar
			width: parent.width
			height: titlebarHeight
			anchors.top: parent.top
			titleBarText: "Smart Hydraulic Buffer Tester"
			dateAndTime: currentDateTime.currentDateAndTime
			onSettingModeChanged: settingMode ? desktop.state = "setting" : desktop.state = ""
		}
	}

	SettingScreen {
		id: settingScreen
		width: parent.width
		height: parent.height - titlebarHeight
		anchors.bottom: mainScreen.top
	}

	DateTimeItem {
		id: currentDateTime
	}

	/*
	 * The main screen has two states.
	 * - the default state
	 * - the "setting" state
	 * Animated state switching is done using QML transistions.
	 */
	states: [
		State {
			name: "setting"
			PropertyChanges {
				target: mainScreen
				y: desktop.height - titlebarHeight
			}
			PropertyChanges {
				target: titlebar
				titleBarText: "Setting"
			}
		}
	]

	/*
	 * Here the transistions are defined. A simple NumberAnimation is used to animate the "y"
	 * property of the mainScreen
	 */
	transitions: [
		Transition {
			from: "*"
			to: "setting"
			NumberAnimation {
				properties: "y"
				duration: 1000
				easing.type: Easing.OutBounce
			}
		}, 
		Transition {
			from: "setting"
			to: "*"
			NumberAnimation {
				properties: "y"
				duration: 1000
				easing.type: Easing.OutBounce
			}
		}
	]
}
