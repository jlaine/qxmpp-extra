include(../3rdparty/qdjango/qdjango.pri)
include(../3rdparty/qxmpp/qxmpp.pri)

QT -= gui
QT += network xml

TEMPLATE = lib
CONFIG += shared
DEFINES += $$QXMPP_INTERNAL_DEFINES
INCLUDEPATH += $$QDJANGO_INCLUDEPATH $$QXMPP_INCLUDEPATH
LIBS += \
    -L../3rdparty/qdjango/src/db $$QDJANGO_DB_LIBS \
    -L../3rdparty/qxmpp/src $$QXMPP_LIBS
win32 {
    LIBS += -lws2_32
    DESTDIR = $$OUT_PWD
}

include(diagnostics/diagnostics.pri)
include(shares/shares.pri)
