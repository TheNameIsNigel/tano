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
import QtQuick.Layouts 1.1

import "../../common/rectangles"
import "../../common/text"
import "../../common/views"

ListDelegateDark {
    id: osdPlaylistDelegate
    width: 300
    height: 56

    down: mouseArea.pressedButtons & Qt.LeftButton
    hover: mouseArea.containsMouse || osdPlaylistDelegate.activeFocus

    Item {
        id: imageContainer
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }

        width: parent.height

        Image {
            id: image
            anchors {
                fill: parent
                margins: 4
            }
            fillMode: Image.PreserveAspectFit
            source: model.logo
        }
    }

    ColumnLayout {
        id: info
        spacing: 0
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: imageContainer.right
            right: textNumber.left
            leftMargin: 4
            rightMargin: 4
        }

        OverlayDarkText {
            id: textName
            text: model.name
            font.pointSize: 16
            font.weight: Font.DemiBold
            elide: Text.ElideRight
            Layout.alignment: textEpg.text.length ? Qt.AlignBottom : Qt.AlignVCenter
        }

        OverlayDarkText {
            id: textEpg
            text: model.currentEpg
            font.pointSize: 13
            elide: Text.ElideRight
            visible: text.length
            Layout.alignment: Qt.AlignTop
        }
    }

    OverlayDarkText {
        id: textNumber
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            rightMargin: 4
        }
        text: model.number
        font.pointSize: 20
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Bold
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
            console.log('Selected channel: ' + model.name)
        }
    }
}
