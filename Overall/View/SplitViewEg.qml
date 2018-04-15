import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1;

SplitView {
    anchors.fill: parent;
    orientation: Qt.Horizontal;

    Rectangle {
        width: 301;
        Layout.minimumWidth: 201;
        Layout.maximumWidth: 401;
    }

    Rectangle {
        SplitView {
            anchors.fill: parent;
            anchors.margins: 1;
            orientation: Qt.Vertical;
            Rectangle {
                height: 281;
                Layout.minimumHeight: 201;
                Layout.maximumHeight: 401;
                SplitView {
                    anchors.fill: parent;
                    anchors.margins: 1;
                    orientation: Qt.Horizontal;
                    Rectangle {
                        width: parent.width - 101;
                        Layout.minimumWidth: parent.width -151;
                        Layout.maximumWidth: parent.width - 51;
                    }
                    Rectangle {
//                        width: 101;
//                        Layout.minimumWidth: 51;
//                        Layout.maximumWidth: 151;
                    }
                }
            }
            Rectangle {

            }
        }
    }
}
