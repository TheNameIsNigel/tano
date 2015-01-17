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

import QtQuick 2.1
import QtQuick.Layouts 1.1

import "../common/rectangles"
import "../common/text"
import "../common/views"

ListDelegateMain {
    id: mainPlaylistDelegate

    down: mouseArea.pressedButtons & Qt.LeftButton
    hover: mouseArea.containsMouse || mainPlaylistDelegate.activeFocus
    index: model.index

    PlaylistLayout {

    }

    MouseArea {
        id: mouseArea
        anchors {
            fill: parent
            leftMargin: -parent.height
        }

        hoverEnabled: mainPlaylistDelegate.GridView.view.horizontalVelocity === 0

        onEntered: {
            mainPlaylistDelegate.GridView.view.currentIndex = index
            mainPlaylistDelegate.forceActiveFocus()
        }

        onClicked: {
            //TanoChannelSelect.select(model.number)
        }
    }
}
