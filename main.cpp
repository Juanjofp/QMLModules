#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

#if (QT_VERSION >= QT_VERSION_CHECK(6, 0, 0))
  //Qt6
  QObject::connect(
      &engine,
      &QQmlApplicationEngine::objectCreationFailed,
      &app,
      []() { QCoreApplication::exit(-1); },
      Qt::QueuedConnection);
  engine.loadFromModule("modules", "Main");
#else
  //Qt5
  const QUrl url(QStringLiteral("qrc:/main.qml"));
  QObject::connect(
      &engine,
      &QQmlApplicationEngine::objectCreated,
      &app,
      [url](QObject *obj, const QUrl &objUrl) {
          if (!obj && url == objUrl)
              QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);
#endif

  return app.exec();
}
