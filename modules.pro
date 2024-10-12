QT += quick

SOURCES += \
        main.cpp

resources.files = main.qml
resources.prefix = /$${TARGET}
RESOURCES += resources CustomButtons

# Additional import path used to resolve QML modules in Qt Creator's code model
# QML_IMPORT_PATH = $PWD
QML2_IMPORT_PATH = $PWD

QML_IMPORT_PATH += $$PWD/custom_buttons
QML2_IMPORT_PATH += $$PWD/custom_buttons

message("Path>>>" $$QML_IMPORT_PATH)

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

DISTFILES += $$PWD/custom_buttons/qmldir

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
