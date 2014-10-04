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

import "menus"
import "pages"
import "player"

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 854
    height: 480

    //color: "#00000000"

    minimumHeight: 360
    minimumWidth: 756

    property QtObject osd: null
    property QtObject player: null

    // Load the "OpenSans" fonts
    FontLoader {
        id: mainFontRegular
        source: "fonts/Open_Sans/OpenSans-Regular.ttf"
    }
    FontLoader {
        id: mainFontSemibold
        source: "fonts/Open_Sans/OpenSans-Semibold.ttf"
    }
    FontLoader {
        id: mainFontBold
        source: "fonts/Open_Sans/OpenSans-Bold.ttf"
    }

    // Load the "FontAwesome" font for the monochrome icons.
    FontLoader {
        id: iconFont
        source: "fonts/fontawesome-webfont.ttf"
    }

    menuBar: MainMenuBar { }

    Timer {
        id: mouseTimer
        interval: 1000; repeat: false
        onTriggered: osd.visible = false
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: {
            if (pagePlayer.visible && !osd.visible) {
                osd.visible = true
                osd.focus = true
                //mouseTimer.start()
            }
        }
    }

    FocusScope {
        anchors.fill: parent
        focus: true

        Navigation {
            id: navigation

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            focus: true
        }

        NavigationStack {
            id: navigationStack

            anchors {
                top: navigation.bottom
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
        }

        PagePlayer {
            id: pagePlayer
            anchors.fill: parent
            visible: false
            //focus: true
        }
    }

    Component.onCompleted: Tano.completed()
}
