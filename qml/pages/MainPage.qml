/*******************************************************************************
**
** Copyright (C) 2022 ru.auroraos
**
** This file is part of the Моё приложение для ОС Аврора project.
**
** Redistribution and use in source and binary forms,
** with or without modification, are permitted provided
** that the following conditions are met:
**
** * Redistributions of source code must retain the above copyright notice,
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice,
**   this list of conditions and the following disclaimer
**   in the documentation and/or other materials provided with the distribution.
** * Neither the name of the copyright holder nor the names of its contributors
**   may be used to endorse or promote products derived from this software
**   without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
** THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
** IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
** OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
** PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS;
** OR BUSINESS INTERRUPTION)
** HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
** WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
** EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("lab2")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

//    Row {
//        id: colorTools
//        anchors {
//            horizontalCenter: parent.horizontalCenter
//            top: parent.top
//            topMargin: 8
//        }

//        Slider {
//            id: lineWidthSlider
//            x: -80
//            width: 400
//            minimumValue: 1
//            maximumValue: 100
//            stepSize: 1
//            value: 2
//            onValueChanged: {
//                canvas.lineWidth = value
//            }
//        }

//        property color paintColor: "#33B5E5"
//        spacing: 4

//        Repeater {
//            model: ["#33B5E5", "#99CC00", "#FFBB33", "#FF4444", "pink"]

//            Button {
//                id: rect
//                color: modelData
//                width: 50
//                height: 50
//                backgroundColor: parent.paintColor = color
//                onClicked: {
//                    parent.paintColor = color
//                }
//            }
//        }
//    }

//    Canvas {
//        id: canvas
//        anchors {
//            left: parent.left
//            right: parent.right
//            top: colorTools.bottom
//            bottom: parent.bottom
//            margins: 8
//        }

//        property real lastX
//        property real lastY
//        property color color: colorTools.paintColor
//        property real lineWidth: lineWidthSlider.value
//        onPaint: {
//            var ctx = getContext('2d')
//            ctx.lineWidth = canvas.lineWidth
//            ctx.strokeStyle = canvas.color
//            ctx.beginPath()
//            ctx.moveTo(lastX, lastY)
//            lastX = area.mouseX
//            lastY = area.mouseY
//            ctx.lineTo(lastX, lastY)
//            ctx.stroke()
//        }
//        MouseArea {
//            id: area
//            anchors.fill: parent
//            onPressed: {
//                canvas.lastX = mouseX
//                canvas.lastY = mouseY
//            }
//            onPositionChanged: {
//                canvas.requestPaint()
//            }
//       }
//    }

//    Rectangle {                                           //вторая часть
//        id: myRect
//        width: 250; height: 250
//        color: "lightgreen"
//        //width: 400; height: 400
//        //color: "blue"
//        //transform: Rotation { origin.x: 25; origin.y: 25; angle: 45}
//        //transform: Scale { origin.x: 25; origin.y: 25; xScale: 3}
//        Text {
//            anchors.centerIn: parent
//            text: qsTr("Привет, мир! :)")
//        }

//        MouseArea {
//            id: mouseArea
//            anchors.fill: parent
//            onClicked: myRect.state == 'clicked' ? myRect.state = "" : myRect.state = 'clicked';
//        }
//        states: [
//            State {
//                name: "clicked"
//                PropertyChanges { target: myRect; x: 400; y: 1000 }
//            }
//        ]
//    }
//    ListView {
//        id: listView
//        width: parent.width
//        height: parent.height
//        model: ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
//        delegate: Item {
//            width: parent.width
//            height: 100
//            Text {
//                text: modelData
//                font.pointSize: 32
//                anchors.centerIn: parent
//            }
//            MouseArea {
//                id: mouseArea
//                anchors.fill: parent
//                onClicked: {
//                    console.log("Clicked: " + modelData)
//                }
//                onPressed: {
//                    console.log("Pressed: " + modelData)
//                    // Запуск анимации
//                }
//                onReleased: {
//                    console.log("Released: " + modelData)
//                    // Остановка анимации
//                }
//                onPositionChanged: {
//                    console.log("Position changed: " + modelData)
//                    // Остановка анимации и выполнение соответствующих действий
//                }
//            }
//        }
//    }

    Rectangle {
        width: 100
        height: 100
        color: "lightgreen"
        anchors.centerIn: parent
        RotationAnimation on rotation {
            loops: Animation.Infinite
            from: 0
            to: 360
        }
    }

    Rectangle {
        id: rect
        width: 400
        height: 400
        color: "red"
        Behavior on x {
            NumberAnimation {
                duration: 1000
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                rect.x += 300
            }
        }
    }

    Rectangle {
        id: rect1
        width: 100; height: 100
        color: "blue"
        SequentialAnimation {
            running: true
            NumberAnimation { target: rect1; property: "x"; to: 500; duration: 1000 }
            NumberAnimation { target: rect1; property: "y"; to: 500; duration: 1000 }
        }
    }

    Rectangle {
        id: rect2
        width: 100; height: 100
        color: "pink"
        ParallelAnimation {
            running: true
            NumberAnimation { target: rect2; property: "x"; to: 300; duration: 1000 }
            NumberAnimation { target: rect2; property: "y"; to: 300; duration: 1000 }
        }
    }

    Rectangle{
        id: rect3
        property bool isAnimating: false
        width: 300
        height: 300
        color: "salmon"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!rect3.isAnimating)
                    animation.running = true
                else
                    animation.stop()
            }
        }
        NumberAnimation {
            id: animation
            target: rect3
            property: "width"
            to: 200
            duration: 500
            onStarted: rect3.isAnimating = true
            onStopped: rect3.isAnimating = false
        }
    }

    Item {
    id: container
    width: 500; height: 500
    Rectangle {
        id: myRect
        width: 200; height: 200
        color: "white"
    }
        states: State {
            name: "reanchored"
            AnchorChanges { target: myRect; anchors.right: container.right }
        }
        transitions: Transition {
            // smoothly reanchor myRect and move into new position
            AnchorAnimation { duration: 1000 }
        }
        Component.onCompleted: container.state = "reanchored"
    }
    Item {
        width: 200; height: 100
        Rectangle {
            id: redRect
            width: 250; height: 250
            color: "black"
        }
        Rectangle {
            id: blueRect
            x: redRect.width
            width: 200; height: 200
            color: "grey"
            states: State {
                name: "reparented"
                ParentChange { target: blueRect; parent: redRect; x: 10; y: 10 }
            }
            transitions: Transition {
                ParentAnimation {
                    NumberAnimation { properties: "x,y"; duration: 1000 }
                }
            }
            MouseArea { anchors.fill: parent; onClicked: blueRect.state ="reparented" }
        }
    }
}



