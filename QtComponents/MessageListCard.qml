import QtQuick
import QtQuick.Controls
import "../QtComponents"

Item {
    id: root
    property string cardTitle
    property var listData: [
        {timestamp: "12:12:12", type: "INFO", message: "Waypoint 5 reached"},
        {timestamp: "12:12:34", type: "INFO", message: "Adjusting altitude to 120m"},
        {timestamp: "12:14:28", type: "WARNING", message: "High winds detected"},
        {timestamp: "12:15:02", type: "INFO", message: "Image Captured"},
        {timestamp: "12:16:55", type: "ERROR", message: "Connection Interrupted!"},
        {timestamp: "12:17:39", type: "INFO", message: "Connection Re-established"},
    ]

    function getTextColor(type) {
        if (type === "ERROR") {
            return Constants.defaultRed
        } else if (type === "WARNING") {
            return Constants.defaultYellow
        } else {
            return Constants.defaultBlue
        }
    }

    function getIconSource(type) {
        if (type === "ERROR") {
            return Constants.errorIcon
        } else if (type === "WARNING") {
            return Constants.warningIcon
        } else {
            return Constants.infoIcon
        }
    }

    Rectangle {
        radius: 5
        width: parent.width
        height: parent.height
        color: Constants.cardBackground
        border.color: Constants.defaultBorder
        border.width: 1
        // Image, Timestamp, Code, Message

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
                        Image {
                            width: 20
                            height: 20
                            source: getIconSource(modelData.type)
                        }
                        Label {
                            width: root.width/6
                            text: modelData.timestamp
                            color: getTextColor(modelData.type)
                            font.pixelSize: 16
                        }
                        Label {
                            width: root.width/6
                            text: modelData.type
                            color: getTextColor(modelData.type)
                            font.pixelSize: 16
                        }
                        Label {
                            text: modelData.message
                            color: Constants.defaultWhite
                            font.pixelSize: 16
                        }
                    }
                }
            }
        }
    }
}
