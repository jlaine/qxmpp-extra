include(../3rdparty/qdjango/qdjango.pri)
include(../3rdparty/qxmpp/qxmpp.pri)

QT -= gui
QT += network xml

TEMPLATE = lib
CONFIG += staticlib
DEFINES += $$QXMPP_INTERNAL_DEFINES
INCLUDEPATH += $$QDJANGO_INCLUDEPATH $$QXMPP_INCLUDEPATH
LIBS += \
    -L../3rdparty/qdjango/src/db $$QDJANGO_DB_LIBS \
    -L../3rdparty/qxmpp/src $$QXMPP_LIBS
win32: DESTDIR = $$OUT_PWD

include(diagnostics/diagnostics.pri)
include(shares/shares.pri)
