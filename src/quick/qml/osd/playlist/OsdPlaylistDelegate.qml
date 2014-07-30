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

Item {
    id: osdPlaylistDelegate

    width: 300
    height: 56

    Rectangle {
        id: rectangleLight
        color: "#353535"

        anchors {
            fill: parent
            margins: 3
        }

        Rectangle {
            id: rectangleDark
            color: "#2b2b2b"

            width: parent.height
            anchors {
                bottom: parent.bottom
                left: parent.left
                top: parent.top
            }

            Image {
                id: image
                fillMode: Image.PreserveAspectFit
                width: parent.height
                anchors.margins: 5
                anchors.fill: parent
                source: "../../img/logo.png"
            }
        }

        Item {
            anchors.left: rectangleDark.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 5

            Text {
                id: textNumber
                color: "#ffffff"
                text: number
                font.pointSize: 19
                verticalAlignment: Text.AlignVCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.rightMargin: 3
                font.family: "Helvetica Neue"
                font.weight: Font.Bold
            }

            Text {
                id: textName
                color: "#ffffff"
                text: name
                font.pointSize: 17
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.right: textNumber.left
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                font.family: "Helvetica Neue"
                font.weight: Font.DemiBold

                elide: Text.ElideRight
            }

            Text {
                color: "#ffffff"
                text: "Game of Thrones"
                font.pointSize: 14
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.top: textName.bottom
                anchors.right: textNumber.left
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                font.family: "Helvetica Neue"
                font.weight: Font.DemiBold

                elide: Text.ElideRight
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.margins: 3

        hoverEnabled: osdPlaylistDelegate.ListView.view.verticalVelocity === 0

        onEntered: {
            osdPlaylistDelegate.ListView.view.currentIndex = index
            osdPlaylistDelegate.forceActiveFocus()
        }

        /*onExited: {
            osdPlaylistDelegate.ListView.view.currentIndex = -1
        }*/

        onClicked: {
            //rectangle.forceActiveFocus()
        }
    }
}
