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

#include "core/Common.h"

#include "common/Constants.h"

QQmlPropertyMap *Tano::Quick::common()
{
    QQmlPropertyMap *commonConstantsData = new QQmlPropertyMap();

    commonConstantsData->insert("tanoVersion", Tano::version());

    return commonConstantsData;
}

QQmlPropertyMap *Tano::Quick::ui()
{
    QQmlPropertyMap *uiConstantsData = new QQmlPropertyMap();
    // OSD
    uiConstantsData->insert("osdLRMargin", 100);
    uiConstantsData->insert("osdTBMargin", 25);

    return uiConstantsData;
}
