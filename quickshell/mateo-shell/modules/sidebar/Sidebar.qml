import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell

import "../../config"
import "components"

PanelWindow {
    id: sidebar

    screen: Quickshell.screens[0]

    anchors {
        left: true
        top: true
        bottom: true
    }

    margins {
        left: Theme.barMargin
        top: Theme.barMargin
        bottom: Theme.barMargin
    }

    implicitWidth: 72
    exclusiveZone: implicitWidth + Theme.barMargin
    color: "transparent"

    Rectangle {
        id: background

        anchors.fill: parent
        radius: Theme.radiusLarge
        color: Theme.surface
        opacity: 0.94

        border {
            width: 1
            color: Theme.outline
        }

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: "#33000000"
            shadowBlur: 0.5
            shadowVerticalOffset: 3
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 8
            spacing: 0

            WorkspaceIsland {
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.preferredHeight: 40
            }

            ContextIndicator {
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.preferredHeight: 20
            }

            FavoriteApps {
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.fillHeight: true
            }

            ClockIsland {
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.preferredHeight: 10
            }

            SystemToggleIsland {
                Layout.alignment: Qt.AlignHCenter
            }

            Item {
                Layout.preferredHeight: 10
            }

            SidebarPowerButton {
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
}
