pragma Singleton
import QtQuick

Item {
    id: root

    property bool dashboardOpen: false
    property string activeTab: "Dashboard"

    property bool launcherOpen: false

    function toggleDashboard() { dashboardOpen = !dashboardOpen }
    function openDashboard() { dashboardOpen = true }
    function closeDashboard() { dashboardOpen = false }
    function setTab(name) { activeTab = name }

    function toggleLauncher() { launcherOpen = !launcherOpen }
    function openLauncher() { launcherOpen = true }
    function closeLauncher() { launcherOpen = false }
}
