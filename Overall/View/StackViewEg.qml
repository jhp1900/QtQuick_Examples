import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    property Component stackView0: Rectangle {
        anchors.fill: parent;
        color: "gray";
        Text {
            anchors.centerIn: parent;
            text: qsTr("stackView0");
        }
    }
    property Component stackView1: Rectangle {
        anchors.fill: parent;
        color: "lightGray";
        Text {
            anchors.centerIn: parent;
            text: qsTr("stackView1");
        }
    }
    property Component stackView2: Rectangle {
        anchors.fill: parent;
        color: "darkGrey";
        Text {
            anchors.centerIn: parent;
            text: qsTr("stackView2");
        }
    }
    property Component stackView3: Rectangle {
        anchors.fill: parent;
        color: "lightGreen";
        Text {
            anchors.centerIn: parent;
            text: qsTr("stackView3");
        }
    }

    property var viewMap: {
        "0" : stackView0,
        "1" : stackView1,
        "2" : stackView2,
        "3" : stackView3
    };

    property var testMap: {
        "0" : "stackView0",
        "1" : "stackView1",
        "2" : "stackView2",
        "3" : "stackView3",
        "out" : "Out View"
    };

    Rectangle {
        width: parent.width / 3 * 2;
        height: parent.height / 3 * 2;
        anchors.centerIn: parent;
        color: "red";

        Component {
            id: highlightComponent;
            Rectangle {
                width: listView.width;
                height: listView.rowHeight;
                color: "green"
                border.color: Qt.darker(color, 1.2);
            }
        }

        ListView {
            id: listView;
            width: 60;
            anchors.left: parent.left;
            anchors.top: parent.top;
            anchors.bottom: parent.bottom;
            anchors.margins: 10;
            clip: true;
            model: ListModel {
                ListElement { title: "0"; }
                ListElement { title: "1"; }
                ListElement { title: "2"; }
                ListElement { title: "3"; }
                ListElement { title: "out"; }
            }
            highlightFollowsCurrentItem: true;
            spacing: 5;
            focus: true;
            highlight: highlightComponent;
            delegate: Rectangle {
                width: ListView.view.width;
                height: width;
                color: ListView.isCurrentItem ? "#00000000" : "#33333333";
                border.color: Qt.lighter(color, 1.2);

                Text {
                    anchors.centerIn: parent;
                    text: index;
                }
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        if (title === "out") {
                            stackview.pop();
                            console.log(testMap[title] + " - - " + stackview.depth);
                        }else {
                            listView.currentIndex = index;
                            stackview.push(viewMap[title]);
                            stackview.currentItem.forceActiveFocus();
                            console.log(testMap[title] + " - - " + stackview.depth);
                        }
                    }
                }
            }
        }

        StackView {
            id: stackview;
            anchors.left: listView.right;
            anchors.top: parent.top;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;
            anchors.margins: 10;
            clip: true;
        }
    }
}
