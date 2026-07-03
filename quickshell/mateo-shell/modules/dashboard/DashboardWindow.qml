import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import "../../config"
import "../../services"

PanelWindow {
    id: dashboardWindow
    screen: Quickshell.screens[0]   // injected by the Variants{} in shell.qml

    // Layer-shell has no true "center" anchor, so the window spans the
    // full width transparently and the visible panel is centered inside it.
    anchors { top: true; left: true; right: true }

    implicitHeight: 480
    exclusiveZone: 0
    color: "transparent"

    visible: ShellState.dashboardOpen

    // Lets `niri msg action ...` bind a key to:
    //   quickshell -c mateo-shell ipc call dashboard toggle
    IpcHandler {
        target: "dashboard"
        function toggle() { ShellState.toggleDashboard() }
        function open() { ShellState.openDashboard() }
        function close() { ShellState.closeDashboard() }
    }

    Rectangle {
        id: panel
        width: 640
        height: 460
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.barMargin

        radius: Theme.radiusLarge
        color: Theme.surface
        opacity: 0.96
        border.width: 1
        border.color: Theme.outline

        layer.enabled: true
        layer.effect: MultiEffect {
            shadowEnabled: true
            shadowColor: "#33000000"
            shadowBlur: 0.5
            shadowVerticalOffset: 4
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 12

            DashboardTabs {
                Layout.alignment: Qt.AlignHCenter
            }

            // Content stub — Steps 3–6 fill this in per active tab.
            // Intentionally empty.
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
