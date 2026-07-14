pragma Singleton

import QtQuick

QtObject {
    // Colors
    readonly property color defaultGreen: "#19c406"
    readonly property color defaultYellow: "#f2df07"
    readonly property color defaultRed: "#eb2705"
    readonly property color defaultWhite: "white"
    readonly property color defaultBlue: "#19a4e0"
    readonly property color defaultBackground: "#10141c"
    readonly property color cardBackground: "#1d2536"
    readonly property color defaultBorder: "#42557a"

    // Images
    readonly property url errorIcon: "qrc:/Qt_Telemetry_Dashboard/assets/error.svg"
    readonly property url warningIcon: "qrc:/Qt_Telemetry_Dashboard/assets/warning.svg"
    readonly property url infoIcon: "qrc:/Qt_Telemetry_Dashboard/assets/info.svg"
    readonly property url compass: "qrc:/Qt_Telemetry_Dashboard/assets/compass.svg"
    readonly property url compassArrow: "qrc:/Qt_Telemetry_Dashboard/assets/compassArrow.svg"
}
