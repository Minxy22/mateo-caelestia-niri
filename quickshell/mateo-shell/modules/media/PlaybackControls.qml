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
            { icon: "", isMain: true },   // filled below based on isPlaying
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
                    // prev/next intentionally do nothing yet — no backend wired
                }
            }
        }
    }
}
