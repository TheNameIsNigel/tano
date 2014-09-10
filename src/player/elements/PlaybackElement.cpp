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

#include <qmediaremote/Enums.h>
#include <qmediaremote/Remote.h>

#include "core/network/NetworkUdpxy.h"
#include "core/playlist/containers/Channel.h"
#include "core/xmltv/XmltvManager.h"

#include "elements/PlaybackElement.h"

PlaybackElement::PlaybackElement(QObject *parent)
    : QObject(parent),
      _udpxy(new NetworkUdpxy(true, this)),
      _remote(0)
{

}

PlaybackElement::~PlaybackElement()
{

}

void PlaybackElement::setXmltv(XmltvManager *xmltv)
{
    _xmltv = xmltv;
}

// Playback
void PlaybackElement::playChannel(Channel *channel)
{
    stop();

    _channel = channel;

    QString url = _udpxy->processUrl(_channel->url());

    emit playUrl(url);
    emit channelInfo(_channel->name(), _channel->logo());

    _xmltv->request(_channel->xmltvId(), true);

    //tooltip(_channel->name());

    if (!_remote) {
        _remote = new QMRRemote(QMR::VLC, this);
    }

    _remote->start(QStringList() << "-v");
}

void PlaybackElement::stop()
{
    //if (_recordNow)
    //    recordNow(false);

    //_mediaPlayer->stop();
    _xmltv->stop();

    //tooltip();
}
