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
    id: rectangle
    height: width

    color: "#20ffffff"

    property alias size: rectangle.width
    property alias icon: buttonText.text
    property alias iconColor: buttonText.color

    Text {
        id: buttonText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 22
        font.family: iconFont.name
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent

        onClicked: {
            rectangle.forceActiveFocus()
        }
    }

    states: [
        State {
            name: "down"
            when: mouseArea.pressedButtons & Qt.LeftButton

            PropertyChanges {
                target: rectangle
                color: "#80ffffff"
            }
        },
        State {
            name: "hover"
            when: mouseArea.containsMouse || rectangle.activeFocus

            PropertyChanges {
                target: rectangle
                color: "#66ffffff"
            }
        }
    ]
}
