import QtQuick
import QtQuick.Effects
import "../../config"

Rectangle {
    id: root

    default property alias content: contentColumn.children
    property string title: ""

    radius: Theme.radiusMedium
    color: Theme.background
    border.width: 1
    border.color: Theme.outline

    scale: hoverArea.containsMouse ? 1.02 : 1.0
    Behavior on scale {
        NumberAnimation { duration: 150; easing.type: Easing.OutCubic }
    }

    layer.enabled: true
    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowColor: "#26000000"
