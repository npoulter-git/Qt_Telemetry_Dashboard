import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import "./QtComponents"
import "."

Window {
    id: root
    width: 1280
    height: 960
    visible: true
    color: Constants.defaultBackground
    title: qsTr("Drone Telemetry Dashboard")

    property int rotationVal: 0

    Timer {
        interval: 20;
        running: true;
        repeat: true
        onTriggered: {
            if (rotationVal > 360) {
                rotationVal = 0;
            } else {
                rotationVal++;
            }
        }
    }

    property var topRowData: [
        {topString: "FLIGHT MODE", middleString: "AUTO"},
        {topString: "ARMED", middleString: "Armed"},
        {topString: "BATTERY", middleString: "76%", bottomString: "11.4V   8.7A"},
        {topString: "ALTITUDE", middleString: telemetry.altitude + " m", bottomString: "AGL: 118.7 m"},
        {topString: "GROUND SPEED", middleString: "15.2 m/s"},
        {topString: "HEADING", middleString: "134°", bottomString: "SE"},
    ]
    Item {
        anchors.fill: parent
        anchors.margins: 10
        Column {
            anchors.fill: parent
            spacing: 20
            Row {
                id: topRow
                width: parent.width
                spacing: 10
                Repeater {
                    model: topRowData
                    delegate: DataCard {
                        width: 200
                        height: 120
                        topString: modelData.topString
                        middleString: modelData.middleString
                        bottomString: modelData.bottomString ?? ""
                    }
                }
            }
            Row {
                id: secondRow
                width: parent.width
                spacing: 10
                Rectangle {
                    id: compass
                    width: 340
                    height: 340
                    radius: 5
                    color: Constants.cardBackground
                    border.color: Constants.defaultBorder
                    border.width: 1
                    Label {
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        text: "COMPASS"
                        font.pixelSize: 20
                        font.bold: true
                    }

                    Image {
                        width: 300
                        height: 300
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        source: Constants.compass
                    }

                    Image {
                        width: 150
                        height: 250
                        anchors.centerIn: parent
                        rotation: rotationVal
                        fillMode: Image.PreserveAspectFit
                        source: Constants.compassArrow
                    }
                }
                BarListCard {
                    id: vitals
                    width: 380
                    height: 340
                    cardTitle: "VITALS"
                    listData: [
                        {title: "Voltage", value: "11.4 V", barLength: 0.70},
                        {title: "Current", value: "8.7 A", barLength: 0.50},
                        {title: "Battery Temp", value: "94° F", barLength: 0.30},
                        {title: "ESC Temp", value: "102° F", barLength: 0.20},
                        {title: "CPU Temp", value: "105° F", barLength: 0.40},
                        {title: "RSSI", value: "-63 dBm", barLength: 0.80},
                        {title: "Link Quality", value: "96%", barLength: 0.65},
                    ]
                }
                Rectangle {
                    id: attitude
                    width: 450
                    height: 340
                    radius: 5
                    color: Constants.cardBackground
                    border.color: Constants.defaultBorder
                    border.width: 1
                    Label {
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        text: "ATTITUDE INDICATOR"
                        font.pixelSize: 20
                        font.bold: true
                    }
                    Row {
                        anchors.centerIn: parent
                        spacing: 10
                        Image {
                            width: 80
                            height: 220
                            fillMode: Image.PreserveAspectFit
                            source: Constants.ladderLeft
                        }
                        Image {
                            width: 220
                            height: 220
                            fillMode: Image.PreserveAspectFit
                            source: Constants.attitudeIndicator
                        }
                        Image {
                            width: 80
                            height: 220
                            fillMode: Image.PreserveAspectFit
                            source: Constants.ladderRight
                        }
                    }
                    Row {
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 50
                        Column {
                            spacing: 5
                            Label {
                                text: "ROLL"
                                font.pixelSize: 16
                                color: Constants.defaultWhite
                            }
                            Label {
                                text: "2.3°"
                                font.pixelSize: 16
                                color: Constants.defaultGreen
                                font.bold: true
                            }
                        }
                        Column {
                            spacing: 5
                            Label {
                                text: "PITCH"
                                font.pixelSize: 16
                                color: Constants.defaultWhite
                            }
                            Label {
                                text: "-1.8°"
                                font.pixelSize: 16
                                color: Constants.defaultGreen
                                font.bold: true
                            }
                        }
                        Column {
                            spacing: 5
                            Label {
                                text: "YAW"
                                font.pixelSize: 16
                                color: Constants.defaultWhite
                            }
                            Label {
                                text: "134°"
                                font.pixelSize: 16
                                color: Constants.defaultGreen
                                font.bold: true
                            }
                        }
                    }
                }
            }
            Row {
                id: thirdRow
                width: parent.width
                spacing: 10
                DataListCard {
                    id: sensors
                    width: 280
                    height: 300
                    cardTitle: "SENSORS"
                    listData: [
                        {title: "GPS", statusCode: "OK"},
                        {title: "IMU", statusCode: "OK"},
                        {title: "Barometer", statusCode: "WARNING"},
                        {title: "Magnetometer", statusCode: "OK"},
                        {title: "Accelerometer", statusCode: "ERROR"},
                        {title: "Gyroscope", statusCode: "OK"},
                    ]
                }
                MessageListCard {
                    id: messages
                    width: 480
                    height: 300
                    cardTitle: "MESSAGES / ALERTS"
                }
                BarListCard {
                    id: systemStatus
                    width: 380
                    height: 170
                    cardTitle: "SYSTEM STATUS"
                    listData: [
                        {title: "CPU Load", value: "18 %", barLength: 0.18},
                        {title: "Memory", value: "52%", barLength: 0.52},
                        {title: "Disk Usage", value: "34 %", barLength: 0.34},
                    ]
                }
            }
        }
    }

    // Item {
    //     id: lineGraph
    //     width: 350
    //     height: 220

    //     property var values: [15, 20, 18, 30, 22, 35, 40, 38, 42, 37]
    //     property color lineColor: "#ff9800"
    //     property real lineWidth: 2

    //     Canvas {
    //         id: canvas
    //         anchors.fill: parent

    //         onPaint: {
    //             var ctx = getContext("2d");
    //             ctx.reset();

    //             if (lineGraph.values.length < 2)
    //                 return;

    //             // Find the data range
    //             var min = Math.min(...lineGraph.values);
    //             var max = Math.max(...lineGraph.values);

    //             // Prevent divide-by-zero
    //             if (min === max)
    //                 max = min + 1;

    //             ctx.strokeStyle = lineGraph.lineColor;
    //             ctx.lineWidth = lineGraph.lineWidth;
    //             ctx.beginPath();

    //             for (var i = 0; i < lineGraph.values.length; ++i) {

    //                 var x = i * width / (lineGraph.values.length - 1);

    //                 var normalized = (lineGraph.values[i] - min) / (max - min);

    //                 // Canvas origin is upper-left
    //                 var y = height - normalized * height;

    //                 if (i === 0)
    //                     ctx.moveTo(x, y);
    //                 else
    //                     ctx.lineTo(x, y);
    //             }

    //             ctx.stroke();
    //         }
    //     }

    //     onValuesChanged: canvas.requestPaint()
    // }

    // ProgressBar {
    //     anchors.centerIn: parent
    //     from: 0
    //     to: 100
    //     value: 50
    //     width: 200
    //     height: 40
    //     background: Rectangle {
    //         color: "transparent"
    //         implicitHeight: 40
    //         implicitWidth: 200
    //         border.width: 0
    //     }
    //     contentItem: Rectangle {
    //         color: "gray"
    //         radius: 20
    //         Rectangle {
    //             width: 100
    //             height: parent.height
    //             color: "orange"
    //         }

    //     }
    // }
}
