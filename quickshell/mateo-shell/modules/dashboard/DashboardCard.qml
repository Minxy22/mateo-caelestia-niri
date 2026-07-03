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

    layer.enabled: true
    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowColor: "#26000000"
        shadowBlur: 0.4
        shadowVerticalOffset: 2
    }

    Column {
        id: contentColumn
        anchors.fill: parent
        anchors.margins: 14
        spacing: 8

        Text {
            visible: root.title.length > 0
            text: root.title
            color: Theme.textSecondary
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeSmall
            font.bold: true
        }
    }
}
