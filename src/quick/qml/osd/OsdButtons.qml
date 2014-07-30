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

import "../fonts/fontawesome-webfont.js" as FontAwesome

import "../common/buttons"

FocusScope {
    property alias interactive: gridView.interactive

    width: 100
    height: 100

    /*onActiveFocusChanged: {

    }*/

    GridView {
        id: gridView
        anchors.fill: parent;
        cellWidth: 60; cellHeight: 60
        /*focus: true*/
        model: OsdButtonsModel { }

        KeyNavigation.up: osdPlaylist
        KeyNavigation.down: osdPlaylist

        delegate: SquareButton {
            id: container
            anchors.margins: 5
            width: GridView.view.cellWidth - 10; height: GridView.view.cellHeight - 10

            icon: FontAwesome.Icon[model.icon]
            iconColor: model.color
        }
    }
}
