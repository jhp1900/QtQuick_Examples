import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

SplitView {
    anchors.fill: parent;
    orientation: Qt.Horizontal;

    Rectangle {
        width: 200;
        color: "gray";
    }
    Rectangle {
        width: 100;
        color: "gray";
    }
    Rectangle {
        SplitView {
            anchors.fill: parent;
            orientation: Qt.Vertical;
            Rectangle {
                height: 200;
                color: "lightgray";
            }
            Rectangle {
                color: "lightgray";
            }
        }
    }
}
