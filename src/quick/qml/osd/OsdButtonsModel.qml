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

ListModel {
    id: osdButtonsModel

    ListElement {
        icon: "Play"
        color: "#ffffff"
    }
    ListElement {
        icon: "Stop"
        color: "#ffffff"
    }
    ListElement {
        icon: "FastBackward"
        color: "#ffffff"
    }
    ListElement {
        icon: "FastForward"
        color: "#ffffff"
    }
    ListElement {
        icon: "Circle"
        color: "#8c1515"
    }
}
