#############################################################################
# QMediaRemote - DBus media player controller library
# Copyright (C) 2014 Tadej Novak <tadej@tano.si>
# Original author: Rohit Yadav <rohityadav89@gmail.com>
#
# This library is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this library. If not, see <http://www.gnu.org/licenses/>.
#############################################################################
# If it's found it sets LIBQMR_FOUND to TRUE
# and following variables are set:
#  LIBQMR_INCLUDE_DIR
#  LIBQMR_LIBRARY

# FIND_PATH and FIND_LIBRARY normally search standard locations
# before the specified paths. To search non-standard paths first,
# FIND_* is invoked first with specified paths and NO_DEFAULT_PATH
# and then again with no specified paths to search the default
# locations. When an earlier FIND_* succeeds, subsequent FIND_*s
# searching for the same item do nothing.

# Include dir
FIND_PATH(LIBQMR_INCLUDE_DIR qmediaremote/Remote.h
    "$ENV{LIBQMR_INCLUDE_PATH}"
    "$ENV{LIB_DIR}/include"
    "$ENV{LIB_DIR}/include/qmediaremote"
    "/usr/include"
    "/usr/include/qmediaremote"
    "/usr/local/include"
    "/usr/local/include/qmediaremote"
    c:/msys/local/include
    NO_DEFAULT_PATH
)
FIND_PATH(LIBQMR_INCLUDE_DIR Remote.h)

# Library
FIND_LIBRARY(LIBQMR_LIBRARY NAMES qmediaremote PATHS
    "$ENV{LIBQMR_LIBRARY_PATH}"
    "$ENV{LIB_DIR}/lib"
    c:/msys/local/lib
    NO_DEFAULT_PATH
)
FIND_LIBRARY(LIBQMR_LIBRARY NAMES qmediaremote)

IF (LIBQMR_INCLUDE_DIR AND LIBQMR_LIBRARY)
    SET(LIBQMR_FOUND TRUE)
ENDIF (LIBQMR_INCLUDE_DIR AND LIBQMR_LIBRARY)

IF (LIBQMR_FOUND)
    IF (NOT LIBQMR_FIND_QUIETLY)
        MESSAGE(STATUS "Found libqmediaremote include-dir path: ${LIBQMR_INCLUDE_DIR}")
        MESSAGE(STATUS "Found libqmediaremote library path: ${LIBQMR_LIBRARY}")
    ENDIF (NOT LIBQMR_FIND_QUIETLY)
ELSE (LIBQMR_FOUND)
    IF (LIBQMR_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find libqmediaremote")
    ENDIF (LIBQMR_FIND_REQUIRED)
ENDIF (LIBQMR_FOUND)
