#############################################################################
# Tano - An Open IP TV Player
# Copyright (C) 2014 Tadej Novak <tadej@tano.si>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>./
#############################################################################

PROJECT(${TANO_QUICK})

# Add definitions for static library
ADD_DEFINITIONS(-DQT_STATIC -D_REENTRANT -DQML_IMPORT_PATH=qml/)

SET(Tano_Quick_Qml
    qml/main.qml

    qml/common/buttons/OverlayDarkButton.qml
    qml/common/rectangles/OverlayDark.qml
    qml/common/rectangles/OverlayDarkHighlight.qml
    qml/common/rectangles/OverlayDarkLineHorizontal.qml
    qml/common/rectangles/OverlayDarkLineVertical.qml
    qml/common/rectangles/VideoBlur.qml
    qml/common/views/ScrollBar.qml

    qml/fonts/fontawesome-webfont.js

    qml/menus/MainMenuBar.qml
    qml/menus/MenuFile.qml
    qml/menus/MenuPlayback.qml

    qml/osd/OsdMain.qml
    qml/osd/OsdNumber.qml

    qml/osd/bar/OsdBar.qml
    qml/osd/bar/OsdButtons.qml
    qml/osd/bar/OsdButtonsModel.qml
    qml/osd/bar/OsdInfo.qml
    qml/osd/bar/OsdSlider.qml

    qml/osd/playlist/OsdPlaylist.qml
    qml/osd/playlist/OsdPlaylistDelegate.qml
    qml/osd/playlist/OsdPlaylistHighlight.qml

    qml/player/PagePlayer.qml
    qml/player/PlayerVideo.qml
)


SET(Tano_Quick_Srcs
    ApplicationWindow.cpp

    common/ChannelSelect.cpp
    common/Constants.cpp

    elements/EpgElement.cpp
    elements/PlaybackElement.cpp
    elements/PlaylistElement.cpp

    qml/qml.qrc

    ${Tano_Quick_Qml}
)

###############
# Qt settings #
###############
# This script runs the user interface compiler uic
#QT5_WRAP_UI(Tano_Quick_UIC_Srcs ${Tano_Quick_UIs})

#####################
# Compiler settings #
#####################
# This needs to be added in order for #include to work inside .cpp files
INCLUDE_DIRECTORIES(
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_SOURCE_DIR}/src/core
    ${CMAKE_SOURCE_DIR}/src/quick
    ${CMAKE_SOURCE_DIR}/src/widgets
    ${CMAKE_BINARY_DIR}
    ${CMAKE_BINARY_DIR}/src
    ${CMAKE_BINARY_DIR}/src/quick
)

# Include additional libraries
INCLUDE_DIRECTORIES(${LIBVLCQT_INCLUDE_DIR})


# This line tells cmake to create the Tano Widgets library.
ADD_LIBRARY(${TANO_QUICK} STATIC ${Tano_Quick_Srcs})
ADD_DEPENDENCIES(${TANO_QUICK} ${TANO_CORE})

# MSVC: Avoid Debug/Release/... subfolders
IF(MSVC)
    SET_TARGET_PROPERTIES(${TANO_QUICK} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ".")
    SET_TARGET_PROPERTIES(${TANO_QUICK} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY_DEBUG ".")
    SET_TARGET_PROPERTIES(${TANO_QUICK} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY_RELEASE ".")
    SET_TARGET_PROPERTIES(${TANO_QUICK} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY_RELWITHDUBUGINFO ".")
    SET_TARGET_PROPERTIES(${TANO_QUICK} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ".")
    SET_TARGET_PROPERTIES(${TANO_QUICK} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY_PROFILE ".")
ENDIF()

# Here the needed Libraries are added to the link command.
TARGET_LINK_LIBRARIES(${TANO_QUICK} Qt5::Qml Qt5::Widgets)
