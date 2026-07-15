#pragma once

#include <QObject>

class TelemetryData : public QObject {
    Q_OBJECT

    // Currently this is CONSTANT but will need to change to NOTIFY altitudeChanged
    // Read this as there is a property 'altitude' where you can read it's value by calling altitude()
    Q_PROPERTY(double altitude READ altitude WRITE setAltitude NOTIFY altitudeChanged)

public:
    explicit TelemetryData(QObject *parent = nullptr)
        : QObject(parent)
    {}

    double altitude() const {
        return m_altitude;
    }
    void setAltitude(double altitude) {
        if (m_altitude == altitude) {
            return;
        }
        m_altitude = altitude;
        emit altitudeChanged();
    }

private:
    double m_altitude = 120.4;

signals:
    void altitudeChanged();
};

/*
Property List:
batteryLevel
voltage
current
altitude
agl
groundSpeed
heading
escTemp
batteryTemp
cpuTemp
rssi
linkQuality
roll
pitch
yaw
gpsStatus
imuStatus
barometerStatus
magnetometerStatus
accelerometerStatus
gyroscopeStatus
cpuUsage
memoryUsage
diskUsage
*/
