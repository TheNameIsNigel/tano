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

import "../../js/datetime.js" as TanoDate

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

    OverlayLight {
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

                Image {
                    id: imageLogo
                    anchors {
                        fill: parent
                        margins: 4
                    }
                    fillMode: Image.PreserveAspectFit
                }
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

                    OverlayDarkText {
                        id: title
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                    }

                    OverlayDarkText {
                        id: subtitle
                        font.pixelSize: 16
                        Layout.fillWidth: true
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

                        OverlayDarkText {
                            id: timeStart
                            font.pixelSize: 13
                        }

                        OsdSlider {
                            id: slider
                            Layout.fillWidth: true
                        }

                        OverlayDarkText {
                            id: timeEnd
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
                    }

                    OsdButtons {
                        id: buttonsLeft
                        height: parent.height
                        model: OsdButtonsLeft { }
                    }

                    OsdButtons {
                        id: buttonsRight
                        height: parent.height
                        Layout.alignment: Qt.AlignRight
                        model: OsdButtonsRight { }
                        isRight: true
                    }
                }
            }
        }
    }

    Connections {
        target: TanoPlayback
        onChannelInfo: {
            title.text = name
            imageLogo.source = logo

            osdBar.focus = true
        }
    }

    Connections {
        target: TanoXmltv
        onCurrent: {
            subtitle.text = epg[1]
            timeStart.text = TanoDate.displayTime(new Date(epg[2] * 1000))
            timeEnd.text = TanoDate.displayTime(new Date(epg[3] * 1000))
            slider.ratio = (new Date().getTime() - new Date(epg[2] * 1000).getTime()) / (new Date(epg[3] * 1000).getTime() - new Date(epg[2] * 1000).getTime())
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
