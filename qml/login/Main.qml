import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    width: 547
    height: 471
    title: qsTr("Chat Login")
    color: "#b8e6b8"   // 浅绿色背景
    minimumWidth: 547
    maximumWidth: 547
    minimumHeight: 471
    maximumHeight: 471

        // 保留系统按钮（最小化、最大化、关闭）
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowSystemMenuHint | Qt.WindowMinMaxButtonsHint

    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.6
        radius: 10
        color: "#68b368"  // 深绿色
        border.color: "#4a8f4a"
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            Label {
                text: qsTr("Welcome to Chat")
                font.pixelSize: 24
                color: "#ffaa33"  // 橙黄色
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            TextField {
                id: usernameField
                placeholderText: qsTr("Username")
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#ffcc66"  // 橙黄色背景
                    radius: 5
                }
                palette.text: "#000000"
            }

            TextField {
                id: passwordField
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#ffcc66"  // 橙黄色背景
                    radius: 5
                }
                palette.text: "#000000"
            }

            Button {
                text: qsTr("Login")
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#ffaa33"  // 橙黄色按钮
                    radius: 5
                }
                onClicked: {
                    if (usernameField.text === "" || passwordField.text === "") {
                        console.log("Please fill username and password")
                    } else {
                        console.log("Logging in with", usernameField.text)
                        var component = Qt.createComponent("qrc:/qml/chatMain/MainWindowOfChat.qml");
                        if (component.status === Component.Ready) {
                            var window = component.createObject(null, {
                                "username": usernameField.text  // 可传参数给MainChat.qml
                            });
                            if (window !== null) {
                                window.show();  // 显示新窗口
                                window.title = "Chat - " + usernameField.text;
                            } else {
                                console.log("Failed to create MainChat window");
                            }
                        } else {
                            console.log("Failed to load MainChat.qml:", component.errorString());
                        }
                    }
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 10

                CheckBox {
                    text: qsTr("Remember me")
                    indicator: Rectangle {
                        width: 16
                        height: 16
                        radius: 3
                        border.color: "#ffaa33"
                        color: control.checked ? "#ffaa33" : "#ffffff"
                    }
                    font.bold: true
                }

                Button {
                    text: qsTr("Register")
                    background: Rectangle {
                        color: "#ffaa33"
                        radius: 5
                    }
                    onClicked: {
                        console.log("Go to register page")
                    }
                }
            }
        }
    }
}
