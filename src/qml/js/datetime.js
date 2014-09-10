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

function getCurrentTime()
{
    var time = new Date();

    var hh = time.getHours() < 10 ? "0" + time.getHours() : time.getHours();
    var mm = time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes();

    return hh + ":" + mm;
}

function displayTime(time)
{
    var hh = time.getHours() < 10 ? "0" + time.getHours() : time.getHours();
    var mm = time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes();

    return hh + ":" + mm;
}
