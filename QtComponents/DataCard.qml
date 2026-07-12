import QtQuick 2.15
import QtQuick.Controls

Item {
    property string topString
    property string middleString
    property string bottomString
    property string middleColor: Constants.defaultGreen

    Rectangle {
        radius: 5
        width: parent.width
        height: parent.height
        color: Constants.cardBackground
        border.color: Constants.defaultBorder
        border.width: 1
        Column {
            spacing: 0
            anchors.centerIn: parent
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: topString
                color: Constants.defaultWhite
                font.pixelSize: 22
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: middleString
                color: middleColor
                font.pixelSize: 30
                font.bold: true
            }
            Label {
                visible: bottomString
                anchors.horizontalCenter: parent.horizontalCenter
                text: bottomString
                color: Constants.defaultWhite
                font.pixelSize: 18
            }
        }
    }
}
