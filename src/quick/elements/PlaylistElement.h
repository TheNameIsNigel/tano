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

#ifndef TANO_PLAYLISTELEMENT_H_
#define TANO_PLAYLISTELEMENT_H_

#include <QtCore/QObject>

class PlaylistFilterModel;
class PlaylistModel;
class PlaylistUpdate;

class PlaylistElement : public QObject
{
Q_OBJECT
public:
    explicit PlaylistElement(const QString &defaultPlaylist,
                             QObject *parent = 0);
    virtual ~PlaylistElement();

    inline PlaylistFilterModel *model() { return _filterModel; }

public slots:
    void openPlaylist(bool start = false);

private slots:
    void openPlaylistComplete();

private:
    QObject *_select;

    // Playlist
    QString _defaultPlaylist;
    PlaylistModel *_model;
    PlaylistFilterModel *_filterModel;
    PlaylistUpdate *_modelUpdate;
    QString _playlistName;
    bool _hasPlaylist;
};

#endif // TANO_PLAYLISTELEMENT_H_
