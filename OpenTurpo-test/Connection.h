#ifndef CONNECTION_H
#define CONNECTION_H

#include <QObject>

class Connection : public QObject
{
    Q_OBJECT
public:
    explicit Connection(QObject *parent = 0);
    virtual ~Connection();
    virtual bool connect(const QString &address, quint16 port) = 0;
    virtual void disconnect() = 0;

    virtual void sendMessage(const QString &message, quint16 port) = 0;

    
signals:
    virtual void connected();
    virtual void disconnected();

    virtual void receivedMessage(const QString &message);
public slots:

};

#endif // CONNECTION_H
