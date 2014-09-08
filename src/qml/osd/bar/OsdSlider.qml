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
    property alias ratio: progress.width

    width: 400
    height: TanoUi.osdProgressHeight
    radius: TanoUi.osdProgressHeight / 2
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#f30e0e0e"
        }

        GradientStop {
            position: 0.5
            color: "#f3161616"
        }

        GradientStop {
            position: 1
            color: "#f30e0e0e"
        }
    }

    Rectangle {
        id: progress
        width: 276
        radius: TanoUi.osdProgressHeight / 2
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#f7f7f7"
            }

            GradientStop {
                position: 0.05
                color: "#e4e4e4"
            }

            GradientStop {
                position: 1
                color: "#d7d7d7"
            }
        }
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.top: parent.top
    }
}
