import Quickshell
import QtQuick
import Quickshell.Widgets
import "../../../config"
import "../../../services"

Rectangle {
    id: root

    width: 42
    height: column.implicitHeight + 12
    radius: width / 2
    color: Theme.background
    border.width: 1
    border.color: Theme.outline

    Column {
        id: column
        anchors.centerIn: parent
        spacing: 6

        Repeater {
            model: NiriService.workspaces
            delegate: Item {
                id: dot
                required property var modelData

                readonly property bool active: modelData.is_focused
                readonly property bool occupied: NiriService.isWorkspaceOccupied(modelData.id)
                readonly property string appId: NiriService.firstWindowAppId(modelData.id)

                width: 30
                height: active ? 26 : 18

                Behavior on height { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }

                Rectangle {
                    id: pill
                    anchors.centerIn: parent
                    width: dot.active ? 26 : (hoverArea.containsMouse ? 20 : 16)
                    height: dot.active ? 26 : (hoverArea.containsMouse ? 20 : 16)
                    radius: width / 2
                    color: dot.active ? Theme.accent : (hoverArea.containsMouse ? Theme.surfaceVariant : Theme.outline)
                    opacity: dot.active ? 1.0 : 0.7

                    Behavior on width { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
                    Behavior on height { NumberAnimation { duration: 150; easing.type: Easing.OutCubic } }
                    Behavior on color { ColorAnimation { duration: 150 } }
                    Behavior on opacity { NumberAnimation { duration: 150 } }

                    IconImage {
                        anchors.centerIn: parent
                        visible: dot.occupied && dot.appId.length > 0
                        width: 14
                        height: 14
                        source: Quickshell.iconPath(dot.appId, true)
                    }
                }

                MouseArea {
                    id: hoverArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NiriService.focusWorkspace(dot.modelData.idx)
                }
            }
        }
    }
}
