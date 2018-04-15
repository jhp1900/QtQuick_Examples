import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    Rectangle {
        id: centreRect;
        width: parent.width / 3 * 2;
        height: parent.height / 3 * 2;
        anchors.centerIn: parent;
        color: "lightgray";

        TabBar {
            id: tabBar;
            anchors.left: parent.left;
            anchors.top: parent.top;
            anchors.right: parent.right;
            currentIndex: swipeView.currentIndex;

            TabButton { text: "1"; }
            TabButton { text: "2"; }
            TabButton { text: "3"; }
            TabButton { text: "4"; }
        }

        SwipeView {
            id: swipeView;
            anchors.left: parent.left;
            anchors.top: tabBar.bottom;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;
            currentIndex: tabBar.currentIndex;
            clip: true;

            Rectangle {
                color: "gray";
                Text {
                    anchors.centerIn: parent;
                    text: qsTr("1");
                }
            }
            Rectangle {
                color: "lightgray";
                Text {
                    anchors.centerIn: parent;
                    text: qsTr("2");
                }
            }
            Rectangle {
                color: "green";
                Text {
                    anchors.centerIn: parent;
                    text: qsTr("3");
                }
            }
            Rectangle {
                color: "lightgreen";
                Text {
                    anchors.centerIn: parent;
                    text: qsTr("4");
                }
            }
        }
    }
}
