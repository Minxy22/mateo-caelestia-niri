import QtQuick
import "../../config"

Rectangle {
    id: root

    property int size: 96

    width: size
    height: size
    radius: Theme.radiusMedium
    color: Theme.surfaceVariant
    border.width: 1
    border.color: Theme.outline

    Text {
        anchors.centerIn: parent
        text: "♪"
        color: Theme.textSecondary
        font.pixelSize: root.size * 0.35
    }
}
