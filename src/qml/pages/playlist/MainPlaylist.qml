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

import QtQuick 2.0

import "../../common/rectangles"
import "../../common/views"

FocusScope {
    GridView {
        id: listView
        clip: true

        anchors.fill: parent

        cellHeight: 58
        cellWidth: 358

        model: TanoPlaylist
        delegate: MainPlaylistDelegate { }
        focus: true

        flow: GridView.FlowTopToBottom
        flickableDirection: Flickable.HorizontalFlick

       // KeyNavigation.left: osdBar; KeyNavigation.right: osdBar

        //Keys.onReturnPressed: TanoChannelSelect.select(model.numberFromRow(currentIndex))
    }

    ScrollBar {
        flickable: listView
        anchors.leftMargin: 3
    }
}
