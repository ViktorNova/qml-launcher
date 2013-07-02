import QtQuick 1.1

Rectangle {
	id: mainScreen
	property int m_index;

	/* background image */
	Image {
		id: background
		anchors.fill: parent
		source: "pics/screenelements/background.png"
	}

	Component {
		id: appDelegate
		Item {
			width: 80 ; height: 80 

			MouseArea {
				anchors.fill: parent
				//onClicked: grid.currentIndex = index
				onPressed: grid.currentIndex = index
				onReleased: grid.currentIndex = -1
			}
			Column {
				anchors.fill: parent
				Image { source: portrait; anchors.horizontalCenter: parent.horizontalCenter }
				Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
			}
		}
	}
	GridView {
		id: grid
        anchors { left: parent.left; right: parent.right; top: parent.top; topMargin: 80}
		width: 800; height: 400
		cellWidth: 200; cellHeight: 100
		highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
		focus: true
		delegate: appDelegate

		model: AppListModel {}
	}
}
