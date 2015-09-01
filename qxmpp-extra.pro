include(../3rdparty/qxmpp/qxmpp.pri)

QT -= gui
QT += network xml

TEMPLATE = lib
CONFIG += static
DEFINES += $$QXMPP_INTERNAL_DEFINES
INCLUDEPATH += $$QXMPP_INCLUDEPATH
LIBS += -L../3rdparty/qxmpp/src $$QXMPP_LIBS

win32 {
    LIBS += -lws2_32
    DESTDIR = $$OUT_PWD
}

include(diagnostics/diagnostics.pri)
