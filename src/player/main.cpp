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

//#include <QtCore/QtPlugin>

//#include "widgets/application/TanoApplication.h"

#include <QtGui/QGuiApplication>

#include <vlc-qt/QmlVideoPlayer.h>

#include "ApplicationWindow.h"

//Q_IMPORT_PLUGIN(TanoConfig)

int main(int argc, char *argv[])
{
    //Q_INIT_RESOURCE(qml);

    qmlRegisterType<VlcQmlVideoPlayer>("VLCQt", 0, 9, "VlcVideoPlayer");

    //if (!TanoApplication::preInit(argc, argv))
    //    return -10;

    QGuiApplication instance(argc, argv);
    // Is another instance of the program is already running
    //if (!instance.shouldContinue())
    //    return 0;

    //if (!instance.postInit())
    //    return -10;

    ApplicationWindow main; //instance.arguments());

    //QObject::connect(&instance, &TanoApplication::activate(), &main, );
    //QObject::connect(&instance, SIGNAL(dockClicked()), &main, SLOT(dockClicked()));

    return instance.exec();
}
