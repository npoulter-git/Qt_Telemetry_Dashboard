#pragma once

#include <QObject>
#include <QTimer>

class TelemetryData;

class TelemetrySimulator : public QObject
{
    Q_OBJECT

public:
    explicit TelemetrySimulator(TelemetryData *telemetry, QObject *parent = nullptr);

    void start();
    void stop();
private slots:
    void updateTelemetry();
private:
    TelemetryData *m_telemetry;
    QTimer m_timer;
};
