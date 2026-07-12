import QtQuick

Item {
    property string backgroundColor: Constants.defaultBackground
    property string progressBarColor: Constants.defaultGreen
    property int progressLength

    Rectangle {
        anchors.fill: parent
        color: backgroundColor
        radius: 3
        border.width: 0
        clip: true
        Rectangle {
            color: progressBarColor
            radius: 2
            width: progressLength
            height: parent.height
        }
    }
}
