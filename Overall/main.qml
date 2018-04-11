import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "View"

Window {
    id: root;
    visible: true
    width: 480
    height: 800
    title: qsTr("ExamplesOcerall")

    FontLoader {
        id: openSans
        source: "qrc:/fonts/OpenSans-Regular.ttf"
     }

    property Component splitViewEg: SplitViewEg{}

    property var componentMap: {
        "SplitViewEg": splitViewEg
    };

    StackView {
        id: stackView;
        anchors.fill: parent;
        initialItem: ListView {
            model: ListModel {
                ListElement { title: "SplitViewEg"; }
                ListElement { title: "CircularGauge1"; }
                ListElement { title: "CircularGauge2"; }
                ListElement { title: "CircularGauge3"; }
                ListElement { title: "CircularGauge4"; }
                ListElement { title: "CircularGauge5"; }
            }
            delegate: Button {
                width: stackView.width;
                height: root.height * 0.125;
                text: title;

                style: BlackButtonStyle {
                    fontColor: "#e7e7e7";
                    rightAlignedIconSource: "qrc:/images/icon-go.png";
                }

                onClicked: {
                    if (stackView.depth === 1) {
                        stackView.push({item: componentMap[title]});
                        stackView.currentItem.forceActiveFocus();
                    }
                }
            }
        }
    }
}
