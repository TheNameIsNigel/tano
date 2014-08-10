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
    width: 350; height: 200

    clip: true

    anchors.left: parent.right
    anchors.leftMargin: 0

    VideoBlur {
        anchors.fill: parent

        type: "right"
        dark: true
        marginRight: osdPlaylist.width + osdPlaylist.anchors.leftMargin
    }

    ListView {
        id: listView
        clip: true

        anchors.fill: parent
        anchors.leftMargin: 25
        anchors.rightMargin: 25
        anchors.topMargin: 50
        anchors.bottomMargin: 50

        model: TanoPlaylist
        delegate: OsdPlaylistDelegate { }
        highlight: OsdPlaylistHighlight { }
        spacing: 8
        focus: true

        KeyNavigation.left: osdBar; KeyNavigation.right: osdBar
    }

    ScrollBar {
        flickable: listView
        anchors.leftMargin: 3
    }

    states: State {
        name: "playlistOpen"
        when: !osdBar.activeFocus
        PropertyChanges { target: osdPlaylist; anchors.leftMargin: -width }
    }

    transitions: Transition {
        NumberAnimation { properties: "anchors.leftMargin"; duration: 600; easing.type: Easing.OutQuint }
    }
}
