include(../3rdparty/qxmpp/qxmpp.pri)

QT -= gui
QT += network xml

TEMPLATE = lib
CONFIG += staticlib
DEFINES += QT_STATICPLUGIN
DEFINES += $$QXMPP_INTERNAL_DEFINES
INCLUDEPATH += $QXMPP_INCLUDEPATH ../3rdparty/qdjango/src/db
LIBS += $QXMPP_LIBS -L../3rdparty/qdjango/src/db -lqdjango-db

include(diagnostics/diagnostics.pri)
include(shares/shares.pri)
