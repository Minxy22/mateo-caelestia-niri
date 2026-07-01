import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import "../../config"

PanelWindow {
    id: sidebar
    screen: modelData   // injected by the Variants{} in shell.qml

    anchors { left: true; top: true; bottom: true }

    margins {
        left: Theme.barMargin
        top: Theme.barMargin
        bottom: Theme.barMargin
    }

    implicitWidth: 56
    exclusiveZone: implicitWidth + Theme.barMargin
    color: "transparent"

    Rectangle {
        id: background
        anchors.fill: parent
        radius: Theme.radiusLarge
        color: Theme.surface
        opacity: 0.94
        border.width: 1
        border.color: Theme.outline

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: "#33000000"
            shadowBlur: 0.5
            shadowVerticalOffset: 3
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 14

            SidebarButton {
                Layout.alignment: Qt.AlignHCenter
                iconText: "⊞"
                onClicked: Quickshell.execDetached(["fuzzel"])
            }

            WorkspaceIndicator {
                Layout.alignment: Qt.AlignHCenter
            }

            // Spacer — pushes the shortcut group to the bottom, dock-style
            Item { Layout.fillHeight: true }

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 10

                SidebarButton {
                    iconText: "♪"
                    onClicked: Quickshell.execDetached(["sh", "-c", "playerctl play-pause"])
                }
                SidebarButton {
                    iconText: "▢"
                    onClicked: Quickshell.execDetached(["sh", "-c", "swww img $(find ~/Pictures/Wallpapers -type f | shuf -n1)"])
                }
                SidebarButton {
                    iconText: "⚙"
                    onClicked: Quickshell.execDetached(["sh", "-c", "your-settings-app"])
                }
            }
        }
    }
}
