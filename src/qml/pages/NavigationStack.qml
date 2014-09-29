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

FocusScope {
    id: stack

    PageHome {
        id: pageHome
        anchors.fill: parent
        focus: true
    }

    PageChannels {
        id: pageChannels
        anchors.fill: parent
        anchors.leftMargin: stack.width
    }

    PageSchedule {
        id: pageSchedule
        anchors.fill: parent
        anchors.leftMargin: 2 * stack.width
    }

    states: [
        State {
            name: "activeChannel"
            when: navigation.index == 1
            PropertyChanges { target: pageHome; anchors.leftMargin: -stack.width }
            PropertyChanges { target: pageChannels; anchors.leftMargin: 0 }
            PropertyChanges { target: pageSchedule; anchors.leftMargin: stack.width }
        },

        State {
            name: "activeSchedule"
            when: navigation.index == 2
            PropertyChanges { target: pageHome; anchors.leftMargin: -2 * stack.width }
            PropertyChanges { target: pageChannels; anchors.leftMargin: -stack.width }
            PropertyChanges { target: pageSchedule; anchors.leftMargin: 0 }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties: "anchors.leftMargin"; duration: 300; easing.type: Easing.OutQuint }
    }
}
