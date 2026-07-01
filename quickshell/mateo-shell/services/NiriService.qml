pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

QtObject {
	id: root

	property var workspaces: []
	property int focusedIndex: -1

	function focusWorkspace(idx){
		// Pure Niri IPC - no Hyprland action names anywhere
		Quickshell.execDetached(["niri", "msg", "action", "focus-workspace-index", idx.toString()]);
	}

	function _updateFocused(){
		for (let i = 0; i < workspaces.length; i++){
			if(workspaces[i].is_focused){
				focusedIndex = i;
				return;
			}
		}
	}

	Process {
		id: eventStream
		command: ["niri", "msg", "-j", "event-stream"]
		running: true

		stdout: SplitParser {
			splitMarker: "\n"
			onRead: line => {
				if (!line) return;
				let event;
				try { event = JSON.parse(line); } catch (e) { return; }

				if(event.WorkspacesChanged){
					root.workspaces = event.WorkspacesChanged.workspaces;
					root._updateeFocused();
				} else if (event.WorkspaceActivated){
					root._updateFocused();
				}
			}
		}

		onExited: restartTimer.start()
	}

	Timer{
		id: restartTimer
		interval: 1000
		onTriggered: eventStream.running = true
	}
}
