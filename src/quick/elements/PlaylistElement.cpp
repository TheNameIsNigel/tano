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

#include <QtCore/QFile>

#include "core/Resources.h"
#include "core/playlist/PlaylistFilterModel.h"
#include "core/playlist/PlaylistModel.h"
#include "core/playlist/PlaylistUpdate.h"

#include "widgets/common/FileDialogs.h"

#include "common/ChannelSelect.h"
#include "elements/PlaylistElement.h"

PlaylistElement::PlaylistElement(const QString &defaultPlaylist,
                                 QObject *parent)
    : QObject(parent),
      _defaultPlaylist(defaultPlaylist),
      _model(new PlaylistModel(this)),
      _modelUpdate(new PlaylistUpdate(_model)),
      _select(0),
      _hasPlaylist(false)
{
    _filterModel = new PlaylistFilterModel(this);
    _filterModel->setDynamicSortFilter(true);
    _filterModel->setSourceModel(_model);

    openPlaylist(true);
}

PlaylistElement::~PlaylistElement()
{

}

void PlaylistElement::openPlaylist(bool start)
{
    if (_select != 0) {
        // TODO: select
        /*disconnect(ui->actionBack, SIGNAL(triggered()), _select, SLOT(back()));
        disconnect(ui->actionNext, SIGNAL(triggered()), _select, SLOT(next()));
        disconnect(_select, SIGNAL(channelSelect(int)), _playlistTab->playlist(), SLOT(channelSelected(int)));*/
        delete _select;
    }

    if (!start) {
        _playlistName = FileDialogs::openPlaylistSimple();
        if (_playlistName.isEmpty())
            return;

        QFile f(_playlistName);
        if (!f.open(QFile::ReadOnly | QFile::Text)) {
            /*QMessageBox::warning(this, Tano::name(),
                                tr("Cannot read file %1:\n%2.")
                                .arg(_playlistName)
                                .arg(f.errorString()));*/
            return;
        }
        f.close();

        _model->open(_playlistName);
        openPlaylistComplete();
    } else {
         connect(_modelUpdate, SIGNAL(done()), this, SLOT(openPlaylistComplete()));

        _playlistName = Tano::Resources::resource(_defaultPlaylist);
        _modelUpdate->update(_defaultPlaylist);
    }
}

void PlaylistElement::openPlaylistComplete()
{
    disconnect(_modelUpdate, SIGNAL(done()), this, SLOT(openPlaylistComplete()));

    _hasPlaylist = true;

    _select = new ChannelSelect(this, _model->numbers());
    // TODO: Select
    /*connect(ui->actionBack, SIGNAL(triggered()), _select, SLOT(back()));
    connect(ui->actionNext, SIGNAL(triggered()), _select, SLOT(next()));
    connect(_select, SIGNAL(channelSelect(int)), _playlistTab->playlist(), SLOT(channelSelected(int)));*/

    //_playlistTab->setPlaylistName(_model->name());
    //_playlistTab->setFilters(_model->categories(), _model->languages());
}
