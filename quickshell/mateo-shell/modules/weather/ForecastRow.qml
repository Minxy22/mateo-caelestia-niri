import QtQuick
import QtQuick.Layouts
import "../../config"

RowLayout {
    id: root
    spacing: 10

    property var days: [
        { label: "Mon", temp: "19°" },
        { label: "Tue", temp: "20°" },
        { label: "Wed", temp: "18°" },
        { label: "Thu", temp: "21°" },
        { label: "Fri", temp: "22°" }
    ]

    Repeater {
        model: root.days
        delegate: Rectangle {
            id: dayCell
            required property var modelData

            Layout.fillWidth: true
            Layout.preferredHeight: 78
            radius: Theme.radiusSmall
            color: Theme.surfaceVariant
            border.width: 1
            border.color: Theme.outline

            Column {
                anchors.centerIn: parent
                spacing: 6

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: dayCell.modelData.label
                    color: Theme.textSecondary
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.fontSizeSmall
                    font.bold: true
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "☁"
                    color: Theme.textSecondary
                    font.pixelSize: 18
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: dayCell.modelData.temp
                    color: Theme.textPrimary
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.fontSizeSmall
                }
            }
        }
    }
}
