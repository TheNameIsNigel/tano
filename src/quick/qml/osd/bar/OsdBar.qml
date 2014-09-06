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

FocusScope {
    height: 2 * TanoUi.osdRowHeight + 5 * TanoUi.osdProgressHeight + 2 * 2 + 2 * TanoUi.osdTBMargin + 1

    anchors {
        right: parent.right
        left: parent.left
        top: parent.bottom
    }

    clip: true
    activeFocusOnTab: true

    property bool enabled: false

    OverlayDark {
        anchors {
            fill: parent
            leftMargin: TanoUi.osdLRMargin
            rightMargin: TanoUi.osdLRMargin
            topMargin: TanoUi.osdTBMargin
            bottomMargin: TanoUi.osdTBMargin
        }

        RowLayout {
            anchors.fill: parent
            spacing: 0

            OverlayDarkHighlight {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    margins: 1
                }
                width: height
            }

            OverlayDarkLineVertical {
                height: parent.height
                hasRight: false
            }

            Column {
                height: parent.height
                Layout.fillWidth: true

                RowLayout {
                    height: TanoUi.osdRowHeight
                    spacing: 8
                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: 8
                        rightMargin: 8
                    }

                    Text {
                        id: title
                        color: "#ffffff"
                        text: "POP TV HD"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                    }

                    Text {
                        id: subtitle
                        color: "#ffffff"
                        text: "Game of Thrones"
                        font.pixelSize: 16
                    }
                }

                OverlayDarkLineHorizontal {
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }

                OverlayDarkHighlight {
                    height: 5 * TanoUi.osdProgressHeight + 1
                    anchors {
                        left: parent.left
                        right: parent.right
                    }

                    RowLayout {
                        spacing: 8
                        anchors {
                            fill: parent
                            bottomMargin: 1
                            leftMargin: 8
                            rightMargin: 8
                        }

                        Text {
                            id: timeStart
                            color: "#ffffff"
                            text: "00:00:00"
                            font.pixelSize: 13
                        }

                        OsdSlider {
                            id: slider
                            Layout.fillWidth: true
                        }

                        Text {
                            id: timeEnd
                            color: "#ffffff"
                            text: "01:12:12"
                            font.pixelSize: 13
                        }
                    }
                }

                OverlayDarkLineHorizontal {
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                }

                RowLayout {
                    height: TanoUi.osdRowHeight
                    anchors {
                        left: parent.left
                        right: parent.right
                        rightMargin: 1
                    }

                    OsdButtons {
                        id: buttons
                        anchors.fill: parent
                    }
                }
            }
        }
    }



    states: State {
        name: "osdOpen"
        when: enabled && !osdPlaylist.activeFocus
        PropertyChanges { target: osdBar; anchors.topMargin: -height }
    }

    transitions: Transition {
        NumberAnimation { properties: "anchors.topMargin"; duration: 600; easing.type: Easing.OutQuint }
    }
}
