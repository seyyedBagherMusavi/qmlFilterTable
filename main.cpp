#include <QtWidgets/qapplication.h>
#include <QtQml/qqmlapplicationengine.h>
#include <QtQml/qqml.h>
#include "sortfilterproxymodel.h"
//#include "targetmodel.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<SortFilterProxyModel>("SortFilterProxyModel", 1, 0, "SortFilterProxyModel");

    QQmlApplicationEngine engine(QUrl("qrc:/main.qml"));
    return app.exec();
}
