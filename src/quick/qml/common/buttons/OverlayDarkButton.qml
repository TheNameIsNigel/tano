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

import "../rectangles"

Item {
    property alias icon: buttonText.text
    property alias iconColor: buttonText.color
    property bool topMode: false
    property bool isLast: false

    id: rectangle

    height: TanoUi.osdRowHeight
    width: height + (isLast ? 1 : 2)

    OverlayDarkHighlight {
        anchors {
            fill: parent
            topMargin: topMode ? 1 : 0
            bottomMargin: topMode ? 0 : 1
            rightMargin: isLast ? 2 : 3
        }

        Rectangle {
            id: highlight
            anchors.fill: parent
            color: "#00ffffff"
        }

        Text {
            id: buttonText
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 16
            font.family: iconFont.name
        }
    }

    OverlayDarkLineVertical {
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            topMargin: topMode ? 0 : -1
        }
        hasRight: !isLast
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent

        onClicked: {
            //rectangle.forceActiveFocus()
            console.log(buttonText.height, buttonText.width)
        }
    }

    states: [
        State {
            name: "down"
            when: mouseArea.pressedButtons & Qt.LeftButton

            PropertyChanges {
                target: highlight
                color: "#10ffffff"
            }
        },
        State {
            name: "hover"
            when: mouseArea.containsMouse || rectangle.activeFocus

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
