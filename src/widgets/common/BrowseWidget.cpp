/****************************************************************************
* Tano - An Open IP TV Player
* Copyright (C) 2012 Tadej Novak <tadej@tano.si>
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

#if defined(Qt5)
    #include <QtWidgets/QHBoxLayout>
    #include <QtWidgets/QLineEdit>
    #include <QtWidgets/QPushButton>
    #include <QtWidgets/QToolButton>
#elif defined(Qt4)
    #include <QtGui/QHBoxLayout>
    #include <QtGui/QLineEdit>
    #include <QtGui/QPushButton>
    #include <QtGui/QToolButton>
#endif

#include "../player/widgets/FileDialogs.h"

#include "BrowseWidget.h"

BrowseWidget::BrowseWidget(QWidget *parent)
    : QWidget(parent),
      _resetValue("")
{
    _edit = new QLineEdit(this);
    _browse = new QToolButton(this);
    _browse->setText("...");
    _reset = new QPushButton(this);
    _reset->setIcon(QIcon::fromTheme("view-refresh"));
    _reset->setMaximumSize(26, 26);
    _reset->setMinimumSize(26, 26);

    QHBoxLayout *layout = new QHBoxLayout;
    layout->setMargin(0);
    layout->addWidget(_edit);
    layout->addWidget(_browse);
    layout->addWidget(_reset);
    setLayout(layout);

    connect(_browse, SIGNAL(clicked()), this, SLOT(browse()));
    connect(_reset, SIGNAL(clicked()), this, SLOT(reset()));
}

BrowseWidget::~BrowseWidget()
{
    delete _edit;
    delete _browse;
    delete _reset;
}

void BrowseWidget::browse()
{
    QString b;
    if(_edit->text().isEmpty())
        b = QDir::homePath();
    else
        b = _edit->text();

    QString file = FileDialogs::openByType(_type, b);

    if(file.isEmpty())
        return;

    _edit->setText(file);
}

void BrowseWidget::reset()
{
    _edit->setText(_resetValue);
}

void BrowseWidget::setValue(const QString &value)
{
    _edit->setText(value);
}

QString BrowseWidget::value() const
{
    return _edit->text();
}
