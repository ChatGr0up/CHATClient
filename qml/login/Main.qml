import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    width: 547
    height: 471
    title: qsTr("Chat Login")
    color: "#f0f0f0"

    Rectangle {
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.6
        radius: 10
        color: "#ffffff"
        border.color: "#cccccc"
        border.width: 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            Label {
                text: qsTr("Welcome to Chat")
                font.pixelSize: 24
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

            TextField {
                id: usernameField
                placeholderText: qsTr("Username")
                Layout.fillWidth: true
            }

            TextField {
                id: passwordField
                placeholderText: qsTr("Password")
                echoMode: TextInput.Password
                Layout.fillWidth: true
            }

            Button {
                text: qsTr("Login")
                Layout.fillWidth: true
                onClicked: {
                    if (usernameField.text === "" || passwordField.text === "") {
                        console.log("Please fill username and password")
                    } else {
                        console.log("Logging in with", usernameField.text)
                        // 这里可以调用后端逻辑
                    }
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 10

                CheckBox {
                    text: qsTr("Remember me")
                }

                Button {
                    text: qsTr("Register")
                    onClicked: {
                        console.log("Go to register page")
                    }
                }
            }
        }
    }
}
