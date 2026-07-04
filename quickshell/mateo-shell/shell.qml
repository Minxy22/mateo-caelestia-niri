import Quickshell
import "./modules/frame"
import "./modules/dashboard"
import "./modules/launcher"
import "./modules/session"
import "./modules/power"
import "./modules/osd"

ShellRoot {
    Variants {
        model: Quickshell.screens
        DesktopFrame {}
    }

    Variants {
        model: Quickshell.screens
        DashboardWindow {}
    }

    Variants {
        model: Quickshell.screens
        LauncherWindow {}
    }

    Variants {
        model: Quickshell.screens
        SessionWindow {}
    }

    Variants {
        model: Quickshell.screens
        PowerWindow {}
    }

    Variants {
        model: Quickshell.screens
        OsdWindow {}
    }
}
