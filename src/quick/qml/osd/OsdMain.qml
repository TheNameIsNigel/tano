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

import "bar"
import "playlist"

FocusScope {
    id: mainOsd
    width: 800
    height: 600
    anchors.fill: parent
    visible: false
    focus: true

    Timer {
        id: osdTimer
        interval: 2000
        repeat: false
        onTriggered: osdBar.enabled = false
    }

    MouseArea {
        id: osdMouse
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: {
            osdBar.enabled = true
            //osdTimer.start()
        }
    }

    OsdBar {
        id: osdBar

        focus: true
    }

    OsdPlaylist {
        id: osdPlaylist

        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    OsdNumber {
        id: osdNumber

        x: 100;
        y: 100;
    }

    Component.onCompleted: mainWindow.osd = mainOsd
}
