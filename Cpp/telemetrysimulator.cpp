#include "telemetrysimulator.h"
#include "TelemetryData.h"

#include <QRandomGenerator>

TelemetrySimulator::TelemetrySimulator(TelemetryData *telemetry, QObject *parent)
    : QObject{parent}, m_telemetry(telemetry) {
    connect(&m_timer, &QTimer::timeout, this, &TelemetrySimulator::updateTelemetry);
    m_timer.setInterval(1000);
}

void TelemetrySimulator::start() {
    m_timer.start();
}

void TelemetrySimulator::stop() {
    m_timer.stop();
}

void TelemetrySimulator::updateTelemetry() {
    double delta = QRandomGenerator::global()->bounded(-2, 2);
    m_telemetry->setAltitude(m_telemetry->altitude() + delta);
}
