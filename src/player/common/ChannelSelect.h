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

#ifndef TANO_CHANNELSELECT_H_
#define TANO_CHANNELSELECT_H_

#include <QtCore/QTimer>

class ChannelSelect : public QObject
{
Q_OBJECT
public:
    ChannelSelect(QObject *parent);
    ~ChannelSelect();

public slots:
    void process(int key);

    inline void back() { channel(false); }
    void channel(bool direction);
    inline void next() { channel(true); }

    inline void setChannels(const QList<int> &list) { _channels = list; }

private slots:
    void display();

signals:
    void channelSelect(const int channel);
    void displayNumber(const int number);

private:
    QList<int> _channels;
    QTimer *_timer;

    int _current;
    int _digit;
    int _full;
    int _number[3];
};

#endif // TANO_CHANNELSELECT_H_
