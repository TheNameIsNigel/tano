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

#include <QtCore/QDebug>
#include <QtCore/QString>
#include <QtQml/QQmlContext>

#include "core/playlist/PlaylistFilterModel.h"
#include "core/playlist/PlaylistModel.h"
#include "core/settings/Settings.h"
#include "core/xmltv/XmltvManager.h"

#include "common/ChannelSelect.h"
#include "common/Constants.h"
#include "elements/EpgElement.h"
#include "elements/PlaybackElement.h"
#include "elements/PlaylistElement.h"

#include "ApplicationWindow.h"

ApplicationWindow::ApplicationWindow(QObject *parent)
    : QQmlApplicationEngine(parent)
{
    createSettings();
    createSettingsStartup();
    createCommonConstants();
    createModels();

    load(QUrl(QStringLiteral("/Users/tadej/workspace/tanoprojects/tano/src/qml/main.qml"))); //"qrc:/main.qml")));
}

ApplicationWindow::~ApplicationWindow()
{

}

void ApplicationWindow::createSettings()
{
    QScopedPointer<Settings> settings(new Settings(this));
    _hideToTray = settings->trayEnabled() ? settings->hideToTray() : false;

    //GUI Settings
    /*if (_trayIcon) {
        if(settings->trayEnabled())
            _trayIcon->show();
        else
            _trayIcon->hide();
    }*/

    _rememberGui = settings->rememberGuiSession();

    //Playback settings
    //_mediaPlayer->createSettings();
    //_udpxy->createSettings();
    _muteOnMinimize = settings->muteOnMinimize();

    qDebug() << "Initialised: Settings";
}

void ApplicationWindow::createSettingsStartup()
{
    QScopedPointer<Settings> settings(new Settings(this));
    _defaultPlaylist = settings->playlist();
    //if (!_arguments->value(Argument::Playlist).isEmpty())
    //    _defaultPlaylist = _arguments->value(Argument::Playlist);

    _width = settings->width();
    _height = settings->height();
    _posX = settings->posX();
    _posY = settings->posY();

    if (_rememberGui) {
        //resize(_width, _height);
    }

    qDebug() << "Initialised: Startup settings";
}

void ApplicationWindow::createCommonConstants()
{
    rootContext()->setContextProperty("TanoCommon", Tano::Quick::common());
    rootContext()->setContextProperty("TanoUi", Tano::Quick::ui());
}

void ApplicationWindow::createModels()
{
    _epg = new EpgElement(this);

    _playlist = new PlaylistElement(_defaultPlaylist, this);
    rootContext()->setContextProperty("TanoPlaylist", _playlist->model());
    rootContext()->setContextProperty("TanoChannelSelect", _playlist->select());

    rootContext()->setContextProperty("TanoXmltv", _epg->xmltv());

    _playback = new PlaybackElement(this);
    _playback->setXmltv(_epg->xmltv());
    rootContext()->setContextProperty("TanoPlayback", _playback);

    connect(_playlist, SIGNAL(itemSelected(Channel *)), _playback, SLOT(playChannel(Channel *)));
    connect(_epg->xmltv(), SIGNAL(currentPlaylist(QString, QString, QString)), _playlist->sourceModel(), SLOT(updateCurrentEpg(QString, QString, QString)));

    rootContext()->setContextProperty("Tano", this);
}

void ApplicationWindow::completed()
{
    _epg->xmltv()->currentPlaylist();

    _playlist->select()->select(1);
}
