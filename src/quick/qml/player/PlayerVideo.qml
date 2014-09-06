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
import VLCQt 0.9

Rectangle {
    id: playerVideo
    width: 854
    height: 480
    color: "#000000"

    /*VlcVideoPlayer {
        id: player
        anchors.fill: parent
        //url: "http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_640x360.m4v"

        url: "/Users/tadej/Movies/BBB720p.avi"
        autoplay: false

        Component.onCompleted: mainWindow.player = player
    }*/

    Image {
        id: tempVideo
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: "../img/bg.jpg"
    }

    /*Connections {
        target: TanoPlayback
        onPlayUrl: player.url = url
    }*/
}
