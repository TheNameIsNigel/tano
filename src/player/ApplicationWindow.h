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

#ifndef TANO_APPLICATIONWINDOW_H_
#define TANO_APPLICATIONWINDOW_H_

#include <QtQml/QQmlApplicationEngine>

class EpgElement;
class PlaybackElement;
class PlaylistElement;

class ApplicationWindow : public QQmlApplicationEngine
{
Q_OBJECT
public:
    explicit ApplicationWindow(QObject *parent = 0);
    virtual ~ApplicationWindow();

public slots:
    void completed();

private:
    void createSettings();
    void createSettingsStartup();
    void createCommonConstants();
    void createModels();

    //Settings
    QString _defaultPlaylist;
    bool _hideToTray;
    bool _muteOnMinimize;
    bool _rememberGui;
    int _width;
    int _height;
    int _posX;
    int _posY;

    EpgElement *_epg;
    PlaybackElement *_playback;
    PlaylistElement *_playlist;
};

#endif // TANO_APPLICATIONWINDOW_H_
