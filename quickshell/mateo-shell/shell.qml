import Quickshell
import Quickshell.Widgets
import QtQuick

ShellRoot {

	PanelWindow {
		anchors.top: true
		implicitHeight: 40

		Rectangle{
			anchors.fill:parent
			color: "#222222"

			Text {
				anchors.centerIn: parent
				text: "Mateo Caelestia Niri"
				color: "white"
			}
		}
	}
}
