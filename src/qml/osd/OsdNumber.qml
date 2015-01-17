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

import "../common/buttons"
import "../common/rectangles"

import "../fonts/IcoMoon/icomoon.js" as IconFont

OverlayLight {
    height: TanoUi.osdRowHeight
    width: 100

    RowLayout {
        anchors {
            fill: parent
            leftMargin: 1
            rightMargin: 1
        }
        spacing: 0

        OverlayDarkButton {
            icon: IconFont.Icon["home"]
            iconColor: "#ffffff"
            isLast: true
            topMode: true
            standalone: true
        }

        Text {
            id: numberText
            color: "#ffffff"
            text: "888"
            font.pixelSize: 16
            font.weight: Font.DemiBold
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }
    }

    Connections {
        target: TanoChannelSelect
        onDisplayNumber: numberText.text = number
    }
}
