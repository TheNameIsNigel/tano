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

Item {
    id: osdPlaylistHighlight
    width: 300
    height: 60

    Rectangle {
        id: top
        color: "#ffffff"

        height: 3
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
    }

    Rectangle {
        id: bottom
        color: "#ffffff"

        height: 3
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    Rectangle {
        id: left
        color: "#ffffff"

        width: 3
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    Rectangle {
        id: right
        color: "#ffffff"

        width: 3
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }
}
