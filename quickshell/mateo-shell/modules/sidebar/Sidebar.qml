import QtQuick
import QtQuick.Layouts
import "../../config"
import "components"

Item {
    id: root

    width: 72
    height: parent ? parent.height : 800

    Rectangle {
        anchors.fill: parent
        color: "#22ff0000"   // temporal para debug
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 10

        WorkspaceIsland {
            Layout.alignment: Qt.AlignHCenter
        }

        ContextIndicator {
            Layout.alignment: Qt.AlignHCenter
        }

        FavoriteApps {
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillHeight: true
        }

        ClockIsland {
            Layout.alignment: Qt.AlignHCenter
        }

        SystemToggleIsland {
            Layout.alignment: Qt.AlignHCenter
        }

        SidebarPowerButton {
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
