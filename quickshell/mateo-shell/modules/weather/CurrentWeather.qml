import QtQuick
import QtQuick.Layouts
import "../../config"

Column {
    id: root
    spacing: 12

    property string city: "Quito"
    property string temperature: "18°C"
    property string condition: "Cloudy"

    RowLayout {
        width: parent.width

        ColumnLayout {
            spacing: 2

            Text {
                text: root.city
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
            }

            Text {
                text: root.temperature
                color: Theme.textPrimary
                font.family: Theme.fontFamily
                font.pixelSize: 40
                font.bold: true
            }

            Text {
                text: root.condition
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeNormal
            }
        }

        Item { Layout.fillWidth: true }

        // Large weather icon placeholder — monochrome, no image asset
        Rectangle {
            width: 88
            height: 88
            radius: Theme.radiusMedium
            color: Theme.surfaceVariant
            border.width: 1
            border.color: Theme.outline

            Text {
                anchors.centerIn: parent
                text: "☁"
                color: Theme.textSecondary
                font.pixelSize: 44
            }
        }
    }
}
