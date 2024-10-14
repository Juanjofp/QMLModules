TEMPLATE = app

TARGET = QMLModules

# Solves path issue: https://forum.qt.io/topic/102344/dependent-that-clearly-exists-does-not-exist-error-when-building-qt-creator-project/21
QMAKE_PROJECT_DEPTH = 0

QT += quick

SOURCES += \
        main.cpp

QML_IMPORT_PATH += $$PWD


qml_components.files = \
    CustomButtons/qmldir \
    CustomButtons/YellowButton.qml \
    CustomButtons/RedButton.qml \
    CustomButtons/GreenButton.qml \
    CustomButtons/GrayButton.qml
qml_components.prefix = /qt/qml

qml_files.files = main.qml
qml_files.prefix = /qt/qml

RESOURCES += qml_components qml_files

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
