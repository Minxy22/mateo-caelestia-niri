import QtQuick

Text {
	color: "#202020"
	font.pixelSize: 16

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: {
			parent.text = Qt.formatDateTime(new Date(), "HH:mm")
		}
	}
	
	Component.onCompleted: text = Qt.formatDateTime(new Date(),"HH:mm")
}
