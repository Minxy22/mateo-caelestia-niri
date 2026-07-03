pragma Singleton
import QtQuick
import Quickshell.Io

QtObject {
    id: root

    property real cpuUsage: 0
    property string cpuModel: "Unknown CPU"

    property real _prevIdle: 0
    property real _prevTotal: 0

    // cpuModel: read once, no ongoing cost
    FileView {
        id: cpuInfoFile
        path: "/proc/cpuinfo"
        onLoaded: {
            const m = text().match(/^model name\s*:\s*(.+)$/m);
            if (m) root.cpuModel = m[1].trim();
        }
    }

    // cpuUsage: same delta-based calculation already used in modules/bar/CpuIndicator.qml,
    // centralized here so both the bar and the Performance tab read one value.
    FileView {
        id: statFile
        path: "/proc/stat"
        onLoaded: root._parseStat(text())
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: statFile.reload()
    }

    function _parseStat(content) {
        const line = content.split("\n")[0];
        const parts = line.trim().split(/\s+/).slice(1).map(Number);
        const idle = parts[3] + parts[4];
        const total = parts.reduce((a, b) => a + b, 0);
        const dIdle = idle - root._prevIdle;
        const dTotal = total - root._prevTotal;

        if (root._prevTotal > 0 && dTotal > 0) {
            root.cpuUsage = Math.max(0, Math.min(100, 100 * (1 - dIdle / dTotal)));
        }

        root._prevIdle = idle;
        root._prevTotal = total;
    }
}
