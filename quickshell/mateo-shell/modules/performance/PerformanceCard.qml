import QtQuick
import "../../config"

Item {
    id: root

    property string title: ""
    property string subtitle: ""
    property real percentage: 0   // static 0-100 for this step
    default property alias extraContent: extraColumn.children

    // Fake shadow: a soft, slightly offset rectangle behind the card body.
    // Rectangle-only, no MultiEffect/layer.effect — keeps this compatible
    // with any Quickshell/Qt version without extra module imports.
    Rectangle {
        anchors.fill: parent
        anchors.topMargin: 3
        radius: Theme.radiusMedium
        color: "#14000000"
    }

    Rectangle {
        id: card
        anchors.fill: parent
        radius: Theme.radiusMedium
        color: Theme.background
        border.width: 1
        border.color: Theme.outline

        Column {
            anchors.fill: parent
            anchors.margins: 14
            spacing: 10

            Text {
                text: root.title
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
                font.bold: true
            }

            Text {
                text: Math.round(root.percentage) + "%"
                color: Theme.textPrimary
                font.family: Theme.fontFamily
                font.pixelSize: 32
                font.bold: true
            }

            Text {
                visible: root.subtitle.length > 0
                text: root.subtitle
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
            }

            // Static usage bar — plain declarative binding, no driver behind it.
            Rectangle {
                width: parent.width
                height: 8
                radius: 4
                color: Theme.surfaceVariant

                Rectangle {
                    width: parent.width * (root.percentage / 100)
                    height: parent.height
                    radius: 4
                    color: Theme.accent
                }
            }

            Column {
                id: extraColumn
                width: parent.width
                spacing: 6
            }
        }
    }
}
