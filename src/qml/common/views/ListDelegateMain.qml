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

import "../text"

Rectangle {
    default property alias contents: content.children
    property bool hover: false
    property string value: ""
    property int index: 1

    height: 58
    width: 358
    color: index % 2 ? "#F5F5F5" : "#EFEFEF"

    Rectangle {
        id: ribbon
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        width: height
        color: "#D3D3D3"

        CoreText {
            anchors.fill: parent
            text: value
            color: "#FFFFFF"
            font.pixelSize: 18
            font.weight: Font.Bold
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Item {
        id: content
        anchors {
            fill: parent
            leftMargin: height
        }
    }

    states: [
        State {
            name: "hover"
            when: hover

            PropertyChanges {
                target: ribbon
                color: "#A8A8A8"
            }
        }
    ]

    transitions: Transition {
        ColorAnimation { duration: 200 }
    }
}
