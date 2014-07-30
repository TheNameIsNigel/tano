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
    id: rectangle1
    width: 300
    height: 70
    color: "#00000000"

    Item {
        id: logo

        width: parent.height
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left

    }

    Text {
        id: title
        color: "#ffffff"
        text: "POP TV HD"
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: logo.right
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        font.pixelSize: 24
    }

    Text {
        id: subtitle
        color: "#ffffff"
        text: "Game of Thrones"
        anchors.top: title.bottom
        anchors.topMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: logo.right
        anchors.leftMargin: 8
        font.pixelSize: 20
    }

}
