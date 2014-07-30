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

import "../common/rectangles"

FocusScope {
    height: 200

    anchors {
        right: parent.right
        left: parent.left
        top: parent.bottom
    }

    clip: true
    activeFocusOnTab: true

    property bool enabled: true

    VideoBlur {
        anchors.fill: parent
        marginBottom: osdBar.height + osdBar.anchors.topMargin
    }

    Item {
        anchors {
            fill: parent
            leftMargin: TanoUi.osdLRMargin
            rightMargin: TanoUi.osdLRMargin
            topMargin: TanoUi.osdTBMargin
            bottomMargin: TanoUi.osdTBMargin
        }

        OsdButtons {
            id: buttons
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.top: slider.bottom
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        OsdInfo {
            id: info
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
        }

        OsdSlider {
            id: slider
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: info.bottom
        }
    }

    states: State {
        name: "osdOpen"
        when: enabled && !osdPlaylist.activeFocus
        PropertyChanges { target: osdBar; anchors.topMargin: -height }
    }

    transitions: Transition {
        NumberAnimation { properties: "anchors.topMargin"; duration: 600; easing.type: Easing.OutQuint }
    }
}
