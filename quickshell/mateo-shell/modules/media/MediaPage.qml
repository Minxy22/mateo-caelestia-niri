import QtQuick
import QtQuick.Layouts
import "../../config"

MediaCard {
    anchors.fill: parent

    RowLayout {
        width: parent.width
        spacing: 16

        AlbumArt { size: 96 }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4

            Text {
                text: "Resonance"
                color: Theme.textPrimary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeNormal
                font.bold: true
            }

            Text {
                text: "HOME"
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
            }
        }
    }

    ColumnLayout {
        width: parent.width
        spacing: 6

        Rectangle {
            Layout.fillWidth: true
            height: 6
            radius: 3
            color: Theme.surfaceVariant

            Rectangle {
                // 2:14 / 4:03 → 134s / 243s ≈ 55%, static placeholder ratio
                width: parent.width * 0.55
                height: parent.height
                radius: 3
                color: Theme.accent
            }
        }

        RowLayout {
            width: parent.width

            Text {
                text: "2:14"
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
            }

            Item { Layout.fillWidth: true }

            Text {
                text: "4:03"
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
            }
        }
    }

    PlaybackControls {
        Layout.alignment: Qt.AlignHCenter
    }
}
