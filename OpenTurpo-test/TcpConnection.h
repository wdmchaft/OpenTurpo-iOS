#ifndef TCPCONNECTION_H
#define TCPCONNECTION_H

#include "Connection.h"

class TcpConnection : public Connection
{
public:
    TcpConnection();

    bool connect(const QString &address, quint16 port);
    void disconnect();

    void sendMessage(const QString &message, quint16 port);

};

#endif // TCPCONNECTION_H
