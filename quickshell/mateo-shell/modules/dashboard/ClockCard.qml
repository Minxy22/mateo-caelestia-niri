import QtQuick
import "../../config"

DashboardCard {
    id: root
    property var now: new Date()

    Column {
        width: parent.width
        spacing: 4

        Text {
            text: Qt.formatDateTime(root.now, "hh:mm")
            color: Theme.textPrimary
            font.family: Theme.fontFamily
            font.pixelSize: 64
            font.bold: true
        }

        Text {
            text: Qt.formatDateTime(root.now, "dddd • d MMMM")
            color: Theme.textSecondary
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeNormal
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }
}
