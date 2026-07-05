import Quickshell
import QtQuick
import Quickshell.Widgets
import "../../../config"
import "../../../services"

Rectangle {
    id: root

    readonly property string _appId: NiriService.focusedWindow ? (NiriService.focusedWindow.app_id || "") : ""
    readonly property string _label: _appId.length > 0 ? _appId : "Desktop"
    readonly property string _iconName: _appId.length > 0 ? _appId : "computer"

    width: 42
    height: 84
    radius: Theme.radiusMedium
    color: Theme.background
    border.width: 1
    border.color: Theme.outline

    Column {
        anchors.centerIn: parent
        spacing: 8

        IconImage {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 24
            height: 24
            source: Quickshell.iconPath(root._iconName, "computer")
        }

        // Vertical label: rotated -90°, wrapped in a swapped-dimension Item
        // so the layout accounts for the rotated bounding box correctly.
        Item {
            width: 14
            height: 44
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.centerIn: parent
                rotation: -90
                text: root._label
                color: Theme.textSecondary
                font.family: Theme.fontFamily
                font.pixelSize: 10
                elide: Text.ElideRight
                width: 44
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
