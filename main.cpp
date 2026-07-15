#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Cpp/TelemetryData.h"
#include "Cpp/telemetrysimulator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    TelemetryData telemetry;
    TelemetrySimulator simulator(&telemetry);
    simulator.start();
    engine.rootContext()->setContextProperty("telemetry", &telemetry);
    const QUrl url(QStringLiteral("qrc:/Qt_Telemetry_Dashboard/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
