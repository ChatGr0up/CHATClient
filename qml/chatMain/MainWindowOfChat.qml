import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 700
    title: qsTr("微信风格聊天")
    color: "#f5f5f5"

    // 顶部导航栏
    Rectangle {
        id: topBar
        width: parent.width
        height: 60
        color: "#2e2e2e"
        z: 2

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Text {
                text: "微信"
                color: "white"
                font.pixelSize: 20
                font.bold: true
                Layout.leftMargin: 15
            }

            Item { Layout.fillWidth: true }

            Button {
                icon.source: "qrc:/icons/search.svg"
                icon.color: "white"
                flat: true
                Material.background: "transparent"
            }

            Button {
                icon.source: "qrc:/icons/add.svg"
                icon.color: "white"
                flat: true
                Material.background: "transparent"
            }
        }
    }

    // 底部导航栏
    Rectangle {
        id: bottomBar
        width: parent.width
        height: 60
        anchors.bottom: parent.bottom
        color: "#f9f9f9"
        z: 2

        RowLayout {
            anchors.fill: parent
            spacing: 0

            BottomNavButton {
                icon: "💬"
                text: "微信"
                selected: true
                Layout.fillWidth: true
            }

            BottomNavButton {
                icon: "📞"
                text: "通讯录"
                Layout.fillWidth: true
            }

            BottomNavButton {
                icon: "🔍"
                text: "发现"
                Layout.fillWidth: true
            }

            BottomNavButton {
                icon: "👤"
                text: "我"
                Layout.fillWidth: true
            }
        }
    }

    // 主内容区域
    Rectangle {
        id: mainContent
        width: parent.width
        height: parent.height - topBar.height - bottomBar.height
        anchors.top: topBar.bottom
        color: "#f5f5f5"

        RowLayout {
            anchors.fill: parent
            spacing: 0

            // 左侧联系人列表
            Rectangle {
                width: 280
                Layout.fillHeight: true
                color: "#f5f5f5"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 搜索框
                    Rectangle {
                        id: searchBox
                        Layout.topMargin: 10
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        Layout.preferredHeight: 36
                        Layout.preferredWidth: parent.width - 20
                        radius: 6
                        color: "#e5e5e5"

                        RowLayout {
                            anchors.fill: parent
                            spacing: 5

                            Text {
                                text: "🔍"
                                font.pixelSize: 14
                                Layout.leftMargin: 10
                            }

                            Text {
                                text: "搜索"
                                color: "#999999"
                                font.pixelSize: 14
                            }

                            Item { Layout.fillWidth: true }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("搜索点击")
                            }
                        }
                    }

                    // 联系人列表
                    ListView {
                        id: contactList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        clip: true
                        model: ListModel {
                            ListElement {
                                name: "微信团队";
                                lastMsg: "欢迎使用微信";
                                time: "10:30";
                                unread: 0;
                                pinned: true;
                            }
                            ListElement {
                                name: "Alice";
                                lastMsg: "下午一起去喝咖啡吗？";
                                time: "09:15";
                                unread: 2;
                                pinned: true;
                            }
                            ListElement {
                                name: "Bob";
                                lastMsg: "项目文档已经发给你了";
                                time: "昨天";
                                unread: 0;
                                pinned: false;
                            }
                            ListElement {
                                name: "Charlie";
                                lastMsg: "周末有什么计划？";
                                time: "昨天";
                                unread: 1;
                                pinned: false;
                            }
                            ListElement {
                                name: "设计小组";
                                lastMsg: "Diana：初稿已经完成了";
                                time: "星期三";
                                unread: 0;
                                pinned: false;
                            }
                            ListElement {
                                name: "David";
                                lastMsg: "会议改到3点了";
                                time: "星期二";
                                unread: 0;
                                pinned: false;
                            }
                            ListElement {
                                name: "Eva";
                                lastMsg: "生日快乐！";
                                time: "星期一";
                                unread: 0;
                                pinned: false;
                            }
                        }

                        delegate: Rectangle {
                            width: contactList.width
                            height: 70
                            color: index === contactList.currentIndex ? "#e5e5e5" : "white"

                            RowLayout {
                                anchors.fill: parent
                                spacing: 10
                                anchors.margins: 10

                                // 头像
                                Rectangle {
                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 50
                                    radius: 4
                                    color: "#07C160"

                                    Text {
                                        anchors.centerIn: parent
                                        text: name.substring(0, 1)
                                        color: "white"
                                        font.pixelSize: 18
                                        font.bold: true
                                    }
                                }

                                // 消息信息
                                ColumnLayout {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    spacing: 4

                                    RowLayout {
                                        Layout.fillWidth: true

                                        Text {
                                            text: name
                                            font.pixelSize: 16
                                            color: "#333333"
                                            elide: Text.ElideRight
                                            Layout.fillWidth: true
                                        }

                                        Text {
                                            text: time
                                            font.pixelSize: 12
                                            color: "#999999"
                                        }
                                    }

                                    RowLayout {
                                        Layout.fillWidth: true

                                        Text {
                                            text: lastMsg
                                            font.pixelSize: 14
                                            color: "#999999"
                                            elide: Text.ElideRight
                                            Layout.fillWidth: true
                                        }

                                        // 未读消息计数
                                        Rectangle {
                                            visible: unread > 0
                                            Layout.preferredWidth: 18
                                            Layout.preferredHeight: 18
                                            radius: 9
                                            color: "#FA5151"

                                            Text {
                                                anchors.centerIn: parent
                                                text: unread
                                                color: "white"
                                                font.pixelSize: 12
                                            }
                                        }
                                    }
                                }
                            }

                            // 置顶标识
                            Rectangle {
                                visible: pinned
                                anchors.top: parent.top
                                anchors.right: parent.right
                                width: 10
                                height: 10
                                color: "#FA5151"
                                radius: 5
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    contactList.currentIndex = index
                                    chatModel.clear()
                                    // 添加一些示例消息
                                    chatModel.append({fromMe: false, text: "你好！最近怎么样？", time: "09:15"})
                                    chatModel.append({fromMe: true, text: "还不错，刚刚完成了一个项目。", time: "09:16"})
                                    chatModel.append({fromMe: false, text: "太好了！下午一起去喝咖啡吗？", time: "09:17"})
                                }
                            }
                        }

                        ScrollBar.vertical: ScrollBar {
                            policy: ScrollBar.AsNeeded
                        }
                    }
                }
            }

            // 分隔线
            Rectangle {
                Layout.preferredWidth: 1
                Layout.fillHeight: true
                color: "#e5e5e5"
            }

            // 右侧聊天区域
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "white"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 聊天顶部栏
                    Rectangle {
                        id: chatHeader
                        Layout.preferredHeight: 60
                        Layout.fillWidth: true
                        color: "#f9f9f9"

                        RowLayout {
                            anchors.fill: parent
                            spacing: 10

                            Text {
                                text: contactList.currentItem ? contactList.currentItem.model.name : "选择对话"
                                font.pixelSize: 18
                                font.bold: true
                                Layout.leftMargin: 15
                            }

                            Item { Layout.fillWidth: true }

                            Button {
                                icon.source: "qrc:/icons/voice.svg"
                                flat: true
                            }

                            Button {
                                icon.source: "qrc:/icons/video.svg"
                                flat: true
                            }

                            Button {
                                icon.source: "qrc:/icons/more.svg"
                                flat: true
                                Layout.rightMargin: 10
                            }
                        }
                    }

                    // 聊天内容区域
                    Flickable {
                        id: chatFlickable
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        contentHeight: chatColumn.height
                        clip: true
                        boundsBehavior: Flickable.StopAtBounds

                        Column {
                            id: chatColumn
                            width: chatFlickable.width
                            spacing: 15
                            padding: 10

                            // 日期分隔
                            Item {
                                width: parent.width
                                height: 30

                                Rectangle {
                                    anchors.centerIn: parent
                                    width: dateText.width + 20
                                    height: dateText.height + 10
                                    radius: 15
                                    color: "#d8d8d8"

                                    Text {
                                        id: dateText
                                        anchors.centerIn: parent
                                        text: "今天"
                                        color: "white"
                                        font.pixelSize: 12
                                    }
                                }
                            }

                            Repeater {
                                id: chatRepeater
                                model: ListModel {
                                    id: chatModel
                                }

                                delegate: Row {
                                    width: parent.width
                                    spacing: 10
                                    layoutDirection: fromMe ? Qt.RightToLeft : Qt.LeftToRight

                                    // 头像
                                    Rectangle {
                                        width: 40
                                        height: 40
                                        radius: 4
                                        color: fromMe ? "#07C160" : "#10AEFF"

                                        Text {
                                            anchors.centerIn: parent
                                            text: fromMe ? "我" : (contactList.currentItem ? contactList.currentItem.model.name.substring(0, 1) : "?")
                                            color: "white"
                                            font.pixelSize: 16
                                            font.bold: true
                                        }
                                    }

                                    // 消息气泡
                                    Column {
                                        spacing: 5

                                        Rectangle {
                                            width: Math.min(messageText.width + 20, chatColumn.width * 0.7)
                                            height: messageText.height + 20
                                            radius: 5
                                            color: fromMe ? "#95EC69" : "#FFFFFF"
                                            border.color: fromMe ? "#85D85A" : "#E5E5E5"
                                            border.width: 1

                                            Text {
                                                id: messageText
                                                anchors.centerIn: parent
                                                width: implicitWidth
                                                text: model.text
                                                color: fromMe ? "black" : "#333333"
                                                wrapMode: Text.Wrap
                                                padding: 10
                                            }
                                        }

                                        Text {
                                            text: model.time
                                            color: "#999999"
                                            font.pixelSize: 12
                                            anchors.right: fromMe ? undefined : parent.right
                                        }
                                    }
                                }
                            }
                        }

                        ScrollBar.vertical: ScrollBar {
                            policy: ScrollBar.AsNeeded
                        }

                        onContentHeightChanged: {
                            if (contentHeight > height) {
                                contentY = contentHeight - height
                            }
                        }
                    }

                    // 输入区域
                    Rectangle {
                        id: inputArea
                        Layout.preferredHeight: 140
                        Layout.fillWidth: true
                        color: "#f5f5f5"
                        border.color: "#e5e5e5"
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            spacing: 10
                            anchors.margins: 10

                            Button {
                                icon.source: "qrc:/icons/emoji.svg"
                                flat: true
                            }

                            Button {
                                icon.source: "qrc:/icons/add.svg"
                                flat: true
                            }

                            TextField {
                                id: messageInput
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                placeholderText: "输入消息..."
                                background: Rectangle {
                                    color: "white"
                                    radius: 4
                                    border.color: "#e5e5e5"
                                    border.width: 1
                                }
                            }

                            Button {
                                text: "发送"
                                Material.background: "#07C160"
                                Material.foreground: "white"

                                onClicked: {
                                    if (messageInput.text.trim() !== "") {
                                        chatModel.append({fromMe: true, text: messageInput.text, time: new Date().toLocaleTimeString(Qt.locale(), "hh:mm")})
                                        messageInput.text = ""

                                        // 模拟回复
                                        if (Math.random() > 0.3) {
                                            timer.start()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // 模拟回复计时器
    Timer {
        id: timer
        interval: 1000 + Math.random() * 2000
        onTriggered: {
            var replies = [
                "好的，没问题！",
                "让我考虑一下...",
                "听起来不错！",
                "稍后回复你",
                "👍",
                "明天见面聊吧",
                "我需要查一下日程"
            ]
            var randomReply = replies[Math.floor(Math.random() * replies.length)]
            chatModel.append({fromMe: false, text: randomReply, time: new Date().toLocaleTimeString(Qt.locale(), "hh:mm")})
        }
    }

    // 底部导航按钮组件
    component BottomNavButton: Rectangle {
        property string icon: ""
        property string text: ""
        property bool selected: false

        Layout.preferredHeight: parent.height
        color: "transparent"

        Column {
            anchors.centerIn: parent
            spacing: 5

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: icon
                font.pixelSize: 24
                color: selected ? "#07C160" : "#999999"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: parent.parent.text
                font.pixelSize: 12
                color: selected ? "#07C160" : "#999999"
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                parent.selected = true
            }
        }
    }
}
