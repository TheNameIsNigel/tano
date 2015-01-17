/****************************************************************************
* Tano - An Open IP TV Player
* Copyright (C) 2015 Tadej Novak <tadej@tano.si>
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

import "../common/text"

RowLayout {
    anchors {
        fill: parent
        margins: 4
        rightMargin: 8
    }
    spacing: 4

    Image {
        id: image
        fillMode: Image.PreserveAspectFit
        source: model.logo
        Layout.maximumWidth: parent.height
        Layout.fillHeight: true
    }

    ColumnLayout {
        spacing: 0
        Layout.fillHeight: true

        MainText {
            id: textName
            text: model.name
            font.pointSize: 16
            font.weight: Font.DemiBold
            elide: Text.ElideRight
            Layout.alignment: textEpg.text.length ? Qt.AlignBottom : Qt.AlignVCenter
            Layout.fillWidth: true
        }

        MainText {
            id: textEpg
            text: model.currentEpg
            font.pointSize: 13
            elide: Text.ElideRight
            visible: text.length
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
        }
    }

    MainText {
        id: textNumber
        text: model.number
        font.pixelSize: 20
        font.weight: Font.Bold
    }
}
