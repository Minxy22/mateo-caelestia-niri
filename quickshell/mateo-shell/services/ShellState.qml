pragma Singleton
import QtQuick

QtObject {
    id: root

    property bool dashboardOpen: false
    property string activeTab: "Dashboard"

    function toggleDashboard() {
        dashboardOpen = !dashboardOpen
    }

    function openDashboard() {
        dashboardOpen = true
    }

    function closeDashboard() {
        dashboardOpen = false
    }

    function setTab(name) {
        activeTab = name
    }
}
