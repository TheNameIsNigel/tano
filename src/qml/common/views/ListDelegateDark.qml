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

Rectangle {
    default property alias contents: content.children
    property bool down: false
    property bool hover: false

    width: 200
    height: 50
    color: "#0affffff"
    border.width: 1
    border.color: "#0d0e0f"

    Rectangle {
        id: highlight
        anchors.fill: parent
        color: "#00ffffff"
    }

    Rectangle {
        id: ribbon
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: 1
        }

        width: 8
        color: "#292c30"

        Rectangle {
            anchors.fill: parent
            color: "#00ffffff"
            border.width: 1
            border.color: "#0affffff"
        }
    }

    Rectangle {
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: ribbon.right
        }
        color: "#0d0e0f"
        width: 1
    }

    Rectangle {
        id: content
        anchors {
            fill: parent
            margins: 1
            leftMargin: 10
        }
        color: "#00ffffff"
        border.width: 1
        border.color: "#0affffff"
    }

    states: [
        State {
            name: "down"
            when: down

            PropertyChanges {
                target: highlight
                color: "#10ffffff"
            }
        },
        State {
            name: "hover"
            when: hover

            PropertyChanges {
                target: highlight
                color: "#0affffff"
            }
        }
    ]

    transitions: Transition {
        ColorAnimation { duration: 200 }
    }
}
