import QtQuick
import Quickshell.Widgets
import "../../../config"
import "../../../services"

Rectangle {
    id: root

    readonly property var favorites: [
        { icon: "spotify", exec: "spotify" },
        { icon: "discord", exec: "discord" },
        { icon: "firefox", exec: "firefox" },
        { icon: "utilities-terminal", exec: "kitty" }
    ]

    width: 42
    height: column.implicitHeight + 12
    radius: Theme.radiusMedium
    color: Theme.background
    border.width: 1
    border.color: Theme.outline

    Column {
        id: column
        anchors.centerIn: parent
        spacing: 10

        Repeater {
            model: root.favorites
            delegate: Item {
                id: entry
                required property var modelData

                width: 26
                height: 26
                scale: hoverArea.containsMouse ? 1.08 : 1.0

                Behavior on scale { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }

                IconImage {
                    anchors.fill: parent
                    source: Quickshell.iconPath(entry.modelData.icon, "application-x-executable")
                }

                MouseArea {
                    id: hoverArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: AppLauncherService.launch(entry.modelData.exec)
                }
            }
        }
    }
}
