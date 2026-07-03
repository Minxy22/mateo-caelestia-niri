import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import "../../config"
import "../../services"
import "../performance"

PanelWindow {
    id: dashboardWindow
    screen: modelData

    anchors { top: true; left: true; right: true }

    implicitHeight: 480
    exclusiveZone: 0
    color: "transparent"

    visible: ShellState.dashboardOpen

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

            Loader {
                Layout.fillWidth: true
                Layout.fillHeight: true
                sourceComponent: {
                    switch (ShellState.activeTab) {
                        case "Dashboard":   return dashboardPageComponent;
                        case "Performance": return performancePageComponent;
                        default:            return null;
                    }
                }
            }
        }
    }

    Component {
        id: dashboardPageComponent
        DashboardPage {}
    }

    Component {
        id: performancePageComponent
        PerformancePage {}
    }
}
