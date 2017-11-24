# comment following line to build the lib as static library
DEFINES *= QHTTP_DYNAMIC_LIB
# comment following line to trim client classes from build
DEFINES *= QHTTP_HAS_CLIENT
# Qt5.5.1 on OSX needs both c++11 and c++14!! the c++14 is not enough
CONFIG  += c++11 c++14

win32 {
    DEFINES += _WINDOWS WIN32_LEAN_AND_MEAN NOMINMAX
}

INCLUDEPATH +=  . $$PWD/src $$PWD/3rdparty

DEFINES       *= QHTTP_MEMORY_LOG=0
win32:DEFINES *= QHTTP_EXPORT

# Joyent http_parser
SOURCES  += $$PWD/3rdparty/http-parser/http_parser.c
HEADERS  += $$PWD/3rdparty/http-parser/http_parser.h

SOURCES  += \
    $$PWD/src/qhttpabstracts.cpp \
    $$PWD/src/qhttpserverconnection.cpp \
    $$PWD/src/qhttpserverrequest.cpp \
    $$PWD/src/qhttpserverresponse.cpp \
    $$PWD/src/qhttpserver.cpp

HEADERS  += \
    $$PWD/src/qhttpfwd.hpp \
    $$PWD/src/qhttpabstracts.hpp \
    $$PWD/src/qhttpserverconnection.hpp \
    $$PWD/src/qhttpserverrequest.hpp \
    $$PWD/src/qhttpserverresponse.hpp \
    $$PWD/src/qhttpserver.hpp

contains(DEFINES, QHTTP_HAS_CLIENT) {
    SOURCES += \
        $$PWD/src/qhttpclientrequest.cpp \
        $$PWD/src/qhttpclientresponse.cpp \
        $$PWD/src/qhttpclient.cpp

    HEADERS += \
        $$PWD/src/qhttpclient.hpp \
        $$PWD/src/qhttpclientresponse.hpp \
        $$PWD/src/qhttpclientrequest.hpp
}
