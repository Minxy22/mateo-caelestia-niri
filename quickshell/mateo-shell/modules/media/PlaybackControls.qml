import QtQuick
import QtQuick.Layouts
import "../../config"

Row {
    id: root
    spacing: 14

    property bool isPlaying: false

    Repeater {
        model: [
            { icon: "⏮", isMain: false },
            { icon: "", isMain: true },
            { icon: "⏭", isMain: false }
        ]
        delegate: Rectangle {
            id: btn
            required property var modelData
            required property int index

            width: modelData.isMain ? 44 : 36
            height: width
            radius: width / 2
            color: hoverArea.containsMouse ? Theme.surfaceVariant : Theme.background
            border.width: 1
            border.color: Theme.outline
            scale: hoverArea.containsMouse ? 1.08 : 1.0

            Behavior on color {
                ColorAnimation { duration: 120 }
            }
            Behavior on scale {
                NumberAnimation { duration: 120; easing.type: Easing.OutCubic }
            }

            Text {
                anchors.centerIn: parent
                text: btn.modelData.isMain ? (root.isPlaying ? "⏸" : "▶") : btn.modelData.icon
                color: Theme.textPrimary
                font.pixelSize: btn.modelData.isMain ? 16 : 14
            }

            MouseArea {
                id: hoverArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if (btn.modelData.isMain) {
                        root.isPlaying = !root.isPlaying;
                    }
                }
            }
        }
    }
}
