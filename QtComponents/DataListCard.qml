import QtQuick
import QtQuick.Controls
import "../QtComponents"

Item {
    id: root
    property string cardTitle
    property var listData

    function getTextColor(statusCode) {
        if (statusCode === "ERROR") {
            return Constants.defaultRed
        } else if (statusCode === "WARNING") {
            return Constants.defaultYellow
        } else {
            return Constants.defaultGreen
        }
    }

    Rectangle {
        radius: 5
        width: parent.width
        height: parent.height
        color: Constants.cardBackground
        border.color: Constants.defaultBorder
        border.width: 1

        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10
            Label {
                text: cardTitle
                color: Constants.defaultWhite
                font.pixelSize: 20
            }
            Repeater {
                model: listData
                delegate: Column {
                    width: parent.width - 10
                    spacing: 5
                    height: 30
                    Row {
                        width: parent.width
                        spacing: 5
                        Label {
                            width: root.width/2 - 10
                            text: modelData.title
                            color: Constants.defaultWhite
                            font.pixelSize: 16
                        }
                        Label {
                            width: root.width/2 - 10
                            text: modelData.statusCode
                            color: getTextColor(modelData.statusCode)
                            font.pixelSize: 16
                            font.bold: true
                        }
                    }
                    Rectangle {
                        width: parent.width
                        height: 2
                        color: Constants.defaultBorder
                        border.width: 0
                    }
                }
            }
        }
    }
}
