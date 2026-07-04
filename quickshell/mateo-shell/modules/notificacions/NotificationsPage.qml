import QtQuick
import QtQuick.Layouts
import "../../config"

NotificationCard {
    id: root
    anchors.fill: parent

    property var notifications: [
        { app: "Spotify", title: "Now Playing", body: "Resonance — HOME", time: "1m ago" },
        { app: "Discord", title: "New message", body: "Hey, are you around later?", time: "5m ago" },
        { app: "Telegram", title: "Mateo", body: "Sent you a photo", time: "12m ago" },
        { app: "System", title: "Update available", body: "CachyOS kernel update ready to install", time: "1h ago" }
    ]

    RowLayout {
        width: parent.width

        Text {
            text: "Notifications"
            color: Theme.textPrimary
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeNormal
            font.bold: true
        }

        Item { Layout.fillWidth: true }

        Rectangle {
            id: clearAllButton
            width: clearAllLabel.implicitWidth + 20
            height: 28
            radius: Theme.radiusSmall
            color: clearAllHover.containsMouse ? Theme.surfaceVariant : "transparent"
            border.width: 1
            border.color: Theme.outline

            Behavior on color { ColorAnimation { duration: 120 } }

            Text {
                id: clearAllLabel
                anchors.centerIn: parent
                text: "Clear All"
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSizeSmall
            }

            MouseArea {
                id: clearAllHover
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: root.notifications = []
            }
        }
    }

    Column {
        width: parent.width
        spacing: 10

        Text {
            visible: root.notifications.length === 0
            text: "No notifications"
            color: Theme.textSecondary
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeSmall
        }

        Repeater {
            model: root.notifications
            delegate: NotificationItem {
                required property var modelData
                required property int index

                appName: modelData.app
                title: modelData.title
                body: modelData.body
                relativeTime: modelData.time

                onDismissed: {
                    let updated = root.notifications.slice();
                    updated.splice(index, 1);
                    root.notifications = updated;
                }
            }
        }
    }
}
