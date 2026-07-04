import QtQuick
import QtQuick.Layouts
import "../../config"
import "components"

Item {
    id: root

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

        Item { Layout.fillHeight: true }

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
