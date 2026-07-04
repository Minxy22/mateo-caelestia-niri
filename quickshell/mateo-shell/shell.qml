import Quickshell
import "./modules/frame"
import "./modules/dashboard"
import "./modules/launcher"

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
}
