import Quickshell
import "./modules/sidebar"
import "./modules/dashboard"

ShellRoot {
    Variants {
        model: Quickshell.screens
        Sidebar {}
    }

    Variants {
        model: Quickshell.screens
        DashboardWindow {}
    }
}
