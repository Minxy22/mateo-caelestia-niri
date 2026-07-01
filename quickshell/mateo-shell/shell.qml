import Quickshell
import QtQuick
import "modules/bar"

ShellRoot {

	PanelWindow {
		anchors.top: true

		implicitWidth: 900
		implicitHeight: 55

		Rectangle{
			anchors.fill:parent

			radius: 20
			color: "#d9e0e0e0"

			Row {
				anchors.fill: parent
				anchors.margins: 12
				spacing: 20

				LauncherButton {}

				Workspaces {}

				Item {
					width: 500
				}

				Clock {}
			}
		}
	}
}
