if(UNIX)
  if(NOT APPLE)
    add_definitions(-fPIC)
  endif(NOT APPLE)
endif(UNIX)

# Wireless
if(WIN32)
    set(wireless_SOURCES diagnostics/wireless_win.cpp)
elseif(APPLE)
    find_library(COREWLAN_LIBRARY NAMES CoreWLAN)
    if(COREWLAN_LIBRARY)
        message(STATUS "Found CoreWLAN library: ${COREWLAN_LIBRARY}")
        add_definitions(-DUSE_COREWLAN)
        set(WLAN_LIBRARIES ${COREWLAN_LIBRARY})
    endif(COREWLAN_LIBRARY)
    set(wireless_SOURCES diagnostics/wireless_mac.mm)
elseif(UNIX AND NOT QXMPP_DONT_USE_QTDBUS)
    set(wireless_SOURCES diagnostics/wireless_nm.cpp)
    set(WLAN_LIBRARIES Qt4::QtDBus)
else(WIN32)
    set(wireless_SOURCES diagnostics/wireless_stub.cpp)
endif(WIN32)

set(SOURCES
    diagnostics/interface.cpp
    diagnostics/QXmppDiagnosticIq.cpp
    diagnostics/network.cpp
    diagnostics/software.cpp
    diagnostics/transfer.cpp
    diagnostics/wireless.cpp
    shares/QXmppShareDatabase.cpp
    shares/QXmppShareIq.cpp
    shares/QXmppShareManager.cpp
    ${wireless_SOURCES})

add_library(qxmpp-extra STATIC ${SOURCES})
target_link_libraries(qxmpp-extra ${QDJANGO_LIBRARIES} ${QXMPP_LIBRARIES} Qt4::QtNetwork Qt4::QtSql Qt4::QtXml ${WLAN_LIBRARIES})
