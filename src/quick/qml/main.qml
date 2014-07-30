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

import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import "player"

import "js/main.js" as JSMain

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 854
    height: 480

    minimumHeight: 360
    minimumWidth: 640

    property QtObject osd: null
    property QtObject player: null

    // Load the "FontAwesome" font for the monochrome icons.
    FontLoader {
        id: iconFont
        source: "fonts/fontawesome-webfont.ttf"
    }

    menuBar: MenuBar {
        Menu { MenuItem { text: "File" } }
    }

    statusBar: StatusBar {
        RowLayout {
            Label { text: "Test status message" }
        }
    }

    Timer {
        id: mouseTimer
        interval: 1000; repeat: false
        onTriggered: osd.visible = false
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: {
            if (!osd.visible) {
                osd.visible = true
                osd.focus = true
                //mouseTimer.start()
            }
        }
    }

    FocusScope {
        anchors.fill: parent
        focus: true

        PagePlayer {
            id: pagePlayer
            anchors.fill: parent

            focus: true
        }
    }
}
