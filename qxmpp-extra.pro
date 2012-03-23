include(../qxmpp/qxmpp.pri)

QT -= gui
QT += network xml

TEMPLATE = lib
CONFIG += staticlib
DEFINES += QT_STATICPLUGIN
DEFINES += $$QXMPP_INTERNAL_DEFINES
INCLUDEPATH += ../qdjango/src/db $$QXMPP_INCLUDEPATH
LIBS += $$QXMPP_LIBS

include(diagnostics/diagnostics.pri)
include(shares/shares.pri)
