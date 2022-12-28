import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.XmlListModel 2.0

Window {
    id: window
    visible: true
    width: 400
    height: 500
    title: qsTr("RSS Feed")
    // dark-grey background
    color: "#2d2d2d"

    XmlListModel {
        id: xmlModel
        source: "http://feeds.rssboard.org/rssboard"
        query: "/rss/channel/item"

        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "pubDate"; query: "pubDate/string()" }
    }

    ListView {
        width: 180; height: 300
        model: xmlModel
        delegate: 
            Rectangle {
                width: 10
                height: 50
                    Text { 
                        text: title + ":>> " + pubDate
                        color: "white"
                        font.pixelSize: 12
                    }
                    Rectangle {
                        width: window.width
                        height: 2
                    }
                }
            }
        }
