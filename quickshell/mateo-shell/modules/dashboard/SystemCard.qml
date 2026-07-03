import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../../config"

DashboardCard {
    id: root
    title: "System"

    readonly property string wmName: "Niri"
    property string osName: "Unknown OS"
    property string userName: "user"
    property string uptimeText: "—"

    FileView {
        id: osRelease
        path: "/etc/os-release"
        onLoaded: {
            const m = text().match(/^PRETTY_NAME="?([^"\n]+)"?/m);
            if (m) root.osName = m[1];
        }
    }

    FileView {
        id: uptimeFile
        path: "/proc/uptime"
        onLoaded: root._parseUptime(text())
    }

    Process {
        id: whoamiProc
        command: ["whoami"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.userName = text.trim()
        }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: uptimeFile.reload()
    }

    function _parseUptime(content) {
        const seconds = Math.floor(parseFloat(content.split(" ")[0]));
        const h = Math.floor(seconds / 3600);
        const m = Math.floor((seconds % 3600) / 60);
        uptimeText = h + "h " + m + "m";
    }

    Column {
        width: parent.width
        spacing: 6

        Repeater {
            model: [
                { label: "OS", value: root.osName },
                { label: "WM", value: root.wmName },
                { label: "USER", value: root.userName },
                { label: "UPTIME", value: root.uptimeText }
            ]
            delegate: RowLayout {
                required property var modelData
                width: parent.width
                spacing: 8

                Text {
                    text: modelData.label
                    color: Theme.textSecondary
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.fontSizeSmall
                    Layout.preferredWidth: 60
                }
                Text {
                    text: modelData.value
                    color: Theme.textPrimary
                    font.family: Theme.fontFamily
                    font.pixelSize: Theme.fontSizeSmall
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                }
            }
        }

        Item { width: 1; height: 6 }

        Row {
            spacing: 10

            Repeater {
                model: [
                    { icon: "⏻", cmd: ["systemctl", "poweroff"] },
                    { icon: "⟲", cmd: ["systemctl", "reboot"] },
                    { icon: "⎋", cmd: ["sh", "-c", "loginctl terminate-user $USER"] },
                    { icon: "⚿", cmd: ["sh", "-c", "loginctl lock-session"] }
                ]
                delegate: Rectangle {
                    id: sessionBtn
                    required property var modelData
                    width: 34
                    height: 34
                    radius: Theme.radiusSmall
                    color: hoverArea.containsMouse ? Theme.surfaceVariant : Theme.surface
                    border.width: 1
                    border.color: Theme.outline

                    Behavior on color { ColorAnimation { duration: 120 } }

                    Text {
                        anchors.centerIn: parent
                        text: sessionBtn.modelData.icon
                        color: Theme.textPrimary
                        font.pixelSize: 15
                    }

                    MouseArea {
                        id: hoverArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: Quickshell.execDetached(sessionBtn.modelData.cmd)
                    }
                }
            }
        }
    }
}
