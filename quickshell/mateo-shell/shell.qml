import Quickshell
import QtQuick

ShellRoot {

	PanelWindow {
		anchors.top: true
		implicitWidth: 700
		implicitHeight: 50

		Rectangle{
			anchors.fill:parent

			radius: 16
			
			color: "#cc1e1e2e"

			Row {
				anchors.fill: parent
				anchors.margins: 15
				spacing: 20

				Text {
					text : "M"
					color: "white"
					font.pixelSize: 20
				}

				Item {
					width: 350
				}

				Text {
					text: "18:30"
					color: "white"
				}

				Text {
					text: "CPU 8%"
					color: "white"
				}

				Text {
					text: "RAM 23%"
					color: "white"
				}

				Text {
					text: "BAT 90%"
					color: "white"
				}
			}
		}
	}
}
