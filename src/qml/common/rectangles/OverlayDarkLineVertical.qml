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
    property bool hasLeft: true
    property bool hasRight: true

    width: 1 + (hasLeft ? 1 : 0) + (hasRight ? 1 : 0)
    height: 200

    Rectangle {
        id: lineLeft
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        width: hasLeft ? 1 : 0
        color: "#f3272729"
    }

    Rectangle {
        id: lineCenter
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: hasLeft ? 1 : 0
            rightMargin: hasRight ? 1 : 0
        }

        color: "#f30d0d0e"
    }

    Rectangle {
        id: lineRight
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        width: hasRight ? 1 : 0
        color: "#f3272729"
    }
}
