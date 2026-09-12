import Quickshell
import QtQuick
import "config.js" as Config

PanelWindow {
    id: root
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
    margins.bottom: 24
    implicitHeight: 40
    implicitWidth: 256
    anchors {
        bottom: true
    }

    Rectangle {
        color: Config.volumeOSDColors.background
        anchors.fill: parent
        radius: root.implicitHeight / 2.0

        StyledText {
            text: "text"
        }
    }
}
