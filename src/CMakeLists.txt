#############################################################################
# Tano - An Open IP TV Player
# Copyright (C) 2013 Tadej Novak <tadej@tano.si>
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
# Configuration #
#################
CONFIGURE_FILE(
    ${CMAKE_SOURCE_DIR}/src/Config.h.in
    ${CMAKE_BINARY_DIR}/src/Config.h
)
CONFIGURE_FILE(
    ${CMAKE_SOURCE_DIR}/src/ConfigPlayer.h.in
    ${CMAKE_BINARY_DIR}/src/ConfigPlayer.h
)

ADD_SUBDIRECTORY(core)

IF(BUILD_PLAYER)
    ADD_SUBDIRECTORY(widgets)
ENDIF(BUILD_PLAYER)

IF(BUILD_PLAYER)
    IF(NOT BRANDING STREQUAL "")
        ADD_SUBDIRECTORY(branding)
    ELSE(NOT BRANDING STREQUAL "")
        ADD_SUBDIRECTORY(config)
        ADD_SUBDIRECTORY(player)
    ENDIF(NOT BRANDING STREQUAL "")
ENDIF(BUILD_PLAYER)
