#ifndef UDP_CONNECTION_H
#define UDP_CONNECTION_H

#include "Connection.h"

class UdpConnection : public Connection
{
public:
    UdpConnection();
    ~UdpConnection();

    bool connect(const QString &address, quint16 port);
    void disconnect();

    void sendMessage(const QString &message, quint16 port);
};

#endif // UDP_CONNECTION_H
