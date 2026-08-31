import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens;

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
            }

            visible: barVisibilityHandler.isBarVisible
            margins {
                top: 12
            }
            implicitWidth: 128
            color: "transparent"
            exclusionMode: ExclusionMode.Ignore

            WlrLayershell.layer: WlrLayer.Overlay
            ClockWidget {}
        }
    }
    Timer {
        id: timeout

        running: true
        interval: 3000
        onTriggered: barVisibilityHandler.isBarVisible = false
    }
    IpcHandler {
        id: barVisibilityHandler

        property bool isBarVisible: true
        target: "bar"

        function toggle(): void {
            isBarVisible = true
            timeout.running = true
        }
    }
}
