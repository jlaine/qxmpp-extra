cmake_minimum_required(VERSION 2.8.6)
set(CMAKE_AUTOMOC ON)
find_package(Qt4 REQUIRED)

# Disable dependency on QtGui
set(QT_DONT_USE_QTGUI 1)
set(QT_USE_QTNETWORK 1)
set(QT_USE_QTSQL 1)
set(QT_USE_QTXML 1)
if(UNIX AND NOT APPLE AND NOT QXMPP_DONT_USE_QTDBUS)
    set(QT_USE_QTDBUS true)
endif()
include(${QT_USE_FILE})

if(UNIX)
  if(NOT APPLE)
    add_definitions(-fPIC)
  endif(NOT APPLE)
endif(UNIX)

# Wireless
find_library(COREWLAN_LIBRARY NAMES CoreWLAN)
if(COREWLAN_LIBRARY)
    message(STATUS "Found CoreWLAN library: ${COREWLAN_LIBRARY}")
    add_definitions(-DUSE_COREWLAN)
    set(WLAN_LIBRARIES ${COREWLAN_LIBRARY})
endif(COREWLAN_LIBRARY)
if(WIN32)
    set(wireless_SOURCES diagnostics/wireless_win.cpp)
elseif(APPLE)
    set(wireless_SOURCES diagnostics/wireless_mac.mm)
elseif(QT_USE_QTDBUS AND QT_QTDBUS_FOUND)
    set(wireless_SOURCES diagnostics/wireless_nm.cpp)
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
target_link_libraries(qxmpp-extra ${QDJANGO_LIBRARIES} ${QXMPP_LIBRARIES} ${QT_LIBRARIES} ${WLAN_LIBRARIES})
