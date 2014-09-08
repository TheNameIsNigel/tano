/****************************************************************************
* Tano - An Open IP TV Player
* Copyright (C) 2014 Tadej Novak <tadej@tano.si>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*****************************************************************************/

#ifndef TANO_PLAYBACKELEMENT_H_
#define TANO_PLAYBACKELEMENT_H_

#include <QtCore/QObject>

class Channel;
class NetworkUdpxy;
class XmltvManager;

class PlaybackElement : public QObject
{
Q_OBJECT
public:
    explicit PlaybackElement(QObject *parent = 0);
    virtual ~PlaybackElement();

    void setXmltv(XmltvManager *xmltv);

public slots:
    void playChannel(Channel* channel);
    void stop();

signals:
    void playUrl(const QString &url);

private:
    Channel *_channel;
    NetworkUdpxy *_udpxy;

    XmltvManager *_xmltv;
};

#endif // TANO_PLAYBACKELEMENT_H_
