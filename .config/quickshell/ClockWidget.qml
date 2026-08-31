import QtQuick

Rectangle {
    anchors {
        fill: parent
    }
    color: "black"
    radius: 32
    Text {
        text: Time.time
        font.family: "Adwaita Sans"
        font.pointSize: 11
        font.weight: 600
        color: "white"
        anchors.centerIn: parent
    }
}
